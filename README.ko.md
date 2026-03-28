# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**VS Code Dev Containers를 지원하는 바로 사용 가능한 프로젝트 템플릿**

*Arch Linux · Clang 툴체인 · AI 코딩 에이전트 사전 설치*

[템플릿](#사용-가능한-템플릿) • [빠른 시작](#빠른-시작) • [설치](#설치) • [Dev Containers](#dev-container-기능) • [CI/CD](#코드-품질--cicd) • [PlatformIO](#platformio-템플릿) • [기능](#기능--사용법)

**[🇷🇺 Русский](README.ru.md) · [🇬🇧 English](README.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## 이게 무엇인가요?

몇 분 안에 개발을 시작할 수 있는 프로젝트 템플릿 모음입니다. 각 템플릿은 Arch Linux 기반의 완전히 설정된 **VS Code Dev Container**와 함께 제공됩니다 — 호스트 OS에 관계없이 어떤 머신에서도 동일한 환경을 사용할 수 있습니다.

### 왜 사용하나요?

- 🚀 **제로 셋업**: VS Code에서 열고 "Reopen in Container"를 클릭 — 즉시 코딩 시작
- 🤖 **AI 지원**: 모든 컨테이너에 Claude Code, Qwen Code, Kilo Code 사전 설치
- 🔒 **품질 게이트**: pre-commit 훅이 코드가 저장소에 들어가기 전에 문제를 감지
- ⚙️ **CI/CD 내장**: 린팅, 빌드, 테스트, 커버리지, 문서, 릴리즈를 위한 GitHub Actions
- 📝 **Conventional Commits**: commitlint로 커밋 메시지 형식 강제
- 🌍 **크로스 플랫폼**: Linux, macOS, Windows(WSL2 경유)에서 동작하는 하나의 스크립트

---

## 사용 가능한 템플릿

### C/C++ (`c-cpp/`)

| 템플릿 | 설명 |
| --- | --- |
| `pure` | CMake, Ninja, GoogleTest, Google Benchmark, Doxygen, lcov 커버리지를 포함한 C/C++ |
| `hybrid` | C/C++ + Python/Cython — 하나의 프로젝트에 두 언어, Sphinx + ReadTheDocs |
| `platformio/` | 임베디드 개발 (Arduino, ESP32, ESP8266, Pico, STM32) |

### Python (`python/`)

| 템플릿 | 설명 |
| --- | --- |
| `pure` | pytest, ruff, pylint, mypy, Sphinx + ReadTheDocs를 포함한 Python |

### PlatformIO 디바이스 (`c-cpp/platformio/`)

| 디렉토리 | 보드 | 아키텍처 | Wokwi CI |
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

> \* STM32F411: Wokwi는 BlackPill을 직접 지원하지 않아 `board-st-nucleo-f411re`(동일 MCU, 다른 핀아웃) 사용 — [PlatformIO](#platformio-템플릿) 섹션 참조. ESP8266: Wokwi 미지원 — 빌드만 가능.

---

## 빠른 시작

### Linux / macOS

```bash
# 어디든 클론
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# PATH에 추가 (한 번만)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # 또는 ~/.bashrc
source ~/.zshrc

# 새 프로젝트 생성
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (WSL2)

Windows에서는 전체 생태계가 WSL2를 통해 동작합니다. WSL2를 설치하고 동일한 스크립트를 사용하세요:

```bash
# WSL2 홈에 클론
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# PATH에 추가 (WSL2에서 한 번만)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # 또는 ~/.bashrc
source ~/.zshrc

# 새 프로젝트 생성 (WSL2에서)
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### 프로젝트 생성 후

1. VS Code에서 프로젝트 폴더 열기
2. **"Reopen in Container"** 클릭 (또는 `Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. 처음 시작 시 컨테이너가 자동으로 빌드됨
4. pre-commit 훅이 자동 설치 — 코딩 시작!

---

## 사용 참조

```
new-project [--help] <언어> <타입> [디바이스] <경로>

언어:
  --c-cpp            C/C++ 프로젝트
  --python           Python 프로젝트

타입:
  --pure             순수 C/C++ 또는 Python
  --hybrid           하이브리드 C/C++ + Python/Cython  (--c-cpp 전용)
  --platformio       임베디드 개발                      (--c-cpp 전용)

PlatformIO 디바이스 (Arduino):
  --arduino-nano          Arduino Nano (ATmega328P)
  --arduino-pro-micro     Arduino Pro Micro (ATmega32U4, USB HID)

PlatformIO 디바이스 (ESP32):
  --esp32-devkit          ESP32 DevKit V1 (Xtensa LX6, WiFi + BT)
  --esp32-s2-saola        ESP32-S2 Saola (Xtensa LX7, USB OTG)
  --esp32-s3-devkitc      ESP32-S3 DevKitC (Xtensa LX7, AI+IoT)
  --esp32-c3-devkitm      ESP32-C3 DevKitM (RISC-V, WiFi + BT)
  --esp32-c6-devkitc      ESP32-C6 DevKitC (RISC-V, WiFi 6 + Zigbee)
  --esp32-h2-devkitm      ESP32-H2 DevKitM (RISC-V, Zigbee + Thread)

PlatformIO 디바이스 (기타):
  --esp8266-wemos-d1-mini Wemos D1 Mini (ESP8266, WiFi) — 빌드만, Wokwi 없음
  --rpi-pico              Raspberry Pi Pico (RP2040, 듀얼코어 ARM Cortex-M0+)
  --stm32f411-blackpill   STM32F411 Black Pill (Cortex-M4, 100 MHz)
  --stm32f103-bluepill    STM32F103 Blue Pill (Cortex-M3, 72 MHz)

옵션:
  --help, -h         도움말 표시 후 종료
```

---

## 설치

### 1. 저장소 클론

```bash
# Linux / macOS / Windows (WSL2)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates
```

### 2. PATH에 추가

**Bash:**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**Zsh:**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

> **참고:** 클론 후 `new-project.sh`는 이미 실행 가능합니다. 그렇지 않다면: `chmod +x new-project.sh`

### 3. 사전 요구사항

| 도구 | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | 필수 — [docker.com](https://www.docker.com/) | 필수 — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **WSL2** | — | 필수 — [WSL2 설치 가이드](https://learn.microsoft.com/ko-kr/windows/wsl/install) + VS Code **WSL** 확장 |
| **VS Code** | 필수 — [code.visualstudio.com](https://code.visualstudio.com/) | 필수 |
| **Dev Containers 확장** | 필수 — VS Code에서 설치 | 필수 (WSL2에서 프로젝트 열기) |
| **GitHub CLI** | 권장 | 권장 (Windows는 WSL2에서) |
| **uv** | hybrid/python 템플릿용 — [astral.sh/uv](https://astral.sh/uv) | hybrid/python 템플릿용 — WSL2에 설치 |
| **Git** | 필수 | 필수 — WSL2에 설치 |

> **GitHub CLI 팁:** 호스트에서 (Windows는 WSL2에서) `gh auth login`으로 한 번 인증하세요. 컨테이너가 호스트의 `~/.config/gh`를 마운트하므로 Dev Container 내에서 재인증이 필요 없습니다.

---

## 프로젝트 구조

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # 의존성 자동 업데이트 (Actions + pre-commit)
├── c-cpp/
│   ├── pure/                   # 순수 C/C++ 템플릿
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB + lcov + valgrind
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Google Benchmark 예제
│   │   ├── tools/profiler/     # Valgrind + perf 스크립트
│   │   └── ...
│   ├── hybrid/                 # C/C++ + Python/Cython 템플릿
│   │   ├── .devcontainer/      # Clang + Python + Cython + ruff + pylint
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Google Benchmark 예제
│   │   ├── tools/profiler/     # Valgrind + perf + Python 프로파일러
│   │   └── ...
│   └── platformio/             # 임베디드 템플릿
│       ├── .devcontainer/      # 공유 devcontainer (PlatformIO + Clang)
│       ├── .vscode/            # 공유 VS Code 설정
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       ├── esp32-s2-saola/
│       ├── esp32-s3-devkitc/
│       ├── esp32-c3-devkitm/
│       ├── esp32-c6-devkitc/
│       ├── esp32-h2-devkitm/
│       ├── esp8266-wemos-d1-mini/
│       ├── rpi-pico/
│       ├── stm32f411-blackpill/
│       └── stm32f103-bluepill/
├── python/
│   └── pure/                   # 순수 Python 템플릿
│       ├── .devcontainer/      # Python + ruff + pylint + mypy
│       ├── .github/
│       │   ├── workflows/      # ci.yml + release.yml
│       │   └── ISSUE_TEMPLATE/
│       ├── .vscode/
│       ├── tools/profiler/     # Python 프로파일러
│       └── ...
├── meta-template/              # 새 템플릿 생성을 위한 기반
├── new-project.sh              # Linux / macOS / Windows (WSL2) 스크립트
├── LICENSE
└── README.md
```

---

## Dev Container 기능

모든 컨테이너는 **Arch Linux (latest)** 위에 구축되며 다음을 포함합니다:

- **쉘**: Oh My Zsh + Powerlevel10k가 포함된 Zsh
- **편집기**: Neovim
- **VCS**: Git, git-delta, GitHub CLI
- **AI 에이전트**: Claude Code, Qwen Code, Kilo Code CLI (AUR에서) — 모두 CLI 도구로 사용 가능
- **Docker**: Docker + Docker Buildx + Lazydocker (컨테이너 내에서 컨테이너 실행)
- **GitHub 인증**: 호스트의 `~/.config/gh` 마운트 — 재인증 불필요

### C/C++ 컨테이너

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### Hybrid 컨테이너 (C/C++ + Python)

C/C++의 모든 것에 추가로:

- Python 3, pip, uv, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (문서)
- py-spy, memory-profiler (Python 프로파일링)

### Python 컨테이너

- Python 3, pip, uv, virtualenv
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo
- pre-commit

### PlatformIO 컨테이너

- PlatformIO Core + udev 규칙
- Clang, cppcheck (정적 분석)
- Python 3, pip
- pre-commit
- USB 디바이스 접근 (컨테이너는 `--privileged`로 실행)

---

## VS Code 확장

모든 템플릿은 Dev Container에서 열 때 확장을 자동 설치하며, Docker 없이 열 때는 권장 사항으로 표시합니다.

### 공통 (모든 템플릿)

| 카테고리 | 확장 | 목적 |
| --- | --- | --- |
| **AI** | Claude Code | AI 에이전트 (CLI + VS Code) |
| | TONGYI Lingma | AI 어시스턴트 및 코드 완성 |
| | Kilo Code | 400+ 모델을 지원하는 AI 에이전트 |
| **Git** | GitLens | 고급 Git 기능 (blame, 히스토리) |
| | Git Graph | 시각적 커밋 그래프 |
| **코드 품질** | Better Comments | 컬러풀한 TODO/FIXME/NOTE 주석 |
| | Code Spell Checker | 코드와 주석의 철자 검사 |
| **Docker** | Docker | 컨테이너 관리 |
| **Markdown** | Markdown All in One | 완전한 Markdown 지원 |
| | Markdown Converter | PDF/HTML/Word로 내보내기 |
| **형식** | YAML (Red Hat) | YAML 지원 |
| | JSON (Meezilla) | 향상된 JSON 편집 |

### C/C++ 템플릿

- **C/C++ Tools** — IntelliSense 및 디버깅
- **clangd** — 고급 코드 분석 및 탐색
- **Code Runner** — 빠른 코드 실행

### Python 템플릿

- **Python** + **Pylance** — 핵심 지원 및 언어 서버
- **debugpy** — Python 디버거
- **Python Envs** — 가상 환경 관리
- **autodocstring** — docstring 자동 생성
- **Django** + **Jinja** — 프레임워크 지원 (순수 Python)

### Hybrid 템플릿

C/C++와 Python의 모든 확장 조합.

### PlatformIO 템플릿

- **PlatformIO IDE** — 임베디드 개발 플랫폼
- **Wokwi Simulator** — VS Code에서 직접 사용하는 인터랙티브 Arduino/ESP32/STM32 시뮬레이터
- **C/C++ Tools** — 마이크로컨트롤러 코드 지원

---

## 코드 품질 & CI/CD

### Pre-commit 훅

훅은 매 커밋 전에 자동으로 실행됩니다. Dev Container 시작 시 설치됩니다 (`postCreateCommand`).

#### C/C++ 프로젝트
- **clang-format** — 자동 코드 포맷팅 (LLVM 스타일)
- **clang-tidy** — 버그 및 스타일 문제 정적 분석
- **cppcheck** — 메모리 누수, 널 포인터, 정의되지 않은 동작
- **valgrind memcheck** — 런타임 메모리 오류 감지 (hybrid + pure)

#### Python 프로젝트
- **ruff** — 빠른 린팅 + import 정렬 (flake8 + isort 대체)
- **ruff-format** — 코드 포맷팅 (black 호환)
- **pylint** — 심층 의미 분석: 도달 불가 코드, 잘못된 인수 수, 없는 속성
- **mypy** — 정적 타입 검사

#### 모든 프로젝트
- **commitlint** — [Conventional Commits](https://www.conventionalcommits.org/) 형식 강제
- **detect-secrets** — 시크릿이 포함된 커밋 차단 (API 키, 토큰, 비밀번호)
- YAML 검증
- 대용량 파일 감지 (> 1 MB)
- 줄 끝 공백 제거
- 파일 끝 수정
- 병합 충돌 감지

> 훅이 실패하면 문제가 해결될 때까지 커밋이 차단됩니다. 이렇게 하면 깨진 코드가 저장소에 들어가는 것을 방지합니다.

### GitHub Actions

각 템플릿에는 두 개의 워크플로우가 있습니다: `ci.yml` (모든 push/PR 시) 과 `release.yml` (`v*` 태그 시).

#### C/C++ Pure & Hybrid
- **Lint**: pre-commit 검사 (clang-format, clang-tidy, cppcheck, commitlint)
- **Build**: CMake Debug + Release 프리셋
- **Test**: ctest를 통한 GoogleTest 스위트
- **Benchmark**: Google Benchmark 바이너리 실행 (`benchmarks/`에 있는 경우)
- **Coverage**: gcov + lcov — HTML 리포트 + GitHub Actions UI 요약 + GitHub Pages 커버리지 배지
- **Sanitize ASan**: AddressSanitizer + UBSan + LeakSanitizer — 메모리 오류 및 UB 감지
- **Sanitize MSan**: MemorySanitizer (Clang) — 초기화되지 않은 메모리 읽기
- **Sanitize TSan**: ThreadSanitizer — 멀티스레드 코드의 데이터 레이스
- **Valgrind**: `ctest -T memcheck` — 전체 테스트 스위트에 대한 상세 메모리 분석
- **Matrix**: Python 3.10–3.13 (hybrid만)
- **Security**: Trivy — CVE 스캔 (HIGH/CRITICAL, 병합 차단)
- **Docs**: Doxygen (pure) 또는 Doxygen + Sphinx/furo (hybrid) → `main` 푸시 시 GitHub Pages
- **Release**: `v*` 태그 시 — git-cliff가 CHANGELOG 생성, 아티팩트 빌드, GitHub Release 생성

#### Python Pure
- **Lint**: pre-commit 검사 (ruff, pylint, mypy, commitlint)
- **Test**: pytest + GitHub Actions UI 커버리지 요약 + PR 커버리지 댓글
- **커버리지 배지**: `main` 푸시 시 GitHub Pages에 게시
- **Matrix**: Python 3.10–3.13
- **Security**: Trivy — CVE 스캔 (HIGH/CRITICAL, 병합 차단)
- **Docs**: Sphinx + furo → GitHub Pages (`main`) + ReadTheDocs (모든 브랜치/태그)
- **Release**: `v*` 태그 시 — git-cliff가 CHANGELOG 생성, wheel + sdist 빌드, GitHub Release 생성

모든 워크플로우는 개발 환경과 완전한 일관성을 위해 **Arch Linux 컨테이너**에서 실행됩니다.

### Dependabot

이 저장소의 루트에 있는 `.github/dependabot.yml`이 모든 템플릿을 자동으로 최신 상태로 유지합니다. 커버:

- **GitHub Actions** 버전 (actions/checkout, upload-artifact 등)
- **pre-commit 훅** 리비전 (clang-format, ruff, mypy, pylint 등)

업데이트는 매주 확인 — 수동 버전 추적 불필요.

### AI 에이전트 컨텍스트

생성된 모든 프로젝트에는 `@PROJECT_NAME@.md` 파일이 포함됩니다 — 프로젝트 아키텍처, 기술 스택, 빌드 지침, AI 에이전트 규칙을 설명하는 단일 진실의 원천입니다. `CLAUDE.md`, `QWEN.md`, `AGENTS.md`는 이 파일의 심볼릭 링크이므로 Claude Code, Qwen Code, Kilo Code 모두 동일한 컨텍스트를 자동으로 읽습니다.

---

## PlatformIO 템플릿

### 지원 보드

| 디렉토리 | 보드 | 아키텍처 | Wokwi CI |
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

> \* STM32F411: Wokwi는 BlackPill을 직접 지원하지 않아 `diagram.json`에서 `board-st-nucleo-f411re`(동일한 STM32F411 MCU, 다른 핀아웃) 사용. ESP8266: Wokwi 미지원 — 빌드만 가능.

### Wokwi: 하드웨어 없는 시뮬레이션

Wokwi를 사용하면 실물 하드웨어 없이 브라우저나 VS Code에서 펌웨어를 실행할 수 있습니다.

**VS Code 설정:**
1. **Wokwi Simulator** 확장 설치
2. `Ctrl+Shift+P` → "Wokwi: Request Free License"로 라이선스 활성화 (개인 프로젝트 무료)
3. 프로젝트 루트의 `diagram.json` 열기 — 회로도가 Wokwi 편집기에서 열림
4. ▶를 눌러 시뮬레이션 시작

**Wokwi CI 설정 (GitHub Actions):**
1. [wokwi.com/ci](https://wokwi.com/ci)에서 토큰 획득
2. GitHub Secrets에 추가: `Settings` → `Secrets and variables` → `Actions` → `New repository secret` → `WOKWI_CLI_TOKEN`
3. CI가 자동으로 시뮬레이션을 실행하고 시리얼 출력을 검증

**`diagram.json` 회로도:**
[wokwi.com](https://wokwi.com)에서 회로를 그리고 `diagram.json`을 다운로드하여 프로젝트의 파일과 교체하세요. Wokwi CI와 VS Code 확장이 동일한 파일을 공유합니다.

### 기본 명령어

```bash
pio run                        # 펌웨어 빌드
pio run -t upload              # 빌드 후 디바이스에 업로드
pio device monitor             # 시리얼 모니터 열기
pio device monitor --baud 115200
pio test                       # 디바이스에서 유닛 테스트 실행
pio run --target size          # 펌웨어 크기 리포트
pio check                      # 정적 분석
```

### 프레임워크 선택

모든 템플릿은 기본적으로 `framework = arduino`를 사용합니다. `platformio.ini`에서 변경:

```ini
[env:esp32dev]
platform = espressif32
board    = esp32dev
framework = arduino      ; 기본값 — 풍부한 라이브러리 생태계

; 대안 (필요에 따라 주석 해제):
; framework = espidf     ; ESP-IDF — 완전한 제어, 네이티브 Espressif SDK
; framework = arduino    ; ESP-IDF 컴포넌트와 조합 가능
```

| 프레임워크 | 플랫폼 | 사용 시기 |
| --- | --- | --- |
| `arduino` | 전체 | 최대한 많은 기성 라이브러리, 빠른 시작 |
| `espidf` | ESP32 | 완전한 제어, Bluetooth/WiFi 스택, FreeRTOS |
| `arduino` (ESP-IDF 포함) | ESP32 | Arduino 라이브러리 + ESP-IDF 컴포넌트 |
| `pico-sdk` | Raspberry Pi Pico | RP2040 SDK 직접 접근 |
| `arduino` | Pico | Arduino 생태계 호환성 |

### 펌웨어 업로드

업로드 프로토콜은 `platformio.ini`에서 설정:

```ini
; upload_protocol = esptool     ; ESP32/ESP8266 — USB UART (기본값)
; upload_protocol = espota      ; ESP32/ESP8266 — OTA (무선)
; upload_protocol = esp-prog    ; ESP32 — JTAG 디버거
; upload_protocol = stlink      ; STM32 — ST-Link 프로그래머
; upload_protocol = picotool    ; Raspberry Pi Pico — USB (BOOTSEL 누른 채로)
; upload_protocol = arduino     ; Arduino AVR — 부트로더 경유
; upload_protocol = usbasp      ; Arduino AVR — USBasp 프로그래머
```

### CI/CD

- **Lint**: pre-commit 검사 (clang-format, cppcheck, commitlint)
- **Build**: `pio run` — 펌웨어 컴파일
- **Test**: `pio test` (test 디렉토리가 있는 경우)
- **Size**: `pio run --target size` — 펌웨어 크기 리포트
- **Static analysis**: `pio check --fail-on-defect high`
- **Wokwi CI**: 클라우드 펌웨어 시뮬레이션 (ESP8266 제외) — 설정은 위의 [Wokwi](#wokwi-하드웨어-없는-시뮬레이션) 섹션 참조
- **Release**: `v*` 태그 시 — `.elf`/`.hex`/`.bin`을 GitHub Release에 업로드

워크플로우는 개발 환경과 완전한 일관성을 위해 **Arch Linux 컨테이너**에서 실행됩니다.

---

## 기능 & 사용법

### 테스트

#### C/C++ (GoogleTest)

```bash
# 모든 테스트 빌드 및 실행
cmake --preset linux-debug && cmake --build --preset linux-debug
cd cmake-build-linux-debug && ctest --output-on-failure

# 특정 테스트 실행
ctest -R MyTest --output-on-failure

# 상세 출력
ctest -V
```

테스트는 `test/`에 있습니다. 모든 `*_test.cpp`는 CMake가 자동으로 인식합니다.

#### Python (pytest)

```bash
# 모든 테스트 실행
python -m pytest -v

# 특정 파일 또는 테스트
python -m pytest tests/test_module.py::test_function -v

# 실패 시 짧은 트레이스백
python -m pytest -v --tb=short
```

---

### 코드 커버리지

#### C++ — lcov

```bash
# 커버리지와 함께 빌드
cmake --preset linux-coverage && cmake --build --preset linux-coverage

# 테스트 실행 및 리포트 생성
cd cmake-build-linux-coverage
ctest --output-on-failure
lcov --capture --directory . --output-file coverage.info
lcov --remove coverage.info '/usr/*' '*/libraries/*' '*/test/*' --output-file coverage.info
genhtml coverage.info --output-directory coverage-html

# 브라우저에서 리포트 열기
xdg-open coverage-html/index.html
```

HTML 리포트는 파일, 함수, 줄별 커버리지를 표시합니다. 초록 = 커버됨, 빨강 = 미커버.

#### Python — pytest-cov

```bash
# 터미널 출력으로 커버리지
python -m pytest --cov --cov-report=term

# HTML 리포트
python -m pytest --cov --cov-report=html
xdg-open htmlcov/index.html

# 커버되지 않은 줄 표시
python -m pytest --cov --cov-report=term-missing
```

#### 배지 및 PR 댓글

`main`에 푸시한 후 GitHub Actions가 자동으로 커버리지 배지를 GitHub Pages에 게시합니다. 모든 PR에 현재 커버리지 비율 댓글이 표시됩니다.

---

### Google Benchmark

Google Benchmark는 나노초 정밀도로 개별 함수의 성능을 측정합니다.

```bash
# Release로 빌드 (필수 — Debug는 결과를 왜곡)
cmake --preset linux-release && cmake --build --preset linux-release

# 모든 벤치마크 실행
./cmake-build-linux-release/bench_example  # 또는 바이너리 이름

# 이름으로 필터
./cmake-build-linux-release/bench_example --benchmark_filter=BM_MyFunction

# 나중에 분석하기 위해 JSON 출력
./cmake-build-linux-release/bench_example --benchmark_out=results.json --benchmark_out_format=json

# 두 실행 비교
benchmark_compare results_before.json results_after.json
```

출력 예시:
```
Benchmark                Time        CPU      Iterations
--------------------------------------------------------
BM_VectorPushBack       45.2 ns    45.1 ns    15000000
BM_MapInsert           120.5 ns   120.3 ns     5800000
```

벤치마크는 `benchmarks/`에 있습니다. `bench_example.cpp`를 참고하여 새 벤치마크를 추가하세요.

---

### 새니타이저

새니타이저는 런타임 오류를 감지하는 컴파일러 기반 도구입니다: 버퍼 오버플로우, 데이터 레이스, 메모리 누수, 정의되지 않은 동작.

#### ASan + UBSan + LSan — 메모리 오류 및 UB

```bash
cmake --preset linux-asan && cmake --build --preset linux-asan
cd cmake-build-linux-asan && ctest --output-on-failure
```

감지 내용:
- **ASan** (AddressSanitizer) — 범위 초과 접근, use-after-free, double-free
- **UBSan** (UndefinedBehaviorSanitizer) — 정수 오버플로우, 음수 시프트, 널 포인터 역참조
- **LSan** (LeakSanitizer) — 메모리 누수

#### MSan — 초기화되지 않은 메모리

```bash
cmake --preset linux-msan && cmake --build --preset linux-msan
cd cmake-build-linux-msan && ctest --output-on-failure
```

초기화되지 않은 메모리 읽기를 감지합니다. **Clang 전용.**

#### TSan — 데이터 레이스

```bash
cmake --preset linux-tsan && cmake --build --preset linux-tsan
cd cmake-build-linux-tsan && ctest --output-on-failure
```

멀티스레드 코드의 데이터 레이스를 감지합니다.

> 새니타이저는 서로 조합할 수 없습니다 — 각각 개별 실행. CI에서는 병렬 잡으로 실행됩니다.

---

### Valgrind

Valgrind는 재컴파일 없이 작동합니다 — 이미 빌드된 Debug 바이너리를 분석합니다.

#### Memcheck — 메모리 오류

```bash
# ctest를 통한 모든 테스트 (CI 및 pre-commit 모드)
tools/profiler/run-memcheck.sh

# 특정 바이너리
tools/profiler/run-memcheck.sh my_binary
```

감지: 범위 초과 접근, use-after-free, 메모리 누수, 잘못된 시스템 호출.

#### Helgrind — 데이터 레이스

```bash
# 모든 테스트
tools/profiler/run-helgrind.sh

# 특정 바이너리
tools/profiler/run-helgrind.sh my_binary
```

TSan과 유사하지만 재컴파일 불필요. 느리지만 모든 바이너리에 작동합니다.

#### DRD — 데이터 레이스 (대안)

```bash
tools/profiler/run-drd.sh          # 모든 테스트
tools/profiler/run-drd.sh my_binary
```

Helgrind보다 정확도는 낮지만 더 빠릅니다.

> **언제 무엇을 사용할지:** 새니타이저 — 더 빠르고 개발 중에 편리. Valgrind — 최종 검증이나 재컴파일이 불가능할 때.

---

### C++ 프로파일링

#### Callgrind — 콜 그래프 및 CPU 시간

```bash
tools/profiler/run-callgrind.sh my_binary
# 결과: profiles/callgrind.out
```

시각화: `callgrind.out`을 [speedscope.app](https://speedscope.app)에 업로드 — 브라우저의 인터랙티브 플레임그래프.

표시: CPU를 가장 많이 소비하는 함수, 콜 그래프, 명령어 수.

#### Cachegrind — 캐시 미스

```bash
tools/profiler/run-cachegrind.sh my_binary
# 결과: profiles/cachegrind.out
```

표시: L1/L2/L3 캐시 미스 수, 브랜치 예측 실패. 메모리 접근 패턴 최적화에 도움.

#### Massif — 힙 사용량

```bash
tools/profiler/run-massif.sh my_binary
# 결과: profiles/massif.out (텍스트 리포트를 stdout에 출력)
```

표시: 시간에 따른 힙의 증가 및 감소, 할당 피크.

#### perf — 시스템 프로파일링

```bash
tools/profiler/run-perf.sh my_binary
```

빠른 Linux 샘플링 프로파일러. 최소한의 오버헤드로 핫스팟을 표시합니다.

---

### Python 프로파일링 (hybrid + python/pure)

#### cProfile — 함수 호출 통계

```bash
tools/profiler/profile-python.sh
# 결과: profiles/profile.prof — 시각화: snakeviz profiles/profile.prof
```

표시: 함수별 호출 수, 총 시간 및 평균 시간. snakeviz로 브라우저에서 인터랙티브 시각화.

#### tracemalloc — 메모리 사용량

```bash
tools/profiler/profile-memory.sh
# 결과: profiles/memory_stats.txt
```

표시: 줄별 메모리 할당 상위 10개.

#### py-spy — 코드 변경 없는 샘플링 프로파일러

```bash
tools/profiler/profile-spy.sh
# 결과: profiles/pyspy.svg — 브라우저에서 열기
```

코드 변경 없이 작동하며 오버헤드가 최소한입니다. SVG 플레임그래프: 브라우저에서 열고 블록을 클릭해서 줌.

---

### 문서

#### C/C++ Pure — Doxygen

```bash
# 문서 생성
doxygen Doxyfile

# 브라우저에서 열기
xdg-open docs/html/index.html
```

주석으로 코드를 문서화:
```cpp
/// @brief 두 숫자의 합을 계산합니다
/// @param a 첫 번째 피연산자
/// @param b 두 번째 피연산자
/// @return a와 b의 합
int add(int a, int b);
```

#### Hybrid & Python Pure — Sphinx

```bash
# 문서 빌드
cd docs && make html

# 브라우저에서 열기
xdg-open docs/_build/html/index.html
```

Hybrid 템플릿은 **Breathe**를 사용하여 Doxygen에서 Sphinx로 C++ API를 가져옵니다 — C++와 Python 문서가 **furo** 테마(다크 모드 지원)로 통합 사이트로 구축됩니다.

#### 게시

- **GitHub Pages** — 모든 템플릿: `main`에 푸시할 때마다 자동 게시
- **ReadTheDocs** — Hybrid 및 Python Pure만: 매 푸시 시 자동 게시 (모든 브랜치와 태그, 버전 관리 포함)

ReadTheDocs 설정 (Hybrid / Python Pure):
1. [readthedocs.org](https://readthedocs.org)에서 저장소 연결
2. ReadTheDocs가 `.readthedocs.yaml`을 자동으로 감지하고 매 푸시 시 빌드

---

## 라이선스

**MIT License** — Copyright © 2025–2026 Vais Vaisov

자유롭게 사용, 수정, 배포할 수 있습니다.

---

## 기여

기여를 환영합니다! [CONTRIBUTING.md](.github/CONTRIBUTING.md)를 읽고 이슈나 Pull Request를 자유롭게 열어주세요.

---

<div align="center">

*IT Project Templates — 제로에서 코딩까지 단 몇 분*

</div>
