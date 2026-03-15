# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**Ready-to-use project templates with VS Code Dev Containers**

*Arch Linux base · Clang toolchain · AI coding agents pre-installed*

[Templates](#available-templates) • [Quick Start](#quick-start) • [Installation](#installation) • [Dev Containers](#dev-container-features) • [CI/CD](#code-quality--cicd)

**[🇷🇺 Русский](README.ru.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## What is this?

A collection of opinionated project templates designed to get you from zero to coding in minutes. Each template ships with a fully configured **VS Code Dev Container** running Arch Linux — same environment on every machine, regardless of your host OS.

### Why this over a blank project?

- 🚀 **No setup time**: open in VS Code, click "Reopen in Container", start coding
- 🤖 **AI-ready**: Claude Code, Qwen Code and Kilo Code pre-installed in every container
- 🔒 **Quality gates**: pre-commit hooks catch issues before they hit the repo
- ⚙️ **CI/CD included**: GitHub Actions workflows for lint, build, test, coverage, docs and releases
- 📝 **Conventional Commits**: commitlint enforces commit message format out of the box
- 🌍 **Cross-platform**: the same script works on Linux, macOS, and Windows

---

## Available Templates

### C/C++ (`c-cpp/`)

| Template | Description |
| --- | --- |
| `pure` | C/C++ with CMake, Ninja, GoogleTest, Doxygen, lcov coverage |
| `hybrid` | C/C++ + Python/Cython — both languages in one project, Sphinx + ReadTheDocs |
| `platformio/` | Embedded development for Arduino, ESP32, STM32 |

### Python (`python/`)

| Template | Description |
| --- | --- |
| `pure` | Python with pytest, ruff, pylint, mypy, Sphinx + ReadTheDocs |

### PlatformIO Devices (`c-cpp/platformio/`)

| Device | Board |
| --- | --- |
| `arduino-nano` | ATmega328P |
| `arduino-pro-micro` | ATmega32U4 |
| `esp32-devkit` | ESP32 DevKit |
| `stm32f411` | STM32F411 BlackPill |

---

## Quick Start

### Linux / macOS

```bash
# Clone anywhere you like
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Add to PATH (one-time setup)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # or ~/.bashrc
source ~/.zshrc

# Create a new project
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (PowerShell)

```powershell
# Clone anywhere you like
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates

# Create a new project
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Pure C:\Projects\my_cpp_app
.\IT-Project-Templates\new-project-script.ps1 -Python -Pure C:\Projects\my_python_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Hybrid C:\Projects\my_hybrid_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -PlatformIO -Esp32Devkit C:\Projects\sensor_node
```

Or use the batch launcher — just double-click or run from cmd:

```cmd
new-project-shell.bat -CCpp -Pure C:\Projects\my_cpp_app
```

### After creating a project

1. Open the project folder in VS Code
2. Click **"Reopen in Container"** when prompted (or `Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. Wait for the container to build on first launch
4. Pre-commit hooks install automatically — you're good to go!

---

## Usage Reference

### Linux / macOS flags

```
new-project [language] [type] [device] <path>

Language:
  --c-cpp            C/C++ project
  --python           Python project

Type:
  --pure             Pure C/C++ or Python
  --hybrid           Hybrid C/C++ + Python/Cython  (--c-cpp only)
  --platformio       Embedded development          (--c-cpp only)

PlatformIO devices:
  --arduino-nano
  --arduino-pro-micro
  --esp32-devkit
  --stm32f411
```

### Windows (PowerShell) flags

```
new-project-script.ps1 [language] [type] [device] <path>

Language:
  -CCpp              C/C++ project
  -Python            Python project

Type:
  -Pure              Pure C/C++ or Python
  -Hybrid            Hybrid C/C++ + Python/Cython  (-CCpp only)
  -PlatformIO        Embedded development          (-CCpp only)

PlatformIO devices:
  -ArduinoNano
  -ArduinoProMicro
  -Esp32Devkit
  -Stm32f411
```

---

## Installation

### 1. Clone the repository

```bash
# Linux / macOS
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Windows (PowerShell)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates
```

### 2. Add to PATH

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

**Windows — System PATH (permanent):**
```powershell
[Environment]::SetEnvironmentVariable(
    "Path",
    "$env:Path;$env:USERPROFILE\IT-Project-Templates",
    "User"
)
```

> **Note (Linux/macOS):** `new-project.sh` is already executable after cloning. If not: `chmod +x new-project.sh`

### 3. Prerequisites

| Tool | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Required — [docker.com](https://www.docker.com/) | Required — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **VS Code** | Required — [code.visualstudio.com](https://code.visualstudio.com/) | Required |
| **Dev Containers extension** | Required — install from VS Code | Required |
| **GitHub CLI** | Recommended — `gh auth login` | Recommended |
| **Python** | For hybrid/python templates | For hybrid/python templates |
| **Git** | Required | Required |

> **GitHub CLI tip:** authenticate once on the host with `gh auth login`. The container bind-mounts `~/.config/gh` from your host — no re-authentication needed inside Dev Containers.

---

## Project Structure

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # Automated dependency updates (Actions + pre-commit)
├── c-cpp/
│   ├── pure/                   # Pure C/C++ template
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
│   ├── hybrid/                 # C/C++ + Python/Cython template
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
│   └── platformio/             # Embedded templates
│       ├── .devcontainer/      # Shared devcontainer (PlatformIO + Clang)
│       ├── .vscode/            # Shared VS Code config
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       └── stm32f411/
├── python/
│   └── pure/                   # Pure Python template
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
├── meta-template/              # Base for creating new templates
├── new-project.sh              # Linux / macOS script
├── new-project-script.ps1      # Windows PowerShell script
├── new-project-shell.bat       # Windows batch launcher
├── LICENSE
└── README.md
```

---

## Dev Container Features

Every container is built on **Arch Linux (latest)** and includes:

- **Shell**: Zsh with Oh My Zsh + Powerlevel10k
- **Editor**: Neovim
- **VCS**: Git, git-delta, GitHub CLI
- **AI agents**: Claude Code, Qwen Code, Kilo Code CLI (from AUR) — all available as CLI tools
- **Docker**: Docker + Docker Buildx + Lazydocker (for running containers inside containers)
- **GitHub auth**: `~/.config/gh` bind-mounted from the host — no re-authentication needed

### C/C++ containers

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### C/C++ hybrid containers

Everything from C/C++, plus:

- Python 3, pip, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (documentation)

### Python containers

- Python 3, pip, virtualenv
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo
- pre-commit

### PlatformIO containers

- PlatformIO Core + udev rules
- Clang, cppcheck (for static analysis)
- Python 3, pip
- pre-commit
- USB device access (container runs with `--privileged`)

---

## VS Code Extensions

All templates auto-install extensions when opening in a Dev Container, and show them as recommendations when opening without Docker.

### Common (all templates)

| Category | Extension | Purpose |
| --- | --- | --- |
| **AI** | Claude Code | AI agent (CLI + VS Code) |
| | TONGYI Lingma | AI assistant and code completion |
| | Kilo Code | AI agent supporting 400+ models |
| **Git** | GitLens | Advanced Git features (blame, history) |
| | Git Graph | Visual commit history |
| **Code Quality** | Better Comments | Colorful TODO/FIXME/NOTE comments |
| | Code Spell Checker | Spell checking in code and comments |
| **Docker** | Docker | Container management |
| **Markdown** | Markdown All in One | Full Markdown support |
| | Markdown Converter | Export to PDF/HTML/Word |
| **Formats** | YAML (Red Hat) | YAML support |
| | JSON (Meezilla) | Enhanced JSON editing |

### C/C++ templates

- **C/C++ Tools** — IntelliSense and debugging
- **clangd** — Advanced code analysis and navigation
- **Code Runner** — Quick code execution

### Python templates

- **Python** + **Pylance** — Core support and language server
- **debugpy** — Python debugger
- **Python Envs** — Virtual environment management
- **autodocstring** — Auto-generate docstrings
- **Django** + **Jinja** — Framework support (Pure Python)

### Hybrid templates

All C/C++ and Python extensions combined.

### PlatformIO templates

- **PlatformIO IDE** — Embedded development platform
- **Wokwi Simulator** — Interactive Arduino/ESP32/STM32 simulator directly in VS Code
- **C/C++ Tools** — Microcontroller code support

---

## Code Quality & CI/CD

### Pre-commit Hooks

Hooks run automatically before each commit. Both regular hooks and the commit-msg hook are installed when the Dev Container starts (`postCreateCommand`).

#### C/C++ projects
- **clang-format** — Automatic code formatting (LLVM style)
- **clang-tidy** — Static analysis for bugs and style issues
- **cppcheck** — Memory leaks, null pointer checks, undefined behaviour
- **valgrind memcheck** — Runtime memory error detection (hybrid + pure)

#### Python projects
- **ruff** — Fast linting + import sorting (replaces flake8 + isort)
- **ruff-format** — Code formatting (black-compatible)
- **pylint** — Deep semantic analysis: unreachable code, wrong argument counts, missing attributes
- **mypy** — Static type checking

#### All projects
- **commitlint** — Enforces [Conventional Commits](https://www.conventionalcommits.org/) format
- YAML validation
- Large file detection (> 1 MB)
- Trailing whitespace removal
- End-of-file fixer
- Merge conflict detection

> If a hook fails, the commit is blocked until the issue is fixed. This keeps broken code out of the repository.

### GitHub Actions

Each template includes two workflows: `ci.yml` (runs on every push/PR) and `release.yml` (runs on `v*` tags).

#### C/C++ Pure & Hybrid
- **Lint**: pre-commit checks (clang-format, clang-tidy, cppcheck, commitlint)
- **Build**: CMake Debug + Release presets
- **Test**: GoogleTest suites via ctest
- **Coverage**: gcov + lcov — HTML report uploaded as artifact
- **Docs**: Doxygen (pure) or Doxygen + Sphinx/furo (hybrid)
- **Pages**: auto-publish docs to GitHub Pages on `main`
- **Release**: on `v*` tag — builds binaries + Python wheel, creates GitHub Release

#### Python Pure
- **Lint**: pre-commit checks (ruff, pylint, mypy, commitlint)
- **Test**: pytest
- **Coverage**: pytest-cov — XML report + artifact
- **Docs**: Sphinx + furo, published via ReadTheDocs
- **Release**: on `v*` tag — builds wheel + sdist, creates GitHub Release

#### PlatformIO
- **Lint**: pre-commit checks (clang-format, cppcheck, commitlint)
- **Build**: `pio run` — firmware compilation
- **Test**: `pio test` (if test directory exists)
- **Size**: `pio run --target size` — firmware size report
- **Static analysis**: `pio check --fail-on-defect high`
- **Wokwi CI**: cloud firmware simulation — verifies Serial output without physical hardware (requires `WOKWI_CLI_TOKEN` in GitHub Secrets, 50 min/month free)
- **Release**: on `v*` tag — uploads `.elf`/`.hex`/`.bin` to GitHub Release

> **Wokwi CI and the VS Code extension** share the same `diagram.json` — the circuit drawn on [wokwi.com](https://wokwi.com). See `@PROJECT_NAME@.md` in your generated project for setup details.

All workflows run on **Arch Linux containers** for consistency with the dev environment.

### Dependabot

A `.github/dependabot.yml` in the root of this repository automatically keeps all templates up to date by opening PRs when new versions are available. Covers:

- **GitHub Actions** versions (actions/checkout, upload-artifact, etc.)
- **pre-commit hook** revisions (clang-format, ruff, mypy, pylint, etc.)

Updates are checked weekly — no manual version tracking needed.

### AI Agent Context

Every generated project includes a `@PROJECT_NAME@.md` file — a single source of truth describing the project architecture, tech stack, build instructions, and rules for AI agents. `CLAUDE.md`, `QWEN.md`, and `AGENTS.md` are symlinks pointing to this file, so Claude Code, Qwen Code, and Kilo Code all read the same context automatically.

---

## Documentation

### C/C++ Pure

Documentation is generated with **Doxygen** and automatically published to **GitHub Pages** on every push to `main`.

### C/C++ Hybrid & Python Pure

Documentation is built with **Sphinx** using the **furo** theme (dark mode support) and published via **ReadTheDocs**. The hybrid template additionally uses **Breathe** to import the C++ API from Doxygen into Sphinx.

To set up ReadTheDocs:
1. Connect your repository at [readthedocs.org](https://readthedocs.org)
2. ReadTheDocs will detect `.readthedocs.yaml` automatically and build on every push

---

## License

**MIT License** — Copyright © 2025–2026 Vais Vaisov

Free to use, modify, and distribute.

---

## Contributing

Contributions are welcome! Feel free to open an issue or submit a Pull Request.

---

<div align="center">

*IT Project Templates — from zero to coding in minutes*

</div>
