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

## Available Templates

### C/C++ Projects (`c-cpp/`)

| Template | Description |
|----------|-------------|
| `pure` | Pure C/C++ with CMake, Ninja, GoogleTest |
| `hybrid` | C/C++ + Python with Cython support |
| `platformio/` | Embedded development (Arduino, ESP32, STM32) |

### Python Projects (`python/`)

| Template | Description |
|----------|-------------|
| `pure` | Pure Python with pytest, black, pylint, mypy |

### PlatformIO Devices (`c-cpp/platformio/`)

| Device | Board |
|--------|-------|
| `arduino-nano` | ATmega328P |
| `arduino-pro-micro` | ATmega32U4 |
| `esp32-devkit` | ESP32 DevKit |
| `stm32f411` | STM32F411 BlackPill |

## Quick Start

### Using the script (recommended)

```bash
# Clone the repository
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Create a new project
~/IT-Project-Templates/new-project.sh my_project --c-cpp --pure
```

### Manual setup

1. Copy desired template to your projects folder
2. Open in VS Code
3. Click "Reopen in Container" when prompted
4. Start coding!

## Usage Examples

```bash
# Pure C++ project
./new-project.sh my_cpp_app --c-cpp --pure

# Python project
./new-project.sh my_python_app --python --pure

# Hybrid C++/Python project
./new-project.sh my_hybrid_app --c-cpp --hybrid

# ESP32 embedded project
./new-project.sh my_sensor --c-cpp --platformio --esp32-devkit

# Arduino Nano project
./new-project.sh my_arduino --c-cpp --platformio --arduino-nano
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

### Python containers additionally include:
- Python 3.x
- pytest, black, isort, pylint, mypy
- virtualenv

### PlatformIO containers additionally include:
- PlatformIO Core
- USB device access (--privileged)

### Base container (`.devcontainer/`)
Minimal setup for general development:
- Arch Linux + zsh + Powerlevel10k
- Git, GitHub CLI, Claude Code
- No language-specific tools

## VS Code Extensions

Each template comes with recommended extensions:

| Category | Extensions |
|----------|------------|
| **AI** | Claude Code |
| **C/C++** | C/C++, clangd |
| **Python** | Python, Pylance, debugpy |
| **PlatformIO** | PlatformIO IDE, Wokwi Simulator |
| **Git** | GitLens, Git Graph |
| **Markdown** | Markdown All in One |
| **General** | Code Runner, IntelliCode |

## Requirements

- [Docker](https://www.docker.com/)
- [VS Code](https://code.visualstudio.com/)
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## License

MIT

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
