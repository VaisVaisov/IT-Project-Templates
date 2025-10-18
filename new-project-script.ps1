#requires -Version 5.1

# 📁 Пути
$TEMPLATES_DIR = Join-Path $env:USERPROFILE "IT-Project-Templates"
$CLION_PROJECTS = Join-Path $env:USERPROFILE "CLionProjects"
$PYCHARM_PROJECTS = Join-Path $env:USERPROFILE "PycharmProjects"

# ========================================
# 🔧 Функции
# ========================================

function Show-Usage {
    Write-Host @"
Доступные типы проектов:
  1. Чистый C/C++ (CLion)
  2. Чистый Python (PyCharm)
  3. Jupyter Notebook + Conda (PyCharm)
  4. Гибридный (Cython + C/C++) (CLion)
  5. Embedded (PlatformIO) → Устройства:
        a) Arduino Nano
        b) Arduino Pro Micro
        c) ESP32 DevKit
        d) STM32F411
"@
}

function Test-Conda {
    $conda = Get-Command conda -ErrorAction SilentlyContinue
    return $null -ne $conda
}

function Setup-CondaEnv {
    param([string]$EnvName)
    if (-not (Test-Conda)) {
        Write-Host "❌ Conda не установлена. Установите Miniconda или Anaconda." -ForegroundColor Red
        exit 1
    }
    Write-Host "📁 Создаём Conda-окружение: $EnvName" -ForegroundColor Cyan
    conda create -y -n $EnvName python=3.11 ipykernel jupyter
    conda run -n $EnvName python -m ipykernel install --user --name $EnvName --display-name "Python ($EnvName)"
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
    param([bool]$IsClion, [bool]$IsHybrid, [bool]$IsPureCpp)
    git init | Out-Null
    Write-Host "📁 Инициализируем Git..." -ForegroundColor Cyan

    if ($IsClion -and ($IsHybrid -or $IsPureCpp)) {
        git submodule add https://github.com/google/googletest.git libraries/googletest | Out-Null
        Write-Host "✅ googletest добавлен как submodule" -ForegroundColor Green
    }

    git add . | Out-Null
    git commit -m "feat: initial commit from template" | Out-Null
}

function Build-DockerImages {
    if (Test-Path "Dockerfile.docs" -and (Test-Path "docs/cpp/Doxyfile") -and (Test-Path "docs/python/conf.py")) {
        Write-Host "📁 Собираем образ docs-builder..." -ForegroundColor Cyan
        if (docker build -f Dockerfile.docs -t docs-builder .) {
            Write-Host "✅ Образ docs-builder успешно собран" -ForegroundColor Green
        } else {
            Write-Host "❌ Ошибка: не удалось собрать docs-builder" -ForegroundColor Red
        }
    } else {
        Write-Host "⚠️ Внимание: Dockerfile.docs не найден, пропуск сборки docs-builder" -ForegroundColor Yellow
    }

    if (Test-Path "tools/profiler/Dockerfile") {
        Write-Host "📁 Собираем образ profiler-tool..." -ForegroundColor Cyan
        if (docker build -f tools/profiler/Dockerfile -t profiler-tool .) {
            Write-Host "✅ Образ profiler-tool успешно собран" -ForegroundColor Green
        } else {
            Write-Host "❌ Ошибка: не удалось собрать profiler-tool" -ForegroundColor Red
        }
    } else {
        Write-Host "⚠️ Внимание: Dockerfile для profiler не найден, пропуск сборки" -ForegroundColor Yellow
    }
}

# ========================================
# 🚀 Основной поток
# ========================================

Write-Host "🚀 Создание нового проекта" -ForegroundColor Magenta
$ProjectName = Read-Host "Введите имя проекта"

if ([string]::IsNullOrWhiteSpace($ProjectName)) {
    Write-Host "❌ Имя проекта не может быть пустым." -ForegroundColor Red
    exit 1
}

Show-Usage
$TypeChoice = Read-Host "Выберите тип проекта (1–5)"

switch ($TypeChoice) {
    '1' { $ProjectType = 'pure-cpp'; $IDE = 'clion' }
    '2' { $ProjectType = 'pure-py'; $IDE = 'pycharm' }
    '3' { $ProjectType = 'jupyter'; $IDE = 'pycharm' }
    '4' { $ProjectType = 'hybrid'; $IDE = 'clion' }
    '5' {
        $ProjectType = 'platformio'
        $IDE = 'clion'
        Write-Host "Выберите устройство:" -ForegroundColor Cyan
        Write-Host "  a) Arduino Nano"
        Write-Host "  b) Arduino Pro Micro"
        Write-Host "  c) ESP32 DevKit"
        Write-Host "  d) STM32F411"
        $DeviceChoice = Read-Host "Устройство (a–d)"
        $DeviceMap = @{
            'a' = 'arduino-nano'
            'b' = 'arduino-pro-micro'
            'c' = 'esp32-devkit'
            'd' = 'stm32f411'
        }
        if (-not $DeviceMap.ContainsKey($DeviceChoice)) {
            Write-Host "❌ Неверный выбор устройства." -ForegroundColor Red
            exit 1
        }
        $Device = $DeviceMap[$DeviceChoice]
    }
    default {
        Write-Host "❌ Неверный тип проекта." -ForegroundColor Red
        exit 1
    }
}

# Определяем папку назначения
if ($IDE -eq 'clion') {
    $Dest = Join-Path $CLION_PROJECTS $ProjectName
    $TemplateBase = Join-Path $TEMPLATES_DIR "clion"
} else {
    $Dest = Join-Path $PYCHARM_PROJECTS $ProjectName
    $TemplateBase = Join-Path $TEMPLATES_DIR "pycharm"
}

# Определяем шаблон
switch ($ProjectType) {
    'pure-cpp' { $Template = Join-Path $TemplateBase "pure-c-cpp" }
    'pure-py'  { $Template = Join-Path $TemplateBase "pure-python" }
    'jupyter'  { $Template = Join-Path $TemplateBase "jupyter" }
    'hybrid'   { $Template = Join-Path $TemplateBase "hybrid" }
    'platformio' { $Template = Join-Path $TemplateBase "platformio" $Device }
}

if (-not (Test-Path $Template)) {
    Write-Host "❌ Шаблон не найден: $Template" -ForegroundColor Red
    Write-Host "Проверьте папку: $TEMPLATES_DIR" -ForegroundColor Yellow
    exit 1
}

# Копируем шаблон
Write-Host "📁 Создаём проект: $ProjectName" -ForegroundColor Cyan
Copy-Item -Path $Template -Destination $Dest -Recurse
Set-Location $Dest

# Замена плейсхолдеров
Replace-Placeholders -ProjectName $ProjectName

# Виртуальные окружения
$IsClion = ($IDE -eq 'clion')
$IsPureCpp = ($ProjectType -eq 'pure-cpp')
$IsHybrid = ($ProjectType -eq 'hybrid')
$IsPurePy = ($ProjectType -eq 'pure-py')
$IsJupyter = ($ProjectType -eq 'jupyter')

if (($IsClion -and $IsHybrid) -or ($IDE -eq 'pycharm' -and $IsPurePy)) {
    Write-Host "📁 Создаём виртуальное окружение .venv" -ForegroundColor Cyan
    python -m venv .venv
    .\.venv\Scripts\Activate.ps1
    python -m pip install --upgrade pip
    if (Test-Path "requirements.txt") {
        pip install -r requirements.txt
    }
}

if ($IsJupyter) {
    Setup-CondaEnv -EnvName $ProjectName
}

# Git
Initialize-Git -IsClion $IsClion -IsHybrid $IsHybrid -IsPureCpp $IsPureCpp

# Docker (только для CLion)
if ($IsClion) {
    Build-DockerImages
}

# ========================================
# 💡 Подсказки
# ========================================

Write-Host ""
Write-Host "✅ Проект '$ProjectName' успешно создан в $Dest" -ForegroundColor Green
Write-Host ""

if ($IsClion) {
    Write-Host "💡 Для CLion:" -ForegroundColor Magenta
    Write-Host "   mkdir build && cd build"
    Write-Host "   cmake .."
    Write-Host "   cmake --build ."
    Write-Host "   ctest"
}

if ($IDE -eq 'pycharm' -or $IsJupyter -or $IsPurePy) {
    Write-Host "💡 Для Python:" -ForegroundColor Magenta
    if ($IsJupyter) {
        Write-Host "   conda activate $ProjectName"
        Write-Host "   jupyter lab"
    } else {
        Write-Host "   .\.venv\Scripts\Activate.ps1"
        Write-Host "   pytest tests/"
    }
}

if ($ProjectType -eq 'platformio') {
    Write-Host "💡 PlatformIO:" -ForegroundColor Magenta
    Write-Host "   platformio run"
    Write-Host "   platformio device list"
}

Write-Host ""
Write-Host "✨ Удачи в разработке!" -ForegroundColor Green
