# IT Project Templates

A collection of ready-to-use project templates with VS Code Dev Containers support. Each template includes pre-configured development environment, tooling, and best practices.

> **Note**: These templates are designed for Arch Linux-based dev containers. All containers use `archlinux:latest` as base image.

## Features

- **Dev Containers** - Consistent development environment across machines
- **Arch Linux base** - Rolling release with latest packages
- **Clang toolchain** - Modern C/C++ compiler with clang-tidy, clang-format
- **Claude Code CLI** - AI-powered coding assistant pre-installed
- **Git & GitHub CLI** - Pre-configured for seamless GitHub integration
- **Oh My Zsh + Powerlevel10k** - Beautiful and functional terminal
- **Pre-commit hooks** - Automatic code quality checks before each commit
- **CI/CD** - GitHub Actions workflows for automated testing and building
- **C++20 & Python 3.x** - Modern language standards across all templates

## Available Templates

### C/C++ Projects (`c-cpp/`)

| Template      | Description                                  |
| ------------- | -------------------------------------------- |
| `pure`        | Pure C/C++ with CMake, Ninja, GoogleTest     |
| `hybrid`      | C/C++ + Python with Cython support           |
| `platformio/` | Embedded development (Arduino, ESP32, STM32) |

### Python Projects (`python/`)

| Template | Description                                  |
| -------- | -------------------------------------------- |
| `pure`   | Pure Python with pytest, black, pylint, mypy |

### PlatformIO Devices (`c-cpp/platformio/`)

| Device              | Board               |
| ------------------- | ------------------- |
| `arduino-nano`      | ATmega328P          |
| `arduino-pro-micro` | ATmega32U4          |
| `esp32-devkit`      | ESP32 DevKit        |
| `stm32f411`         | STM32F411 BlackPill |

## Quick Start

### Using the script (recommended)

```bash
# Clone the repository
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Create a new project (after installation with PATH configured)
new-project my_project --c-cpp --pure

# Or with full path
~/IT-Project-Templates/new-project my_project --c-cpp --pure
```

### Manual setup

1. Copy desired template to your projects folder
2. Open in VS Code
3. Click "Reopen in Container" when prompted
4. Container automatically named after your project folder
5. Pre-commit hooks installed automatically
6. Start coding!

## Usage Examples

```bash
# Pure C++ project
new-project my_cpp_app --c-cpp --pure

# Python project
new-project my_python_app --python --pure

# Hybrid C++/Python project
new-project my_hybrid_app --c-cpp --hybrid

# ESP32 embedded project
new-project my_sensor --c-cpp --platformio --esp32-devkit

# Arduino Nano project
new-project my_arduino --c-cpp --platformio --arduino-nano
```

## Project Structure

```
IT-Project-Templates/
├── .devcontainer/            # Base container (Arch + zsh + Claude Code)
├── c-cpp/
│   ├── pure/                 # Pure C/C++ template
│   │   ├── .devcontainer/
│   │   ├── .vscode/
│   │   └── ...
│   ├── hybrid/               # C/C++ + Python template
│   │   ├── .devcontainer/
│   │   ├── .vscode/
│   │   └── ...
│   └── platformio/           # Embedded templates
│       ├── .devcontainer/    # Shared devcontainer
│       ├── .vscode/          # Shared VS Code config
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       └── stm32f411/
├── python/
│   └── pure/                 # Pure Python template
│       ├── .devcontainer/
│       ├── .vscode/
│       └── ...
├── new-project.sh            # Linux/macOS script
├── new-project-script.ps1    # Windows PowerShell script
├── new-project-shell.bat     # Windows batch launcher
├── LICENSE
└── README.md
```

## Dev Container Features

Each container includes:

- **Base**: Arch Linux (latest)
- **Shell**: Zsh with Oh My Zsh + Powerlevel10k
- **Editor**: nvim, vim
- **VCS**: Git, git-delta, GitHub CLI
- **AI**: Claude Code CLI

### C/C++ containers additionally include:
- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB (for compatibility)
- cppcheck (static analysis)
- pre-commit (automatic code quality checks)

### Python containers additionally include:
- Python 3.x
- pytest, black, isort, pylint, mypy, flake8
- virtualenv
- pre-commit (automatic code quality checks)

### PlatformIO containers additionally include:
- PlatformIO Core
- USB device access (--privileged)
- Clang, cppcheck (for code analysis)
- pre-commit (automatic code quality checks)

### Base container (`.devcontainer/`)
Minimal setup for general development:
- Arch Linux + zsh + Powerlevel10k
- Git, GitHub CLI, Claude Code
- No language-specific tools

## VS Code Extensions

All templates include pre-configured extensions that:
- **Install automatically** when opening project in Dev Container
- **Show as recommendations** when opening without Docker

### Common Extensions (all templates)

| Category              | Extension                                  | Purpose                                    |
| --------------------- | ------------------------------------------ | ------------------------------------------ |
| **AI & Code Quality** | Claude Code                                | AI-powered coding assistant                |
|                       | IntelliCode                                | AI-based code suggestions                  |
|                       | Better Comments                            | Colorful comments (TODO, FIXME, etc.)      |
|                       | Code Spell Checker                         | Spell checking in code and comments        |
| **Git**               | GitLens                                    | Advanced Git features (blame, history)     |
|                       | Git Graph                                  | Visual commit history graph                |
| **Markdown**          | Markdown All in One                        | Complete Markdown support                  |
|                       | Markdown Converter                         | Convert Markdown to PDF/HTML/Word          |
|                       | Markdown Table                             | Table editing in Markdown                  |
| **Data Formats**      | YAML (Red Hat)                             | YAML file support                          |
|                       | JSON (Meezilla)                            | Enhanced JSON editing                      |
| **Code Execution**    | Code Runner                                | Quick code execution                       |

### Language-Specific Extensions

#### C/C++ Templates
- **C/C++ Tools** - Debugging, IntelliSense
- **clangd** - Advanced code analysis and navigation
- **Code Runner** - Quick C/C++ code execution

#### Python Templates
- **Python** - Core Python support
- **Pylance** - Fast Python language server
- **debugpy** - Python debugger
- **Python Envs** - Virtual environment management
- **Python Extension Pack** - Collection of useful Python tools
- **autodocstring** - Auto-generate docstrings
- **Python Indent** - Smart Python indentation
- **Python Path** - Python path management
- **Django** - Django framework support (Pure Python template)
- **Jinja** - Jinja2 template syntax (Pure Python template)

#### Hybrid (C/C++ + Python) Templates
Includes both C/C++ and Python extensions listed above

#### PlatformIO Templates
- **PlatformIO IDE** - Embedded development platform
- **Wokwi Simulator** - Arduino/ESP32 simulator
- **C/C++ Tools** - For microcontroller code

## Code Quality & CI/CD

All templates include automated code quality tools and continuous integration:

### Pre-commit Hooks

Pre-commit hooks are **automatically installed** when you open a project in Dev Container. They run before each commit to ensure code quality:

#### C/C++ Projects
- **clang-format** - Automatic code formatting (LLVM style, 100 char limit)
- **clang-tidy** - Static analysis for bugs and style issues
- **cppcheck** - Additional static analysis (memory leaks, null pointers, etc.)

#### Python Projects
- **black** - Code formatting (PEP 8 compliant)
- **isort** - Import statement sorting
- **flake8** - Syntax and style linting
- **mypy** - Type checking
- **pylint** - Code quality analysis

#### All Projects
- YAML validation
- Large file detection (>1MB)
- Trailing whitespace removal
- End-of-file fixer
- Merge conflict detection

**Note:** If a check fails, the commit is blocked until you fix the issues. This prevents broken code from entering the repository.

### GitHub Actions CI/CD

Each template includes GitHub Actions workflows in `.github/workflows/ci.yml`:

#### C/C++ Pure & Hybrid
```yaml
on: [push, pull_request]
```
- Build with CMake + Ninja
- Run GoogleTest suites
- Generate Doxygen documentation
- Auto-publish docs to GitHub Pages (main branch only)

#### Python Pure
- Run pytest test suite
- Code quality checks (black, isort, flake8, mypy)
- Test coverage reports

#### PlatformIO
- Build firmware for each device (Arduino, ESP32, STM32)
- Run embedded tests (if available)
- Check firmware size limits

**All workflows run on Arch Linux containers** for consistency with dev environment.

## Requirements

- [Docker](https://www.docker.com/)
- [VS Code](https://code.visualstudio.com/)
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Installation

### 1. Clone the repository

Choose a location for the templates (recommended: home directory):

```bash
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates
cd ~/IT-Project-Templates
```

### 2. Create symlink for easy access

Create a symlink without the `.sh` extension so you can use it as a regular command:

```bash
# Create symlink
ln -s ~/IT-Project-Templates/new-project.sh ~/IT-Project-Templates/new-project

# Make sure the original script is executable
chmod +x ~/IT-Project-Templates/new-project.sh
```

### 3. Add to PATH (recommended)

To use the `new-project` command from anywhere, add the repository folder to your PATH:

**For Bash (~/.bashrc):**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**For Zsh (~/.zshrc):**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

After this, you can use `new-project` command from any directory!

### 4. Verify installation

```bash
# Should work from any directory now
new-project
```

## License

MIT

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
