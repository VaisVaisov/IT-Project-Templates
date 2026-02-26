# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**即开即用的项目模板，支持 VS Code Dev Containers**

*Arch Linux 基础 · Clang 工具链 · AI 编码代理预装*

[模板](#可用模板) • [快速开始](#快速开始) • [安装](#安装) • [Dev Containers](#dev-container-功能) • [CI/CD](#代码质量--cicd)

**[🇬🇧 English](README.md) · [🇷🇺 Русский](README.ru.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## 这是什么？

一套有主见的项目模板，旨在让你在几分钟内从零开始编码。每个模板都附带一个完整配置的基于 Arch Linux 的 **VS Code Dev Container** —— 无论宿主操作系统如何，所有机器的环境完全一致。

### 为什么选择这个而不是空项目？

- 🚀 **零配置时间**：在 VS Code 中打开，点击"Reopen in Container"，立即开始编码
- 🤖 **AI 就绪**：每个容器预装 Claude Code 和 Qwen Code
- 🔒 **质量把关**：pre-commit 钩子在代码进入仓库前拦截问题
- ⚙️ **内置 CI/CD**：用于构建、测试和文档的 GitHub Actions 工作流
- 🌍 **跨平台**：同一脚本在 Linux、macOS 和 Windows 上均可运行

---

## 可用模板

### C/C++ (`c-cpp/`)

| 模板 | 描述 |
| --- | --- |
| `pure` | C/C++，配备 CMake、Ninja、GoogleTest、Doxygen |
| `hybrid` | C/C++ + Python/Cython —— 一个项目包含两种语言 |
| `platformio/` | Arduino、ESP32、STM32 的嵌入式开发 |

### Python (`python/`)

| 模板 | 描述 |
| --- | --- |
| `pure` | Python，配备 pytest、black、isort、pylint、mypy、flake8 |

### PlatformIO 设备 (`c-cpp/platformio/`)

| 设备 | 开发板 |
| --- | --- |
| `arduino-nano` | ATmega328P |
| `arduino-pro-micro` | ATmega32U4 |
| `esp32-devkit` | ESP32 DevKit |
| `stm32f411` | STM32F411 BlackPill |

---

## 快速开始

### Linux / macOS

```bash
# 克隆到任意位置
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# 添加到 PATH（一次性配置）
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # 或 ~/.bashrc
source ~/.zshrc

# 创建新项目
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (PowerShell)

```powershell
# 克隆到任意位置
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates

# 创建新项目
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Pure C:\Projects\my_cpp_app
.\IT-Project-Templates\new-project-script.ps1 -Python -Pure C:\Projects\my_python_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Hybrid C:\Projects\my_hybrid_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -PlatformIO -Esp32Devkit C:\Projects\sensor_node
```

或使用批处理启动器 —— 双击或从 cmd 运行：

```cmd
new-project-shell.bat -CCpp -Pure C:\Projects\my_cpp_app
```

### 创建项目后

1. 在 VS Code 中打开项目文件夹
2. 出现提示时点击 **"Reopen in Container"**（或 `Ctrl+Shift+P` → "Dev Containers: Reopen in Container"）
3. 首次启动时等待容器构建完成
4. pre-commit 钩子自动安装 —— 开始编码！

---

## 使用参考

### Linux / macOS 标志

```
new-project [语言] [类型] [设备] <路径>

语言：
  --c-cpp            C/C++ 项目
  --python           Python 项目

类型：
  --pure             纯 C/C++ 或 Python
  --hybrid           混合 C/C++ + Python/Cython  （仅 --c-cpp）
  --platformio       嵌入式开发                  （仅 --c-cpp）

PlatformIO 设备：
  --arduino-nano
  --arduino-pro-micro
  --esp32-devkit
  --stm32f411
```

### Windows (PowerShell) 标志

```
new-project-script.ps1 [语言] [类型] [设备] <路径>

语言：
  -CCpp              C/C++ 项目
  -Python            Python 项目

类型：
  -Pure              纯 C/C++ 或 Python
  -Hybrid            混合 C/C++ + Python/Cython  （仅 -CCpp）
  -PlatformIO        嵌入式开发                  （仅 -CCpp）

PlatformIO 设备：
  -ArduinoNano
  -ArduinoProMicro
  -Esp32Devkit
  -Stm32f411
```

---

## 安装

### 1. 克隆仓库

```bash
# Linux / macOS
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Windows (PowerShell)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates
```

### 2. 添加到 PATH

**Linux / macOS — Bash：**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**Linux / macOS — Zsh：**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**Windows — 系统 PATH（永久）：**
```powershell
[Environment]::SetEnvironmentVariable(
    "Path",
    "$env:Path;$env:USERPROFILE\IT-Project-Templates",
    "User"
)
```

> **注意（Linux/macOS）：** 克隆后 `new-project.sh` 已具有可执行权限。若没有：`chmod +x new-project.sh`

### 3. 前提条件

| 工具 | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | 必需 — [docker.com](https://www.docker.com/) | 必需 — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **VS Code** | 必需 — [code.visualstudio.com](https://code.visualstudio.com/) | 必需 |
| **Dev Containers 扩展** | 必需 — 从 VS Code 安装 | 必需 |
| **GitHub CLI** | 推荐 — `gh auth login` | 推荐 |
| **Python** | 用于 hybrid/python 模板 | 用于 hybrid/python 模板 |
| **Git** | 必需 | 必需 |

> **GitHub CLI 提示：** 在宿主机上运行一次 `gh auth login`。容器会挂载宿主机的 `~/.config/gh` —— 无需在 Dev Container 内重新认证。

---

## 项目结构

```
IT-Project-Templates/
├── .devcontainer/              # 基础容器（Arch + Zsh + AI 代理）
├── c-cpp/
│   ├── pure/                   # 纯 C/C++ 模板
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB
│   │   ├── .vscode/
│   │   ├── .github/workflows/
│   │   └── ...
│   ├── hybrid/                 # C/C++ + Python/Cython 模板
│   │   ├── .devcontainer/      # Clang + Python + Cython
│   │   ├── .vscode/
│   │   ├── .github/workflows/
│   │   └── ...
│   └── platformio/             # 嵌入式模板
│       ├── .devcontainer/      # 共享 devcontainer（PlatformIO + Clang）
│       ├── .vscode/            # 共享 VS Code 配置
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       └── stm32f411/
├── python/
│   └── pure/                   # 纯 Python 模板
│       ├── .devcontainer/      # Python + pytest + 代码检查工具
│       ├── .vscode/
│       ├── .github/workflows/
│       └── ...
├── meta-template/              # 创建新模板的基础
├── new-project.sh              # Linux / macOS 脚本
├── new-project-script.ps1      # Windows PowerShell 脚本
├── new-project-shell.bat       # Windows 批处理启动器
├── LICENSE
└── README.md
```

---

## Dev Container 功能

每个容器基于 **Arch Linux（最新版）** 构建，包含：

- **Shell**：带 Oh My Zsh + Powerlevel10k 的 Zsh
- **编辑器**：Neovim
- **VCS**：Git、git-delta、GitHub CLI
- **AI 代理**：Claude Code、Qwen Code（来自 AUR）
- **Docker**：Docker + Docker Buildx + Lazydocker（用于容器中运行容器）
- **GitHub 认证**：宿主机 `~/.config/gh` 绑定挂载 —— 无需重新认证

### C/C++ 容器

- Clang、LLD、LLDB、compiler-rt
- CMake、Ninja
- GDB
- cppcheck（静态分析）
- pre-commit

### C/C++ 混合容器

C/C++ 的全部内容，另加：

- Python 3、pip、virtualenv
- Cython、NumPy
- pytest、black、isort、pylint、mypy
- Sphinx（文档）

### Python 容器

- Python 3、pip、virtualenv
- pytest、black、isort、pylint、mypy、flake8
- pre-commit

### PlatformIO 容器

- PlatformIO Core + udev 规则
- Clang、cppcheck（用于代码分析）
- Python 3、pip
- pre-commit
- USB 设备访问（容器以 `--privileged` 运行）

---

## VS Code 扩展

所有模板在 Dev Container 中打开时自动安装扩展，在没有 Docker 时显示为推荐项。

### 通用（所有模板）

| 类别 | 扩展 | 用途 |
| --- | --- | --- |
| **AI** | Claude Code | AI 代理（CLI + VS Code） |
| | TONGYI Lingma | AI 助手和代码补全 |
| | Kilo Code | 支持 400+ 模型的 AI 代理 |
| **Git** | GitLens | 高级 Git 功能（blame、历史） |
| | Git Graph | 可视化提交历史 |
| **代码质量** | Better Comments | 彩色 TODO/FIXME/NOTE 注释 |
| | Code Spell Checker | 代码和注释拼写检查 |
| **Docker** | Docker | 容器管理 |
| **Markdown** | Markdown All in One | 完整 Markdown 支持 |
| | Markdown Converter | 导出为 PDF/HTML/Word |
| **格式** | YAML (Red Hat) | YAML 支持 |
| | JSON (Meezilla) | 增强 JSON 编辑 |

### C/C++ 模板

- **C/C++ Tools** —— IntelliSense 和调试
- **clangd** —— 高级代码分析和导航
- **Code Runner** —— 快速代码执行

### Python 模板

- **Python** + **Pylance** —— 核心支持和语言服务器
- **debugpy** —— Python 调试器
- **Python Envs** —— 虚拟环境管理
- **autodocstring** —— 自动生成 docstring
- **Django** + **Jinja** —— 框架支持（纯 Python）

### 混合模板

C/C++ 和 Python 扩展全部合并。

### PlatformIO 模板

- **PlatformIO IDE** —— 嵌入式开发平台
- **Wokwi Simulator** —— Arduino/ESP32 模拟器
- **C/C++ Tools** —— 微控制器代码支持

---

## 代码质量 & CI/CD

### pre-commit 钩子

钩子在每次提交前自动运行，在 Dev Container 启动时安装（`postCreateCommand`）。

#### C/C++ 项目
- **clang-format** —— 自动代码格式化（LLVM 风格，100 字符限制）
- **clang-tidy** —— 针对 bug 和风格问题的静态分析
- **cppcheck** —— 内存泄漏、空指针检查、未定义行为

#### Python 项目
- **black** —— 代码格式化（符合 PEP 8）
- **isort** —— 导入排序
- **flake8** —— 语法和风格检查
- **mypy** —— 静态类型检查
- **pylint** —— 代码质量分析

#### 所有项目
- YAML 验证
- 大文件检测（> 1 MB）
- 删除行尾空格
- 文件末尾修复
- 合并冲突检测

> 如果钩子失败，提交将被阻止直到问题修复。这可防止损坏的代码进入仓库。

### GitHub Actions

每个模板在 `.github/workflows/ci.yml` 中包含 CI 工作流。

#### C/C++ Pure & Hybrid
- 使用 CMake + Ninja 构建
- 运行 GoogleTest 测试套件
- 生成 Doxygen 文档
- 自动发布文档到 GitHub Pages（仅 main 分支）

#### Python Pure
- 运行 pytest 测试套件
- 代码质量检查（black、isort、flake8、mypy）
- 测试覆盖率报告

#### PlatformIO
- 为目标设备构建固件
- 检查固件大小限制

所有工作流在 **Arch Linux 容器**上运行，与开发环境保持一致。

---

## 许可证

**MIT 许可证** —— Copyright © 2025–2026 Vais Vaisov

可自由使用、修改和分发。

---

## 贡献

欢迎贡献！随时提交 issue 或 Pull Request。

---

<div align="center">

*IT Project Templates —从零到代码，只需几分钟*

</div>
