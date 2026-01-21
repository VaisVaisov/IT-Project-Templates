#requires -Version 5.1

# Paths
$TEMPLATES_DIR = Join-Path $env:USERPROFILE "IT-Project-Templates"
$PROJECTS_DIR = Join-Path $env:USERPROFILE "Projects"

# ========================================
# Functions
# ========================================

function Show-Usage {
    Write-Host @"
Available project types:
  1. Pure C/C++
  2. Pure Python
  3. Hybrid (Cython + C/C++)
  4. Embedded (PlatformIO) -> Devices:
        a) Arduino Nano
        b) Arduino Pro Micro
        c) ESP32 DevKit
        d) STM32F411
"@
}

function Replace-Placeholders {
    param([string]$ProjectName)
    Get-ChildItem -Recurse -Include "*.in", "*.template" | ForEach-Object {
        (Get-Content $_.FullName) -replace '@PROJECT_NAME@', $ProjectName | Set-Content $_.FullName
        $newName = $_.Name -replace '\.(in|template)$', ''
        Rename-Item $_.FullName -NewName $newName
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
        if (docker build -f Dockerfile.docs -t docs-builder .) {
            Write-Host "docs-builder image built successfully" -ForegroundColor Green
        } else {
            Write-Host "Error: failed to build docs-builder" -ForegroundColor Red
        }
    } else {
        Write-Host "Note: Dockerfile.docs not found, skipping docs-builder" -ForegroundColor Yellow
    }

    if (Test-Path "tools/profiler/Dockerfile") {
        Write-Host "Building profiler-tool image..." -ForegroundColor Cyan
        if (docker build -f tools/profiler/Dockerfile -t profiler-tool .) {
            Write-Host "profiler-tool image built successfully" -ForegroundColor Green
        } else {
            Write-Host "Error: failed to build profiler-tool" -ForegroundColor Red
        }
    } else {
        Write-Host "Note: profiler Dockerfile not found, skipping" -ForegroundColor Yellow
    }
}

# ========================================
# Main flow
# ========================================

Write-Host "Creating new project" -ForegroundColor Magenta
$ProjectName = Read-Host "Enter project name"

if ([string]::IsNullOrWhiteSpace($ProjectName)) {
    Write-Host "Error: Project name cannot be empty." -ForegroundColor Red
    exit 1
}

Show-Usage
$TypeChoice = Read-Host "Choose project type (1-4)"

switch ($TypeChoice) {
    '1' { $ProjectType = 'pure'; $LangType = 'c-cpp' }
    '2' { $ProjectType = 'pure'; $LangType = 'python' }
    '3' { $ProjectType = 'hybrid'; $LangType = 'c-cpp' }
    '4' {
        $ProjectType = 'platformio'
        $LangType = 'c-cpp'
        Write-Host "Choose device:" -ForegroundColor Cyan
        Write-Host "  a) Arduino Nano"
        Write-Host "  b) Arduino Pro Micro"
        Write-Host "  c) ESP32 DevKit"
        Write-Host "  d) STM32F411"
        $DeviceChoice = Read-Host "Device (a-d)"
        $DeviceMap = @{
            'a' = 'arduino-nano'
            'b' = 'arduino-pro-micro'
            'c' = 'esp32-devkit'
            'd' = 'stm32f411'
        }
        if (-not $DeviceMap.ContainsKey($DeviceChoice)) {
            Write-Host "Error: Invalid device choice." -ForegroundColor Red
            exit 1
        }
        $Device = $DeviceMap[$DeviceChoice]
    }
    default {
        Write-Host "Error: Invalid project type." -ForegroundColor Red
        exit 1
    }
}

# Determine destination folder
$Dest = Join-Path $PROJECTS_DIR $ProjectName
$TemplateBase = Join-Path $TEMPLATES_DIR $LangType

# Determine template
switch ($ProjectType) {
    'pure'       { $Template = Join-Path $TemplateBase "pure" }
    'hybrid'     { $Template = Join-Path $TemplateBase "hybrid" }
    'platformio' { $Template = Join-Path $TemplateBase "platformio" $Device }
}

if (-not (Test-Path $Template)) {
    Write-Host "Error: Template not found: $Template" -ForegroundColor Red
    Write-Host "Check folder: $TEMPLATES_DIR" -ForegroundColor Yellow
    exit 1
}

# Copy template
Write-Host "Creating project: $ProjectName" -ForegroundColor Cyan
Copy-Item -Path $Template -Destination $Dest -Recurse

# For PlatformIO, also copy common .devcontainer and .vscode
if ($ProjectType -eq 'platformio') {
    $PioBase = Join-Path $TemplateBase "platformio"
    Copy-Item -Path (Join-Path $PioBase ".devcontainer") -Destination $Dest -Recurse -Force
    Copy-Item -Path (Join-Path $PioBase ".vscode") -Destination $Dest -Recurse -Force
}

Set-Location $Dest

# Replace placeholders
Replace-Placeholders -ProjectName $ProjectName

# Virtual environments
$IsPure = ($ProjectType -eq 'pure')
$IsHybrid = ($ProjectType -eq 'hybrid')
$IsPlatformIO = ($ProjectType -eq 'platformio')

if (($LangType -eq 'c-cpp' -and $IsHybrid) -or ($LangType -eq 'python' -and $IsPure)) {
    Write-Host "Creating virtual environment .venv" -ForegroundColor Cyan
    python -m venv .venv
    .\.venv\Scripts\Activate.ps1
    python -m pip install --upgrade pip
    if (Test-Path "requirements.txt") {
        pip install -r requirements.txt
    }
}

# Git
Initialize-Git -LangType $LangType -IsHybrid $IsHybrid -IsPure $IsPure

# Docker (only for C/C++ non-PlatformIO)
if ($LangType -eq 'c-cpp' -and -not $IsPlatformIO) {
    Build-DockerImages
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
        Write-Host "   mkdir build && cd build"
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
