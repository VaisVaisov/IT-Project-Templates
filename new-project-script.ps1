#requires -Version 5.1

$ErrorActionPreference = 'Stop'

# Dynamic path based on script location
$TemplatesDir = $PSScriptRoot

# ========================================
# Functions
# ========================================

function Show-Usage {
    Write-Host @"
Usage: new-project-script.ps1 [flags] <path>
       new-project-shell.bat [flags] <path>

Language flags:
  -CCpp              C/C++ project
  -Python            Python project

Project types:
  -Pure              Pure C/C++ or Python
  -Hybrid            Hybrid (Cython + C/C++)
  -PlatformIO        Embedded (Arduino, ESP32, etc.)

PlatformIO devices:
  -ArduinoNano
  -ArduinoProMicro
  -Esp32Devkit
  -Stm32f411

Examples:
  .\new-project-script.ps1 -CCpp -Pure C:\Projects\my_cpp_app
  .\new-project-script.ps1 -Python -Pure C:\Projects\my_python_app
  .\new-project-script.ps1 -CCpp -Hybrid ..\work\hybrid_project
  .\new-project-script.ps1 -CCpp -PlatformIO -Esp32Devkit .\sensor_node
  .\new-project-script.ps1 -CCpp -PlatformIO -ArduinoNano .\my_arduino
"@
    exit 1
}

function Replace-Placeholders {
    param([string]$ProjectName)
    Get-ChildItem -Recurse -Include "*.in", "*.template" | ForEach-Object {
        (Get-Content $_.FullName) -replace '@PROJECT_NAME@', $ProjectName | Set-Content $_.FullName
        $newName = $_.Name -replace '\.(in|template)$', ''
        Rename-Item $_.FullName -NewName $newName -Force
    }
}

function Initialize-Git {
    param([string]$LangType, [bool]$IsHybrid, [bool]$IsPure)
    git init | Out-Null
    Write-Host "Initializing Git..." -ForegroundColor Cyan

    if ($LangType -eq 'c-cpp' -and ($IsHybrid -or $IsPure)) {
        git submodule add https://github.com/google/googletest.git libraries/googletest | Out-Null
        Write-Host "googletest added as submodule" -ForegroundColor Green
    }

    git add . | Out-Null
    git commit -m "feat: initial commit from template" | Out-Null
}

function Build-DockerImages {
    if ((Test-Path "Dockerfile.docs") -and (Test-Path "docs/cpp/Doxyfile") -and (Test-Path "docs/python/conf.py")) {
        Write-Host "Building docs-builder image..." -ForegroundColor Cyan
        docker build -f Dockerfile.docs -t docs-builder .
        if ($LASTEXITCODE -eq 0) {
            Write-Host "docs-builder image built successfully" -ForegroundColor Green
        } else {
            throw "Failed to build docs-builder image"
        }
    } else {
        Write-Host "Note: Dockerfile.docs not found, skipping docs-builder" -ForegroundColor Yellow
    }

    if (Test-Path "tools/profiler/Dockerfile") {
        Write-Host "Building profiler-tool image..." -ForegroundColor Cyan
        docker build -f tools/profiler/Dockerfile -t profiler-tool .
        if ($LASTEXITCODE -eq 0) {
            Write-Host "profiler-tool image built successfully" -ForegroundColor Green
        } else {
            throw "Failed to build profiler-tool image"
        }
    } else {
        Write-Host "Note: profiler Dockerfile not found, skipping" -ForegroundColor Yellow
    }
}

# ========================================
# Parameters
# ========================================

param(
    [switch]$CCpp,
    [switch]$Python,
    [switch]$Pure,
    [switch]$Hybrid,
    [switch]$PlatformIO,
    [switch]$ArduinoNano,
    [switch]$ArduinoProMicro,
    [switch]$Esp32Devkit,
    [switch]$Stm32f411,
    [Parameter(Position=0)]
    [string]$ProjectPath
)

# ========================================
# Validation
# ========================================

if ([string]::IsNullOrWhiteSpace($ProjectPath)) {
    Write-Host "Error: Project path not specified." -ForegroundColor Red
    Show-Usage
}

if (-not $CCpp -and -not $Python) {
    Write-Host "Error: Specify -CCpp or -Python" -ForegroundColor Red
    Show-Usage
}

if (-not $Pure -and -not $Hybrid -and -not $PlatformIO) {
    Write-Host "Error: Specify project type: -Pure, -Hybrid, or -PlatformIO" -ForegroundColor Red
    Show-Usage
}

if ($Hybrid -and $Python) {
    Write-Host "Error: -Hybrid is only available for -CCpp" -ForegroundColor Red
    Show-Usage
}

if ($PlatformIO -and $Python) {
    Write-Host "Error: -PlatformIO is only available for -CCpp" -ForegroundColor Red
    Show-Usage
}

if ($PlatformIO -and -not ($ArduinoNano -or $ArduinoProMicro -or $Esp32Devkit -or $Stm32f411)) {
    Write-Host "Error: Specify device: -ArduinoNano, -ArduinoProMicro, -Esp32Devkit, or -Stm32f411" -ForegroundColor Red
    Show-Usage
}

# ========================================
# Main flow
# ========================================

$LangType    = if ($CCpp) { 'c-cpp' } else { 'python' }
$IsPure      = $Pure.IsPresent
$IsHybrid    = $Hybrid.IsPresent
$IsPlatformIO = $PlatformIO.IsPresent

$Dest        = [System.IO.Path]::GetFullPath($ProjectPath, (Get-Location).Path)
$ProjectName = [System.IO.Path]::GetFileName($Dest)
$TemplateBase = Join-Path $TemplatesDir $LangType

# Determine template path
if ($Pure) {
    $Template = Join-Path $TemplateBase "pure"
} elseif ($Hybrid) {
    $Template = Join-Path $TemplateBase "hybrid"
} elseif ($PlatformIO) {
    $Device = if     ($ArduinoNano)     { 'arduino-nano' }
              elseif ($ArduinoProMicro) { 'arduino-pro-micro' }
              elseif ($Esp32Devkit)     { 'esp32-devkit' }
              else                      { 'stm32f411' }
    $Template = Join-Path $TemplateBase "platformio" $Device
}

if (-not (Test-Path $Template)) {
    Write-Host "Error: Template not found: $Template" -ForegroundColor Red
    Write-Host "Check folder: $TemplatesDir" -ForegroundColor Yellow
    exit 1
}

if (Test-Path $Dest) {
    Write-Host "Error: Directory already exists: $Dest" -ForegroundColor Red
    exit 1
}

$Created = $false
try {
    Write-Host "Creating project: $ProjectName" -ForegroundColor Cyan
    Copy-Item -Path $Template -Destination $Dest -Recurse
    $Created = $true

    # For PlatformIO, also copy common .devcontainer and .vscode
    if ($PlatformIO) {
        $PioBase = Join-Path $TemplateBase "platformio"
        Copy-Item -Path (Join-Path $PioBase ".devcontainer") -Destination $Dest -Recurse -Force
        Copy-Item -Path (Join-Path $PioBase ".vscode")       -Destination $Dest -Recurse -Force
    }

    Set-Location $Dest

    # Replace placeholders
    Replace-Placeholders -ProjectName $ProjectName

    # Virtual environments
    if (($LangType -eq 'c-cpp' -and $IsHybrid) -or ($LangType -eq 'python' -and $IsPure)) {
        Write-Host "Creating virtual environment .venv" -ForegroundColor Cyan
        python -m venv .venv
        & ".\.venv\Scripts\Activate.ps1"
        python -m pip install --upgrade pip
        if (Test-Path "pyproject.toml") {
            pip install -e ".[dev]"
        }
    }

    # Git
    Initialize-Git -LangType $LangType -IsHybrid $IsHybrid -IsPure $IsPure

    # Docker (only for C/C++ non-PlatformIO)
    if ($LangType -eq 'c-cpp' -and -not $IsPlatformIO) {
        Build-DockerImages
    }

} catch {
    if ($Created -and (Test-Path $Dest)) {
        Write-Host ""
        Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "Cleaning up '$Dest'..." -ForegroundColor Yellow
        Remove-Item -Path $Dest -Recurse -Force
    }
    exit 1
}

# ========================================
# Tips
# ========================================

Write-Host ""
Write-Host "Project '$ProjectName' successfully created in $Dest" -ForegroundColor Green
Write-Host ""

if ($LangType -eq 'c-cpp') {
    if ($IsPlatformIO) {
        Write-Host "Tips for PlatformIO:" -ForegroundColor Magenta
        Write-Host "   pio run"
        Write-Host "   pio run -t upload"
        Write-Host "   pio device monitor"
    } else {
        Write-Host "Tips for C/C++:" -ForegroundColor Magenta
        Write-Host "   mkdir build; cd build"
        Write-Host "   cmake .."
        Write-Host "   cmake --build ."
        Write-Host "   ctest"
    }
}

if ($LangType -eq 'python') {
    Write-Host "Tips for Python:" -ForegroundColor Magenta
    Write-Host "   .\.venv\Scripts\Activate.ps1"
    Write-Host "   pytest tests/"
}

Write-Host ""
Write-Host "Happy coding!" -ForegroundColor Green
