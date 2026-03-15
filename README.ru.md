# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**Готовые шаблоны проектов с поддержкой VS Code Dev Containers**

*Arch Linux · Clang toolchain · AI-агенты предустановлены*

[Шаблоны](#доступные-шаблоны) • [Быстрый старт](#быстрый-старт) • [Установка](#установка) • [Dev Containers](#возможности-dev-container) • [CI/CD](#качество-кода--cicd)

**[🇬🇧 English](README.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## Что это такое?

Набор шаблонов проектов, позволяющих начать разработку за считанные минуты. Каждый шаблон поставляется с полностью настроенным **VS Code Dev Container** на основе Arch Linux — одинаковое окружение на любой машине, независимо от хост-системы.

### Зачем это нужно?

- 🚀 **Никакой настройки**: открой в VS Code, нажми "Reopen in Container" — и сразу кодить
- 🤖 **AI-готовность**: Claude Code, Qwen Code и Kilo Code предустановлены в каждом контейнере
- 🔒 **Контроль качества**: pre-commit хуки ловят проблемы до попадания в репозиторий
- ⚙️ **CI/CD из коробки**: GitHub Actions для линтинга, сборки, тестов, покрытия, документации и релизов
- 📝 **Conventional Commits**: commitlint проверяет формат сообщений коммитов
- 🌍 **Кроссплатформенность**: один скрипт работает на Linux, macOS и Windows

---

## Доступные шаблоны

### C/C++ (`c-cpp/`)

| Шаблон | Описание |
| --- | --- |
| `pure` | C/C++ с CMake, Ninja, GoogleTest, Doxygen, покрытие через lcov |
| `hybrid` | C/C++ + Python/Cython — оба языка в одном проекте, Sphinx + ReadTheDocs |
| `platformio/` | Разработка для встраиваемых систем: Arduino, ESP32, STM32 |

### Python (`python/`)

| Шаблон | Описание |
| --- | --- |
| `pure` | Python с pytest, ruff, pylint, mypy, Sphinx + ReadTheDocs |

### Устройства PlatformIO (`c-cpp/platformio/`)

| Устройство | Плата |
| --- | --- |
| `arduino-nano` | ATmega328P |
| `arduino-pro-micro` | ATmega32U4 |
| `esp32-devkit` | ESP32 DevKit |
| `stm32f411` | STM32F411 BlackPill |

---

## Быстрый старт

### Linux / macOS

```bash
# Клонировать в любое место
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Добавить в PATH (один раз)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # или ~/.bashrc
source ~/.zshrc

# Создать новый проект
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (PowerShell)

```powershell
# Клонировать в любое место
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates

# Создать новый проект
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Pure C:\Projects\my_cpp_app
.\IT-Project-Templates\new-project-script.ps1 -Python -Pure C:\Projects\my_python_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Hybrid C:\Projects\my_hybrid_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -PlatformIO -Esp32Devkit C:\Projects\sensor_node
```

Или через bat-лаунчер — двойной клик или запуск из cmd:

```cmd
new-project-shell.bat -CCpp -Pure C:\Projects\my_cpp_app
```

### После создания проекта

1. Открой папку проекта в VS Code
2. Нажми **"Reopen in Container"** (или `Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. При первом запуске контейнер соберётся автоматически
4. Pre-commit хуки установятся сами — можно приступать!

---

## Справка по флагам

### Linux / macOS

```
new-project [язык] [тип] [устройство] <путь>

Язык:
  --c-cpp            C/C++ проект
  --python           Python проект

Тип:
  --pure             Чистый C/C++ или Python
  --hybrid           Гибридный C/C++ + Python/Cython  (только --c-cpp)
  --platformio       Встраиваемые системы             (только --c-cpp)

Устройства PlatformIO:
  --arduino-nano
  --arduino-pro-micro
  --esp32-devkit
  --stm32f411
```

### Windows (PowerShell)

```
new-project-script.ps1 [язык] [тип] [устройство] <путь>

Язык:
  -CCpp              C/C++ проект
  -Python            Python проект

Тип:
  -Pure              Чистый C/C++ или Python
  -Hybrid            Гибридный C/C++ + Python/Cython  (только -CCpp)
  -PlatformIO        Встраиваемые системы             (только -CCpp)

Устройства PlatformIO:
  -ArduinoNano
  -ArduinoProMicro
  -Esp32Devkit
  -Stm32f411
```

---

## Установка

### 1. Клонировать репозиторий

```bash
# Linux / macOS
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Windows (PowerShell)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates
```

### 2. Добавить в PATH

**Linux / macOS — Bash:**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**Linux / macOS — Zsh:**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**Windows — постоянный PATH:**
```powershell
[Environment]::SetEnvironmentVariable(
    "Path",
    "$env:Path;$env:USERPROFILE\IT-Project-Templates",
    "User"
)
```

> **Примечание (Linux/macOS):** `new-project.sh` уже исполняемый после клонирования. Если нет: `chmod +x new-project.sh`

### 3. Требования

| Инструмент | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Обязательно — [docker.com](https://www.docker.com/) | Обязательно — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **VS Code** | Обязательно — [code.visualstudio.com](https://code.visualstudio.com/) | Обязательно |
| **Dev Containers extension** | Обязательно — установить из VS Code | Обязательно |
| **GitHub CLI** | Рекомендуется — `gh auth login` | Рекомендуется |
| **Python** | Для hybrid/python шаблонов | Для hybrid/python шаблонов |
| **Git** | Обязательно | Обязательно |

> **Совет по GitHub CLI:** авторизуйся один раз на хосте через `gh auth login`. Контейнер монтирует `~/.config/gh` с хоста — повторная авторизация внутри Dev Container не нужна.

---

## Структура репозитория

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # Автообновление зависимостей (Actions + pre-commit)
├── c-cpp/
│   ├── pure/                   # Чистый C/C++ шаблон
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB + lcov
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── .editorconfig
│   │   ├── .gitattributes
│   │   ├── .pre-commit-config.yaml
│   │   ├── commitlint.config.js
│   │   └── ...
│   ├── hybrid/                 # C/C++ + Python/Cython шаблон
│   │   ├── .devcontainer/      # Clang + Python + Cython + ruff + pylint
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── .readthedocs.yaml
│   │   ├── .editorconfig
│   │   ├── .gitattributes
│   │   ├── .pre-commit-config.yaml
│   │   ├── commitlint.config.js
│   │   └── ...
│   └── platformio/             # Шаблоны для встраиваемых систем
│       ├── .devcontainer/      # Общий devcontainer (PlatformIO + Clang)
│       ├── .vscode/            # Общая конфигурация VS Code
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       └── stm32f411/
├── python/
│   └── pure/                   # Чистый Python шаблон
│       ├── .devcontainer/      # Python + ruff + pylint + mypy
│       ├── .github/
│       │   ├── workflows/      # ci.yml + release.yml
│       │   └── ISSUE_TEMPLATE/
│       ├── .vscode/
│       ├── .readthedocs.yaml
│       ├── .editorconfig
│       ├── .gitattributes
│       ├── .pre-commit-config.yaml
│       ├── commitlint.config.js
│       └── ...
├── meta-template/              # Основа для создания новых шаблонов
├── new-project.sh              # Скрипт для Linux / macOS
├── new-project-script.ps1      # Скрипт для Windows (PowerShell)
├── new-project-shell.bat       # Bat-лаунчер для Windows
├── LICENSE
└── README.md
```

---

## Возможности Dev Container

Каждый контейнер собран на **Arch Linux (latest)** и включает:

- **Оболочка**: Zsh с Oh My Zsh + Powerlevel10k
- **Редактор**: Neovim
- **VCS**: Git, git-delta, GitHub CLI
- **AI-агенты**: Claude Code, Qwen Code, Kilo Code CLI (из AUR) — все доступны как CLI-инструменты
- **Docker**: Docker + Docker Buildx + Lazydocker (для запуска контейнеров внутри контейнеров)
- **GitHub auth**: `~/.config/gh` монтируется с хоста — повторная авторизация не нужна

### C/C++ контейнеры

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### Гибридные контейнеры (C/C++ + Python)

Всё из C/C++, плюс:

- Python 3, pip, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (документация)

### Python контейнеры

- Python 3, pip, virtualenv
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo
- pre-commit

### PlatformIO контейнеры

- PlatformIO Core + udev правила
- Clang, cppcheck (статический анализ)
- Python 3, pip
- pre-commit
- Доступ к USB-устройствам (контейнер запускается с `--privileged`)

---

## Расширения VS Code

Все шаблоны автоматически устанавливают расширения при открытии в Dev Container и показывают их как рекомендации при открытии без Docker.

### Общие (все шаблоны)

| Категория | Расширение | Назначение |
| --- | --- | --- |
| **AI** | Claude Code | AI-агент (CLI + VS Code) |
| | TONGYI Lingma | AI-ассистент и автодополнение |
| | Kilo Code | AI-агент с поддержкой 400+ моделей |
| **Git** | GitLens | Расширенные возможности Git (blame, история) |
| | Git Graph | Визуальный граф коммитов |
| **Качество кода** | Better Comments | Цветные TODO/FIXME/NOTE комментарии |
| | Code Spell Checker | Проверка орфографии в коде и комментариях |
| **Docker** | Docker | Управление контейнерами |
| **Markdown** | Markdown All in One | Полная поддержка Markdown |
| | Markdown Converter | Экспорт в PDF/HTML/Word |
| **Форматы** | YAML (Red Hat) | Поддержка YAML |
| | JSON (Meezilla) | Расширенное редактирование JSON |

### C/C++ шаблоны

- **C/C++ Tools** — IntelliSense и отладка
- **clangd** — Расширенный анализ кода и навигация
- **Code Runner** — Быстрый запуск кода

### Python шаблоны

- **Python** + **Pylance** — Базовая поддержка и языковой сервер
- **debugpy** — Отладчик Python
- **Python Envs** — Управление виртуальными окружениями
- **autodocstring** — Автогенерация docstring
- **Django** + **Jinja** — Поддержка фреймворков (Pure Python)

### Гибридные шаблоны

Все расширения для C/C++ и Python вместе.

### PlatformIO шаблоны

- **PlatformIO IDE** — Платформа для встраиваемых систем
- **Wokwi Simulator** — Интерактивный симулятор Arduino/ESP32/STM32 прямо в VS Code
- **C/C++ Tools** — Поддержка кода для микроконтроллеров

---

## Качество кода & CI/CD

### Pre-commit хуки

Хуки запускаются автоматически перед каждым коммитом. Устанавливаются при старте Dev Container (`postCreateCommand`) — и обычные хуки, и хук для проверки сообщения коммита.

#### C/C++ проекты
- **clang-format** — Автоматическое форматирование кода (стиль LLVM)
- **clang-tidy** — Статический анализ на баги и стилевые проблемы
- **cppcheck** — Утечки памяти, null pointer, неопределённое поведение
- **valgrind memcheck** — Обнаружение ошибок памяти во время выполнения (hybrid + pure)

#### Python проекты
- **ruff** — Быстрый линтинг + сортировка импортов (заменяет flake8 + isort)
- **ruff-format** — Форматирование кода (совместимо с black)
- **pylint** — Глубокий семантический анализ: недостижимый код, неверное количество аргументов, обращение к несуществующим атрибутам
- **mypy** — Статическая проверка типов

#### Все проекты
- **commitlint** — Проверка формата сообщений коммитов по [Conventional Commits](https://www.conventionalcommits.org/)
- Валидация YAML
- Обнаружение больших файлов (> 1 МБ)
- Удаление пробелов в конце строк
- Исправление конца файла
- Обнаружение конфликтов слияния

> Если хук падает — коммит блокируется до исправления проблемы. Это не даёт сломанному коду попасть в репозиторий.

### GitHub Actions

Каждый шаблон включает два воркфлоу: `ci.yml` (запускается на каждый push/PR) и `release.yml` (запускается на тег `v*`).

#### C/C++ Pure & Hybrid
- **Lint**: pre-commit проверки (clang-format, clang-tidy, cppcheck, commitlint)
- **Build**: сборка CMake Debug + Release пресетами
- **Test**: тесты GoogleTest через ctest
- **Coverage**: gcov + lcov — HTML отчёт загружается как артефакт
- **Docs**: Doxygen (pure) или Doxygen + Sphinx/furo (hybrid)
- **Pages**: автопубликация документации на GitHub Pages (только ветка `main`)
- **Release**: на тег `v*` — собирает бинарники + Python wheel, создаёт GitHub Release

#### Python Pure
- **Lint**: pre-commit проверки (ruff, pylint, mypy, commitlint)
- **Test**: pytest
- **Coverage**: pytest-cov — XML отчёт + артефакт
- **Docs**: Sphinx + furo, публикация через ReadTheDocs
- **Release**: на тег `v*` — собирает wheel + sdist, создаёт GitHub Release

#### PlatformIO
- **Lint**: pre-commit проверки (clang-format, cppcheck, commitlint)
- **Build**: `pio run` — компиляция прошивки
- **Test**: `pio test` (если есть директория test)
- **Size**: `pio run --target size` — отчёт о размере прошивки
- **Static analysis**: `pio check --fail-on-defect high`
- **Wokwi CI**: симуляция прошивки в облаке — проверяет вывод в Serial без реального железа (требует `WOKWI_CLI_TOKEN` в GitHub Secrets, 50 мин/месяц бесплатно)
- **Release**: на тег `v*` — загружает `.elf`/`.hex`/`.bin` в GitHub Release

> **Wokwi CI и VS Code расширение** используют один и тот же `diagram.json` — схему, нарисованную на [wokwi.com](https://wokwi.com). Подробнее — в `@PROJECT_NAME@.md` сгенерированного проекта.

Все воркфлоу запускаются на **Arch Linux контейнерах** — для полного соответствия окружению разработки.

### Dependabot

В корне репозитория находится `.github/dependabot.yml` — он автоматически следит за актуальностью версий во всех шаблонах и предлагает обновления через PR. Покрывает:

- **GitHub Actions** — версии actions/checkout, upload-artifact и других
- **pre-commit хуки** — ревизии clang-format, ruff, mypy, pylint и других

Обновления проверяются еженедельно — никакого ручного отслеживания версий.

### AI-контекст для агентов

Каждый сгенерированный проект содержит файл `@PROJECT_NAME@.md` — единый источник правды с описанием архитектуры, стека технологий, инструкций по сборке и правил для AI-агентов. `CLAUDE.md`, `QWEN.md` и `AGENTS.md` являются симлинками на этот файл, поэтому Claude Code, Qwen Code и Kilo Code автоматически читают один и тот же контекст.

---

## Документация

### C/C++ Pure

Документация генерируется через **Doxygen** и автоматически публикуется на **GitHub Pages** при каждом пуше в `main`.

### C/C++ Hybrid & Python Pure

Документация собирается через **Sphinx** с темой **furo** (поддержка тёмной темы) и публикуется через **ReadTheDocs**. Гибридный шаблон дополнительно использует **Breathe** для импорта C++ API из Doxygen в Sphinx.

Для подключения ReadTheDocs:
1. Подключи репозиторий на [readthedocs.org](https://readthedocs.org)
2. ReadTheDocs автоматически обнаружит `.readthedocs.yaml` и начнёт сборку при каждом пуше

---

## Лицензия

**MIT License** — Copyright © 2025–2026 Vais Vaisov

Свободно использовать, изменять и распространять.

---

## Участие в разработке

Мы рады любому вкладу! Открывайте issue или отправляйте Pull Request.

---

<div align="center">

*IT Project Templates — от нуля до кода за минуты*

</div>
