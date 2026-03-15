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

一套项目模板集合，旨在让你在几分钟内从零开始编码。每个模板都附带一个基于 Arch Linux 的完整配置 **VS Code Dev Container** —— 无论宿主操作系统如何，所有机器的环境完全一致。

### 为什么选择这个而不是空项目？

- 🚀 **零配置时间**：在 VS Code 中打开，点击"Reopen in Container"，立即开始编码
- 🤖 **AI 就绪**：每个容器预装 Claude Code、Qwen Code 和 Kilo Code CLI
- 🔒 **质量把关**：pre-commit 钩子在代码进入仓库前拦截问题
- ⚙️ **内置 CI/CD**：用于 linting、构建、测试、覆盖率、文档和发布的 GitHub Actions 工作流
- 📝 **Conventional Commits**：commitlint 验证提交消息格式
- 🌍 **跨平台**：同一脚本在 Linux、macOS 和 Windows 上均可运行（通过 WSL2）

---

## 可用模板

### C/C++ (`c-cpp/`)

| 模板 | 描述 |
| --- | --- |
| `pure` | C/C++，配备 CMake、Ninja、GoogleTest、Doxygen，通过 lcov 进行覆盖率测试 |
| `hybrid` | C/C++ + Python/Cython —— 一个项目包含两种语言，Sphinx + ReadTheDocs |
| `platformio/` | Arduino、ESP32、STM32 的嵌入式开发 |

### Python (`python/`)

| 模板 | 描述 |
| --- | --- |
| `pure` | Python，配备 pytest、ruff、pylint、mypy，Sphinx + ReadTheDocs |

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

### Windows (WSL2)

在 Windows 上，整个生态系统通过 WSL2 运行。安装 WSL2 并使用相同的脚本：

```bash
# 克隆到 WSL2 home 目录
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# 添加到 PATH（在 WSL2 中，一次性配置）
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # 或 ~/.bashrc
source ~/.zshrc

# 创建新项目（在 WSL2 中）
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### 创建项目后

1. 在 VS Code 中打开项目文件夹
2. 点击 **"Reopen in Container"**（或 `Ctrl+Shift+P` → "Dev Containers: Reopen in Container"）
3. 首次启动时容器会自动构建
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

---

## 安装

### 1. 克隆仓库

```bash
# Linux / macOS / Windows (WSL2)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates
```

### 2. 添加到 PATH

**Bash：**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**Zsh：**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

> **注意：** 克隆后 `new-project.sh` 已具有可执行权限。若没有：`chmod +x new-project.sh`

### 3. 前提条件

| 工具 | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | 必需 — [docker.com](https://www.docker.com/) | 必需 — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **WSL2** | — | 必需 — [WSL2 安装指南](https://learn.microsoft.com/zh-cn/windows/wsl/install) + VS Code 中的 **WSL** 扩展 |
| **VS Code** | 必需 — [code.visualstudio.com](https://code.visualstudio.com/) | 必需 |
| **Dev Containers 扩展** | 必需 — 从 VS Code 安装 | 必需（从 WSL2 打开项目） |
| **GitHub CLI** | 推荐 | 推荐（Windows 用户 — 在 WSL2 中） |
| **uv** | 用于 hybrid/python 模板 — [astral.sh/uv](https://astral.sh/uv) | 用于 hybrid/python 模板 — 在 WSL2 中安装 |
| **Git** | 必需 | 必需 — 在 WSL2 中安装 |

> **GitHub CLI 提示：** 在宿主机上（Windows 用户 — 在 WSL2 中）运行一次 `gh auth login`。容器会挂载宿主机的 `~/.config/gh` —— 无需在 Dev Container 内重新认证。

---

## 仓库结构

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # 自动依赖更新（Actions + pre-commit）
├── c-cpp/
│   ├── pure/                   # 纯 C/C++ 模板
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
│   ├── hybrid/                 # C/C++ + Python/Cython 模板
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
│   └── platformio/             # 嵌入式模板
│       ├── .devcontainer/      # 共享 devcontainer（PlatformIO + Clang）
│       ├── .vscode/            # 共享 VS Code 配置
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       └── stm32f411/
├── python/
│   └── pure/                   # 纯 Python 模板
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
├── meta-template/              # 创建新模板的基础
├── new-project.sh              # Linux / macOS / Windows (WSL2) 脚本
├── LICENSE
└── README.md
```

---

## Dev Container 功能

每个容器基于 **Arch Linux（最新版）** 构建，包含：

- **Shell**：带 Oh My Zsh + Powerlevel10k 的 Zsh
- **编辑器**：Neovim
- **VCS**：Git、git-delta、GitHub CLI
- **AI 代理**：Claude Code、Qwen Code、Kilo Code CLI（来自 AUR）—— 均可作为 CLI 工具使用
- **Docker**：Docker + Docker Buildx + Lazydocker（用于容器中运行容器）
- **GitHub 认证**：宿主机 `~/.config/gh` 绑定挂载 —— 无需重新认证

### C/C++ 容器

- Clang、LLD、LLDB、compiler-rt
- CMake、Ninja
- GDB、valgrind
- cppcheck、lcov
- pre-commit

### C/C++ 混合容器

C/C++ 的全部内容，另加：

- Python 3、pip、uv、virtualenv
- Cython、NumPy
- pytest、pytest-cov
- ruff、pylint、mypy
- Sphinx、furo、breathe（文档）

### Python 容器

- Python 3、pip、uv、virtualenv
- pytest、pytest-cov
- ruff、pylint、mypy
- Sphinx、furo
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
- **Wokwi Simulator** —— 直接在 VS Code 中进行 Arduino/ESP32/STM32 交互式模拟
- **C/C++ Tools** —— 微控制器代码支持

---

## 代码质量 & CI/CD

### pre-commit 钩子

钩子在每次提交前自动运行，在 Dev Container 启动时安装（`postCreateCommand`）—— 包括普通钩子和提交消息验证钩子。

#### C/C++ 项目
- **clang-format** —— 自动代码格式化（LLVM 风格）
- **clang-tidy** —— 针对 bug 和风格问题的静态分析
- **cppcheck** —— 内存泄漏、空指针检查、未定义行为
- **valgrind memcheck** —— 运行时内存错误检测（hybrid + pure）

#### Python 项目
- **ruff** —— 快速 linting + 导入排序（替代 flake8 + isort）
- **ruff-format** —— 代码格式化（与 black 兼容）
- **pylint** —— 深度语义分析：不可达代码、错误的参数数量、访问不存在的属性
- **mypy** —— 静态类型检查

#### 所有项目
- **commitlint** —— 根据 [Conventional Commits](https://www.conventionalcommits.org/) 验证提交消息格式
- **detect-secrets** —— 阻止包含密钥的提交（API 密钥、令牌、密码）
- YAML 验证
- 大文件检测（> 1 MB）
- 删除行尾空格
- 文件末尾修复
- 合并冲突检测

> 如果钩子失败，提交将被阻止直到问题修复。这可防止损坏的代码进入仓库。

### GitHub Actions

每个模板包含两个工作流：`ci.yml`（每次 push/PR 时运行）和 `release.yml`（在 `v*` 标签时运行）。

#### C/C++ Pure & Hybrid
- **Lint**：pre-commit 检查（clang-format、clang-tidy、cppcheck、commitlint）
- **Build**：使用预设的 CMake Debug + Release 构建
- **Test**：通过 ctest 运行 GoogleTest 测试
- **Coverage**：gcov + lcov —— HTML 报告 + GitHub Actions UI 摘要 + GitHub Pages 覆盖率徽章
- **Matrix**：Python 3.10–3.13（仅 hybrid）
- **Security**：Trivy —— CVE 扫描（HIGH/CRITICAL，阻止合并）
- **Docs**：Doxygen（pure）或 Doxygen + Sphinx/furo（hybrid）→ 推送到 `main` 时发布到 GitHub Pages
- **Release**：在标签 `v*` 时 —— git-cliff 生成 CHANGELOG，构建制品，创建 GitHub Release

#### Python Pure
- **Lint**：pre-commit 检查（ruff、pylint、mypy、commitlint）
- **Test**：pytest + GitHub Actions UI 覆盖率摘要 + PR 覆盖率评论
- **覆盖率徽章**：推送到 `main` 时发布到 GitHub Pages
- **Matrix**：Python 3.10–3.13
- **Security**：Trivy —— CVE 扫描（HIGH/CRITICAL，阻止合并）
- **Docs**：Sphinx + furo → GitHub Pages（`main`）+ ReadTheDocs（所有分支/标签）
- **Release**：在标签 `v*` 时 —— git-cliff 生成 CHANGELOG，构建 wheel + sdist，创建 GitHub Release

#### PlatformIO
- **Lint**：pre-commit 检查（clang-format、cppcheck、commitlint）
- **Build**：`pio run` —— 编译固件
- **Test**：`pio test`（如果存在 test 目录）
- **Size**：`pio run --target size` —— 固件大小报告
- **Static analysis**：`pio check --fail-on-defect high`
- **Wokwi CI**：云端固件模拟 —— 无需真实硬件即可验证 Serial 输出（需要在 GitHub Secrets 中设置 `WOKWI_CLI_TOKEN`，每月免费 50 分钟）
- **Release**：在标签 `v*` 时 —— 将 `.elf`/`.hex`/`.bin` 上传到 GitHub Release

> **Wokwi CI 和 VS Code 扩展**使用同一个 `diagram.json` —— 在 [wokwi.com](https://wokwi.com) 上绘制的电路图。详情请查看生成项目中的 `@PROJECT_NAME@.md`。
>
> **STM32F411 注意事项**：Wokwi 不直接支持 BlackPill —— `diagram.json` 使用 `board-st-nucleo-f411re`（相同的 STM32F411 MCU，但引脚布局不同）。请根据实际硬件调整电路图。

所有工作流在 **Arch Linux 容器**上运行 —— 与开发环境完全一致。

### Dependabot

仓库根目录有 `.github/dependabot.yml` —— 它自动监控所有模板中的版本是否最新，并通过 PR 提出更新建议。覆盖：

- **GitHub Actions** —— actions/checkout、upload-artifact 等的版本
- **pre-commit 钩子** —— clang-format、ruff、mypy、pylint 等的修订版本

每周检查更新 —— 无需手动跟踪版本。

### AI 代理上下文

每个生成的项目包含 `@PROJECT_NAME@.md` 文件 —— 包含架构描述、技术栈、构建说明和 AI 代理规则的单一事实来源。`CLAUDE.md`、`QWEN.md` 和 `AGENTS.md` 是指向该文件的符号链接，因此 Claude Code、Qwen Code 和 Kilo Code 会自动读取相同的上下文。

---

## 文档

### C/C++ Pure

文档通过 **Doxygen** 生成，每次推送到 `main` 时自动发布到 **GitHub Pages**。

### C/C++ Hybrid & Python Pure

文档通过 **Sphinx** 和 **furo** 主题（支持深色模式）构建，并发布到**两个地方**：
- **GitHub Pages** —— 每次推送到 `main` 时自动发布
- **ReadTheDocs** —— 每次推送时自动发布（所有分支和标签，带版本管理）

Hybrid 模板还使用 **Breathe** 将 Doxygen 中的 C++ API 导入 Sphinx。

连接 ReadTheDocs：
1. 在 [readthedocs.org](https://readthedocs.org) 上连接仓库
2. ReadTheDocs 会自动检测 `.readthedocs.yaml` 并在每次推送时开始构建

---

## 许可证

**MIT 许可证** —— Copyright © 2025–2026 Vais Vaisov

可自由使用、修改和分发。

---

## 贡献

欢迎贡献！请阅读 [CONTRIBUTING.md](.github/CONTRIBUTING.md)，随时提交 issue 或 Pull Request。

---

<div align="center">

*IT Project Templates —从零到代码，只需几分钟*

</div>
