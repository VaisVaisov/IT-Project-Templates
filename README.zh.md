# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**开箱即用的项目模板，支持 VS Code Dev Containers**

*Arch Linux · Clang 工具链 · 预装 AI 编程助手*

[模板](#可用模板) • [快速开始](#快速开始) • [安装](#安装) • [Dev Containers](#dev-container-功能) • [CI/CD](#代码质量--cicd) • [PlatformIO](#platformio-模板) • [功能](#功能与使用)

**[🇷🇺 Русский](README.ru.md) · [🇬🇧 English](README.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## 这是什么？

一套项目模板，让你在几分钟内开始开发。每个模板都配备了基于 Arch Linux 的完整 **VS Code Dev Container** — 无论主机系统如何，在任何机器上都是相同的环境。

### 为什么使用它？

- 🚀 **零配置**：在 VS Code 中打开，点击「Reopen in Container」— 立即开始编码
- 🤖 **AI 就绪**：每个容器预装 Claude Code、Qwen Code 和 Kilo Code
- 🔒 **质量保障**：pre-commit 钩子在代码进入仓库前发现问题
- ⚙️ **内置 CI/CD**：GitHub Actions 用于代码检查、构建、测试、覆盖率、文档和发布
- 📝 **约定式提交**：commitlint 强制执行提交消息格式
- 🌍 **跨平台**：一个脚本在 Linux、macOS 和 Windows（通过 WSL2）上均可运行

---

## 可用模板

### C/C++ (`c-cpp/`)

| 模板 | 描述 |
| --- | --- |
| `pure` | C/C++，含 CMake、Ninja、GoogleTest、Google Benchmark、Doxygen、lcov 覆盖率 |
| `hybrid` | C/C++ + Python/Cython — 两种语言在一个项目中，Sphinx + ReadTheDocs |
| `platformio/` | 嵌入式开发（Arduino、ESP32、ESP8266、Pico、STM32） |

### Python (`python/`)

| 模板 | 描述 |
| --- | --- |
| `pure` | Python，含 pytest、ruff、pylint、mypy、Sphinx + ReadTheDocs |

### PlatformIO 设备 (`c-cpp/platformio/`)

| 目录 | 开发板 | 架构 | Wokwi CI |
| --- | --- | --- | --- |
| `arduino-nano` | Arduino Nano | ATmega328P (AVR) | ✓ |
| `arduino-pro-micro` | Arduino Pro Micro | ATmega32U4 (AVR, USB HID) | ✓ |
| `esp32-devkit` | ESP32 DevKit V1 | Xtensa LX6, WiFi + BT | ✓ |
| `esp32-s2-saola` | ESP32-S2 Saola | Xtensa LX7, USB OTG | ✓ |
| `esp32-s3-devkitc` | ESP32-S3 DevKitC | Xtensa LX7, AI+IoT | ✓ |
| `esp32-c3-devkitm` | ESP32-C3 DevKitM | RISC-V, WiFi + BT | ✓ |
| `esp32-c6-devkitc` | ESP32-C6 DevKitC | RISC-V, WiFi 6 + Zigbee | ✓ |
| `esp32-h2-devkitm` | ESP32-H2 DevKitM | RISC-V, Zigbee + Thread | ✓ |
| `esp8266-wemos-d1-mini` | Wemos D1 Mini | ESP8266, WiFi | — |
| `rpi-pico` | Raspberry Pi Pico | RP2040, ARM Cortex-M0+ | ✓ |
| `stm32f411-blackpill` | STM32F411 Black Pill | Cortex-M4, 100 MHz | ✓ * |
| `stm32f103-bluepill` | STM32F103 Blue Pill | Cortex-M3, 72 MHz | ✓ |

> \* STM32F411：Wokwi 使用 `board-st-nucleo-f411re`（相同 MCU，不同引脚排列）— 详见 [PlatformIO](#platformio-模板) 章节。ESP8266：不支持 Wokwi — 仅构建。

---

## 快速开始

### Linux / macOS

```bash
# 克隆到任意位置
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# 添加到 PATH（一次性设置）
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
# 克隆到 WSL2 主目录
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# 添加到 PATH（在 WSL2 中，一次性）
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # 或 ~/.bashrc
source ~/.zshrc

# 创建新项目（从 WSL2）
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### 创建项目后

1. 在 VS Code 中打开项目文件夹
2. 点击 **「Reopen in Container」**（或 `Ctrl+Shift+P` →「Dev Containers: Reopen in Container」）
3. 首次启动时容器自动构建
4. pre-commit 钩子自动安装 — 可以开始开发了！

---

## 使用参考

```
new-project [--help] <语言> <类型> [设备] <路径>

语言：
  --c-cpp            C/C++ 项目
  --python           Python 项目

类型：
  --pure             纯 C/C++ 或 Python
  --hybrid           混合 C/C++ + Python/Cython  （仅 --c-cpp）
  --platformio       嵌入式开发                   （仅 --c-cpp）

PlatformIO 设备（Arduino）：
  --arduino-nano          Arduino Nano (ATmega328P)
  --arduino-pro-micro     Arduino Pro Micro (ATmega32U4, USB HID)

PlatformIO 设备（ESP32）：
  --esp32-devkit          ESP32 DevKit V1 (Xtensa LX6, WiFi + BT)
  --esp32-s2-saola        ESP32-S2 Saola (Xtensa LX7, USB OTG)
  --esp32-s3-devkitc      ESP32-S3 DevKitC (Xtensa LX7, AI+IoT)
  --esp32-c3-devkitm      ESP32-C3 DevKitM (RISC-V, WiFi + BT)
  --esp32-c6-devkitc      ESP32-C6 DevKitC (RISC-V, WiFi 6 + Zigbee)
  --esp32-h2-devkitm      ESP32-H2 DevKitM (RISC-V, Zigbee + Thread)

PlatformIO 设备（其他）：
  --esp8266-wemos-d1-mini Wemos D1 Mini (ESP8266, WiFi) — 仅构建，不支持 Wokwi
  --rpi-pico              Raspberry Pi Pico (RP2040, 双核 ARM Cortex-M0+)
  --stm32f411-blackpill   STM32F411 Black Pill (Cortex-M4, 100 MHz)
  --stm32f103-bluepill    STM32F103 Blue Pill (Cortex-M3, 72 MHz)

选项：
  --help, -h         显示帮助并退出
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
| **GitHub CLI** | 推荐 | 推荐（Windows 用户在 WSL2 中使用） |
| **uv** | hybrid/python 模板需要 — [astral.sh/uv](https://astral.sh/uv) | hybrid/python 模板需要 — 在 WSL2 中安装 |
| **Git** | 必需 | 必需 — 在 WSL2 中安装 |

> **GitHub CLI 提示：** 在主机上（Windows 用户在 WSL2 中）执行一次 `gh auth login`。容器会挂载主机的 `~/.config/gh` — 无需在 Dev Container 内重新认证。

---

## 项目结构

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # 自动更新依赖（Actions + pre-commit）
├── c-cpp/
│   ├── pure/                   # 纯 C/C++ 模板
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB + lcov + valgrind
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Google Benchmark 示例
│   │   ├── tools/profiler/     # Valgrind + perf 脚本
│   │   └── ...
│   ├── hybrid/                 # C/C++ + Python/Cython 模板
│   │   ├── .devcontainer/      # Clang + Python + Cython + ruff + pylint
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Google Benchmark 示例
│   │   ├── tools/profiler/     # Valgrind + perf + Python 性能分析工具
│   │   └── ...
│   └── platformio/             # 嵌入式模板
│       ├── devcontainers/      # 按开发板系列分类的 Dev Container
│       │   ├── base/           # Arduino + ESP（PlatformIO + Clang）
│       │   ├── stm32/          # STM32（+ ST-Link 工具 + GDB）
│       │   └── pico/           # Raspberry Pi Pico（+ picotool）
│       ├── .vscode/            # 共享 VS Code 配置
│       ├── arduino/            # Arduino 系列模板
│       ├── esp32/              # ESP32 系列模板
│       ├── esp8266/            # ESP8266 系列模板
│       ├── stm32/              # STM32 系列模板
│       └── pico/               # Raspberry Pi Pico 模板
├── python/
│   └── pure/                   # 纯 Python 模板
│       ├── .devcontainer/      # Python + ruff + pylint + mypy
│       ├── .github/
│       │   ├── workflows/      # ci.yml + release.yml
│       │   └── ISSUE_TEMPLATE/
│       ├── .vscode/
│       ├── tools/profiler/     # Python 性能分析工具
│       └── ...
├── meta-template/              # 创建新模板的基础
├── new-project.sh              # Linux / macOS / Windows (WSL2) 脚本
├── LICENSE
└── README.md
```

---

## Dev Container 功能

每个容器基于 **Arch Linux (latest)** 构建，包含：

- **Shell**：Zsh + Oh My Zsh + Powerlevel10k
- **编辑器**：Neovim
- **VCS**：Git、git-delta、GitHub CLI
- **AI 助手**：Claude Code、Qwen Code、Kilo Code CLI（来自 AUR）— 均可作为 CLI 工具使用
- **Docker**：Docker + Docker Buildx + Lazydocker（容器内运行容器）
- **GitHub 认证**：挂载主机 `~/.config/gh` — 无需重新认证

### C/C++ 容器

- Clang、LLD、LLDB、compiler-rt
- CMake、Ninja
- GDB、valgrind
- cppcheck、lcov
- pre-commit

### Hybrid 容器（C/C++ + Python）

包含 C/C++ 的全部内容，另加：

- Python 3、pip、uv、virtualenv
- Cython、NumPy
- pytest、pytest-cov
- ruff、pylint、mypy
- Sphinx、furo、breathe（文档）
- py-spy、memory-profiler（Python 性能分析）

### Python 容器

- Python 3、pip、uv、virtualenv
- pytest、pytest-cov
- ruff、pylint、mypy
- Sphinx、furo
- pre-commit

### PlatformIO 容器（Arduino + ESP）

- PlatformIO Core + udev 规则
- Clang、cppcheck（静态分析）
- Python 3、pip
- pre-commit
- USB 设备访问（容器以 `--privileged` 运行）

### PlatformIO 容器（STM32）

Arduino + ESP 的全部内容，加上：

- stlink（`st-flash`、`st-info`、`st-util` — 通过 ST-Link 烧录和调试）
- GDB（连接到 `st-util` GDB 服务器的调试器）

### PlatformIO 容器（Pico）

Arduino + ESP 的全部内容，加上：

- picotool（无需 BOOTSEL 管理 Raspberry Pi Pico 固件）

---

## VS Code 扩展

所有模板在 Dev Container 中打开时自动安装扩展，不使用 Docker 时显示为推荐扩展。

### 通用（所有模板）

| 类别 | 扩展 | 用途 |
| --- | --- | --- |
| **AI** | Claude Code | AI 助手（CLI + VS Code） |
| | TONGYI Lingma | AI 助手和代码补全 |
| | Kilo Code | 支持 400+ 模型的 AI 助手 |
| **Git** | GitLens | 高级 Git 功能（blame、历史） |
| | Git Graph | 可视化提交图 |
| **代码质量** | Better Comments | 彩色 TODO/FIXME/NOTE 注释 |
| | Code Spell Checker | 代码和注释拼写检查 |
| **Docker** | Docker | 容器管理 |
| **Markdown** | Markdown All in One | 完整 Markdown 支持 |
| | Markdown Converter | 导出为 PDF/HTML/Word |
| **格式** | YAML (Red Hat) | YAML 支持 |
| | JSON (Meezilla) | 增强 JSON 编辑 |

### C/C++ 模板

- **C/C++ Tools** — IntelliSense 和调试
- **clangd** — 高级代码分析和导航
- **Code Runner** — 快速运行代码

### Python 模板

- **Python** + **Pylance** — 核心支持和语言服务器
- **debugpy** — Python 调试器
- **Python Envs** — 虚拟环境管理
- **autodocstring** — 自动生成 docstring
- **Django** + **Jinja** — 框架支持（纯 Python）

### Hybrid 模板

所有 C/C++ 和 Python 扩展的组合。

### PlatformIO 模板

- **PlatformIO IDE** — 嵌入式开发平台
- **Wokwi Simulator** — 直接在 VS Code 中交互式仿真 Arduino/ESP32/STM32
- **C/C++ Tools** — 微控制器代码支持

---

## 代码质量 & CI/CD

### Pre-commit 钩子

钩子在每次提交前自动运行，在 Dev Container 启动时安装（`postCreateCommand`）。

#### C/C++ 项目
- **clang-format** — 自动代码格式化（LLVM 风格）
- **clang-tidy** — 静态分析，检测 bug 和风格问题
- **cppcheck** — 内存泄漏、空指针、未定义行为
- **valgrind memcheck** — 运行时内存错误检测（hybrid + pure）

#### Python 项目
- **ruff** — 快速 linting + import 排序（替代 flake8 + isort）
- **ruff-format** — 代码格式化（兼容 black）
- **pylint** — 深度语义分析：不可达代码、错误参数数量、缺失属性
- **mypy** — 静态类型检查

#### 所有项目
- **commitlint** — 强制执行 [Conventional Commits](https://www.conventionalcommits.org/) 格式
- **detect-secrets** — 阻止包含密钥的提交（API 密钥、token、密码）
- YAML 验证
- 大文件检测（> 1 MB）
- 删除行尾空格
- 文件末尾修复
- 合并冲突检测

> 如果钩子失败，提交将被阻止直到问题解决。这能防止有问题的代码进入仓库。

### GitHub Actions

每个模板包含两个工作流：`ci.yml`（每次 push/PR 触发）和 `release.yml`（`v*` 标签触发）。

#### C/C++ Pure & Hybrid
- **Lint**：pre-commit 检查（clang-format、clang-tidy、cppcheck、commitlint）
- **Build**：CMake Debug + Release 预设
- **Test**：通过 ctest 运行 GoogleTest 套件
- **Benchmark**：运行 Google Benchmark 二进制文件（如果 `benchmarks/` 中存在）
- **Coverage**：gcov + lcov — HTML 报告 + GitHub Actions UI 摘要 + GitHub Pages 覆盖率徽章
- **Sanitize ASan**：AddressSanitizer + UBSan + LeakSanitizer — 内存错误和 UB 检测
- **Sanitize MSan**：MemorySanitizer（Clang）— 读取未初始化内存
- **Sanitize TSan**：ThreadSanitizer — 多线程代码中的数据竞争
- **Valgrind**：`ctest -T memcheck` — 对整个测试套件进行详细内存分析
- **Matrix**：Python 3.10–3.13（仅 hybrid）
- **Security**：Trivy — CVE 扫描（HIGH/CRITICAL，阻止合并）
- **Docs**：Doxygen（pure）或 Doxygen + Sphinx/furo（hybrid）→ push 到 `main` 时发布到 GitHub Pages
- **Release**：`v*` 标签时 — git-cliff 生成 CHANGELOG，构建产物，创建 GitHub Release

#### Python Pure
- **Lint**：pre-commit 检查（ruff、pylint、mypy、commitlint）
- **Test**：pytest + GitHub Actions UI 覆盖率摘要 + PR 覆盖率评论
- **覆盖率徽章**：push 到 `main` 时发布到 GitHub Pages
- **Matrix**：Python 3.10–3.13
- **Security**：Trivy — CVE 扫描（HIGH/CRITICAL，阻止合并）
- **Docs**：Sphinx + furo → GitHub Pages（`main`）+ ReadTheDocs（所有分支/标签）
- **Release**：`v*` 标签时 — git-cliff 生成 CHANGELOG，构建 wheel + sdist，创建 GitHub Release

所有工作流在 **Arch Linux 容器**上运行，与开发环境完全一致。

### Dependabot

仓库根目录的 `.github/dependabot.yml` 自动保持所有模板更新。覆盖：

- **GitHub Actions** 版本（actions/checkout、upload-artifact 等）
- **pre-commit 钩子**修订版本（clang-format、ruff、mypy、pylint 等）

每周检查更新 — 无需手动跟踪版本。

### AI 助手上下文

每个生成的项目包含 `@PROJECT_NAME@.md` 文件 — 描述项目架构、技术栈、构建指令和 AI 助手规则的唯一可信来源。`CLAUDE.md`、`QWEN.md` 和 `AGENTS.md` 是指向该文件的符号链接，因此 Claude Code、Qwen Code 和 Kilo Code 自动读取相同的上下文。

---

## PlatformIO 模板

### 支持的开发板

| 目录 | 开发板 | 架构 | Wokwi CI |
| --- | --- | --- | --- |
| `arduino-nano` | Arduino Nano | ATmega328P (AVR) | ✓ |
| `arduino-pro-micro` | Arduino Pro Micro | ATmega32U4 (AVR, USB HID) | ✓ |
| `esp32-devkit` | ESP32 DevKit V1 | Xtensa LX6, WiFi + BT | ✓ |
| `esp32-s2-saola` | ESP32-S2 Saola | Xtensa LX7, USB OTG | ✓ |
| `esp32-s3-devkitc` | ESP32-S3 DevKitC | Xtensa LX7, AI+IoT | ✓ |
| `esp32-c3-devkitm` | ESP32-C3 DevKitM | RISC-V, WiFi + BT | ✓ |
| `esp32-c6-devkitc` | ESP32-C6 DevKitC | RISC-V, WiFi 6 + Zigbee | ✓ |
| `esp32-h2-devkitm` | ESP32-H2 DevKitM | RISC-V, Zigbee + Thread | ✓ |
| `esp8266-wemos-d1-mini` | Wemos D1 Mini | ESP8266, WiFi | — |
| `rpi-pico` | Raspberry Pi Pico | RP2040, ARM Cortex-M0+ | ✓ |
| `stm32f411-blackpill` | STM32F411 Black Pill | Cortex-M4, 100 MHz | ✓ * |
| `stm32f103-bluepill` | STM32F103 Blue Pill | Cortex-M3, 72 MHz | ✓ |

> \* STM32F411：Wokwi 不直接支持 BlackPill — `diagram.json` 使用 `board-st-nucleo-f411re`（相同的 STM32F411 MCU，不同引脚排列）。ESP8266：不支持 Wokwi — 仅构建。

### Wokwi：无需硬件的仿真

Wokwi 允许在浏览器或 VS Code 中运行固件，无需实体硬件。

**VS Code 设置：**
1. 安装 **Wokwi Simulator** 扩展
2. 通过 `Ctrl+Shift+P` →「Wokwi: Request Free License」激活许可证（个人项目免费）
3. 打开项目根目录中的 `diagram.json` — 电路图在 Wokwi 编辑器中打开
4. 按 ▶ 启动仿真

**Wokwi CI 设置（GitHub Actions）：**
1. 在 [wokwi.com/ci](https://wokwi.com/ci) 获取 token
2. 添加到 GitHub Secrets：`Settings` → `Secrets and variables` → `Actions` → `New repository secret` → `WOKWI_CLI_TOKEN`
3. CI 将自动运行仿真并验证串口输出

**`diagram.json` 电路图：**
在 [wokwi.com](https://wokwi.com) 上绘制电路，下载 `diagram.json` 并替换项目中的文件。Wokwi CI 和 VS Code 扩展使用同一个文件。

### 基本命令

```bash
pio run                        # 构建固件
pio run -t upload              # 构建并烧录到设备
pio device monitor             # 打开串口监视器
pio device monitor --baud 115200
pio test                       # 在设备上运行单元测试
pio run --target size          # 固件大小报告
pio check                      # 静态分析
```

### 框架选择

所有模板默认使用 `framework = arduino`。在 `platformio.ini` 中修改：

```ini
[env:esp32dev]
platform = espressif32
board    = esp32dev
framework = arduino      ; 默认 — 丰富的库生态系统

; 替代方案（按需取消注释）：
; framework = espidf     ; ESP-IDF — 完全控制，原生 Espressif SDK
; framework = arduino    ; 可与 ESP-IDF 组件结合使用
```

| 框架 | 平台 | 使用场景 |
| --- | --- | --- |
| `arduino` | 全部 | 最多现成库，快速启动 |
| `espidf` | ESP32 | 完全控制，Bluetooth/WiFi 协议栈，FreeRTOS |
| `arduino`（含 ESP-IDF） | ESP32 | Arduino 库 + ESP-IDF 组件 |
| `pico-sdk` | Raspberry Pi Pico | 直接访问 RP2040 SDK |
| `arduino` | Pico | Arduino 生态系统兼容性 |

### 烧录固件

在 `platformio.ini` 中设置上传协议：

```ini
; upload_protocol = esptool     ; ESP32/ESP8266 — USB UART（默认）
; upload_protocol = espota      ; ESP32/ESP8266 — OTA（无线更新）
; upload_protocol = esp-prog    ; ESP32 — JTAG 调试器
; upload_protocol = stlink      ; STM32 — ST-Link 编程器
; upload_protocol = picotool    ; Raspberry Pi Pico — USB（按住 BOOTSEL）
; upload_protocol = arduino     ; Arduino AVR — 通过 bootloader
; upload_protocol = usbasp      ; Arduino AVR — USBasp 编程器
```

### CI/CD

- **Lint**：pre-commit 检查（clang-format、cppcheck、commitlint）
- **Build**：`pio run` — 固件编译
- **Test**：`pio test`（如果存在 test 目录）
- **Size**：`pio run --target size` — 固件大小报告
- **Static analysis**：`pio check --fail-on-defect high`
- **Wokwi CI**：云端固件仿真（ESP8266 除外）— 设置见上方 [Wokwi](#wokwi无需硬件的仿真) 章节
- **Release**：`v*` 标签时 — 将 `.elf`/`.hex`/`.bin` 上传到 GitHub Release

工作流在 **Arch Linux 容器**上运行，与开发环境完全一致。

---

## 功能与使用

### 测试

#### C/C++（GoogleTest）

```bash
# 构建并运行所有测试
cmake --preset linux-debug && cmake --build --preset linux-debug
cd cmake-build-linux-debug && ctest --output-on-failure

# 运行特定测试
ctest -R MyTest --output-on-failure

# 详细输出
ctest -V
```

测试位于 `test/`。每个 `*_test.cpp` 自动被 CMake 识别。

#### Python（pytest）

```bash
# 运行所有测试
python -m pytest -v

# 特定文件或测试
python -m pytest tests/test_module.py::test_function -v

# 失败时显示简短回溯
python -m pytest -v --tb=short
```

---

### 代码覆盖率

#### C++ — lcov

```bash
# 带覆盖率构建
cmake --preset linux-coverage && cmake --build --preset linux-coverage

# 运行测试并生成报告
cd cmake-build-linux-coverage
ctest --output-on-failure
lcov --capture --directory . --output-file coverage.info
lcov --remove coverage.info '/usr/*' '*/libraries/*' '*/test/*' --output-file coverage.info
genhtml coverage.info --output-directory coverage-html

# 在浏览器中打开报告
xdg-open coverage-html/index.html
```

HTML 报告按文件、函数和行显示覆盖率。绿色 = 已覆盖，红色 = 未覆盖。

#### Python — pytest-cov

```bash
# 终端输出覆盖率
python -m pytest --cov --cov-report=term

# HTML 报告
python -m pytest --cov --cov-report=html
xdg-open htmlcov/index.html

# 显示未覆盖的行
python -m pytest --cov --cov-report=term-missing
```

#### 徽章和 PR 评论

push 到 `main` 后，GitHub Actions 自动将覆盖率徽章发布到 GitHub Pages。每个 PR 中会出现包含当前覆盖率百分比的评论。

---

### Google Benchmark

Google Benchmark 以纳秒精度测量单个函数的性能。

```bash
# 以 Release 模式构建（必须 — Debug 会扭曲结果）
cmake --preset linux-release && cmake --build --preset linux-release

# 运行所有 benchmark
./cmake-build-linux-release/bench_example  # 或你的二进制文件名

# 按名称过滤
./cmake-build-linux-release/bench_example --benchmark_filter=BM_MyFunction

# 输出 JSON 用于后续分析
./cmake-build-linux-release/bench_example --benchmark_out=results.json --benchmark_out_format=json

# 比较两次运行
benchmark_compare results_before.json results_after.json
```

示例输出：
```
Benchmark                Time        CPU      Iterations
--------------------------------------------------------
BM_VectorPushBack       45.2 ns    45.1 ns    15000000
BM_MapInsert           120.5 ns   120.3 ns     5800000
```

Benchmark 位于 `benchmarks/`。参照 `bench_example.cpp` 添加新的 benchmark。

---

### 内存/线程检测器（Sanitizers）

Sanitizer 是基于编译器的工具，可在运行时检测错误：缓冲区溢出、数据竞争、内存泄漏和未定义行为。

#### ASan + UBSan + LSan — 内存错误和 UB

```bash
cmake --preset linux-asan && cmake --build --preset linux-asan
cd cmake-build-linux-asan && ctest --output-on-failure
```

检测内容：
- **ASan**（AddressSanitizer）— 越界访问、use-after-free、double-free
- **UBSan**（UndefinedBehaviorSanitizer）— 整数溢出、负数移位、空指针解引用
- **LSan**（LeakSanitizer）— 内存泄漏

#### MSan — 未初始化内存

```bash
cmake --preset linux-msan && cmake --build --preset linux-msan
cd cmake-build-linux-msan && ctest --output-on-failure
```

检测读取未初始化内存。**仅 Clang。**

#### TSan — 数据竞争

```bash
cmake --preset linux-tsan && cmake --build --preset linux-tsan
cd cmake-build-linux-tsan && ctest --output-on-failure
```

检测多线程代码中的数据竞争。

> Sanitizer 不能相互组合 — 每个单独运行。在 CI 中它们作为并行任务运行。

---

### Valgrind

Valgrind 无需重新编译 — 直接分析已构建的 Debug 二进制文件。

#### Memcheck — 内存错误

```bash
# 通过 ctest 运行所有测试（CI 和 pre-commit 模式）
tools/profiler/run-memcheck.sh

# 特定二进制文件
tools/profiler/run-memcheck.sh my_binary
```

检测：越界访问、use-after-free、内存泄漏、无效系统调用。

#### Helgrind — 数据竞争

```bash
# 所有测试
tools/profiler/run-helgrind.sh

# 特定二进制文件
tools/profiler/run-helgrind.sh my_binary
```

类似 TSan，但无需重新编译。速度较慢，但适用于任何二进制文件。

#### DRD — 数据竞争（替代方案）

```bash
tools/profiler/run-drd.sh          # 所有测试
tools/profiler/run-drd.sh my_binary
```

比 Helgrind 精度低，但速度更快。

> **何时使用什么：** Sanitizer — 速度更快，开发时更方便。Valgrind — 用于最终验证或无法重新编译时。

---

### C++ 性能分析

#### Callgrind — 调用图和 CPU 时间

```bash
tools/profiler/run-callgrind.sh my_binary
# 输出：profiles/callgrind.out
```

可视化：将 `callgrind.out` 上传到 [speedscope.app](https://speedscope.app) — 浏览器中的交互式火焰图。

显示：哪些函数消耗最多 CPU、调用图、指令计数。

#### Cachegrind — 缓存缺失

```bash
tools/profiler/run-cachegrind.sh my_binary
# 输出：profiles/cachegrind.out
```

显示：L1/L2/L3 缓存缺失计数、分支预测错误。帮助优化内存访问模式。

#### Massif — 堆内存使用

```bash
tools/profiler/run-massif.sh my_binary
# 输出：profiles/massif.out（带文本报告输出到 stdout）
```

显示：堆内存随时间的增长和收缩、分配峰值。

#### perf — 系统性能分析

```bash
tools/profiler/run-perf.sh my_binary
```

快速 Linux 采样分析器。以最小开销显示热点。

---

### Python 性能分析（hybrid + python/pure）

#### cProfile — 函数调用统计

```bash
tools/profiler/profile-python.sh
# 输出：profiles/profile.prof — 可视化：snakeviz profiles/profile.prof
```

显示：每个函数的调用次数、总时间和平均时间。通过 snakeviz 在浏览器中进行交互式可视化。

#### tracemalloc — 内存使用

```bash
tools/profiler/profile-memory.sh
# 输出：profiles/memory_stats.txt
```

显示：按行统计的前 10 名内存分配。

#### py-spy — 无需修改代码的采样分析器

```bash
tools/profiler/profile-spy.sh
# 输出：profiles/pyspy.svg — 在浏览器中打开
```

无需修改代码即可运行，开销极小。SVG 火焰图：在浏览器中打开，点击块进行缩放。

---

### 文档

#### C/C++ Pure — Doxygen

```bash
# 生成文档
doxygen Doxyfile

# 在浏览器中打开
xdg-open docs/html/index.html
```

使用注释为代码添加文档：
```cpp
/// @brief 计算两个数的和
/// @param a 第一个操作数
/// @param b 第二个操作数
/// @return a 和 b 的和
int add(int a, int b);
```

#### Hybrid & Python Pure — Sphinx

```bash
# 构建文档
cd docs && make html

# 在浏览器中打开
xdg-open docs/_build/html/index.html
```

Hybrid 模板使用 **Breathe** 将 Doxygen 中的 C++ API 导入 Sphinx — C++ 和 Python 文档构建为使用 **furo** 主题（支持深色模式）的统一网站。

#### 发布

- **GitHub Pages** — 所有模板：每次 push 到 `main` 时自动发布
- **ReadTheDocs** — 仅 Hybrid 和 Python Pure：每次 push 时自动发布（所有分支和标签，带版本控制）

设置 ReadTheDocs（Hybrid / Python Pure）：
1. 在 [readthedocs.org](https://readthedocs.org) 连接仓库
2. ReadTheDocs 会自动检测 `.readthedocs.yaml` 并在每次 push 时构建

---

## 许可证

**MIT License** — Copyright © 2025–2026 Vais Vaisov

可自由使用、修改和分发。

---

## 贡献

欢迎贡献！阅读 [CONTRIBUTING.md](.github/CONTRIBUTING.md) 并随时提交 issue 或 Pull Request。

---

<div align="center">

*IT Project Templates — 从零到代码，只需几分钟*

</div>
