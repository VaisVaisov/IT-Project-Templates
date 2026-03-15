# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**VS Code Dev Containers가 포함된 바로 사용 가능한 프로젝트 템플릿**

*Arch Linux 기반 · Clang 툴체인 · AI 코딩 에이전트 사전 설치*

[템플릿](#사용-가능한-템플릿) • [빠른 시작](#빠른-시작) • [설치](#설치) • [Dev Containers](#dev-container-기능) • [CI/CD](#코드-품질--cicd)

**[🇬🇧 English](README.md) · [🇷🇺 Русский](README.ru.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## 이게 무엇인가요?

몇 분 만에 제로에서 코딩까지 시작할 수 있도록 설계된 프로젝트 템플릿 모음입니다. 각 템플릿에는 Arch Linux를 실행하는 완전히 구성된 **VS Code Dev Container**가 포함되어 있어 — 호스트 OS에 관계없이 모든 머신에서 동일한 환경을 제공합니다.

### 빈 프로젝트 대신 이것을 사용하는 이유?

- 🚀 **설정 시간 없음**: VS Code에서 열고 "Reopen in Container"를 클릭하면 바로 코딩 시작
- 🤖 **AI 준비 완료**: 모든 컨테이너에 Claude Code, Qwen Code, Kilo Code CLI가 사전 설치됨
- 🔒 **품질 게이트**: pre-commit 훅이 저장소에 들어가기 전에 문제를 잡아냄
- ⚙️ **CI/CD 포함**: 린팅, 빌드, 테스트, 커버리지, 문서화, 릴리즈를 위한 GitHub Actions 워크플로우
- 📝 **Conventional Commits**: commitlint가 커밋 메시지 형식을 검증
- 🌍 **크로스 플랫폼**: 동일한 스크립트가 Linux, macOS, Windows에서 동작

---

## 사용 가능한 템플릿

### C/C++ (`c-cpp/`)

| 템플릿 | 설명 |
| --- | --- |
| `pure` | CMake, Ninja, GoogleTest, Doxygen을 포함한 C/C++, lcov를 통한 커버리지 |
| `hybrid` | C/C++ + Python/Cython — 하나의 프로젝트에 두 언어, Sphinx + ReadTheDocs |
| `platformio/` | Arduino, ESP32, STM32를 위한 임베디드 개발 |

### Python (`python/`)

| 템플릿 | 설명 |
| --- | --- |
| `pure` | pytest, ruff, pylint, mypy를 포함한 Python, Sphinx + ReadTheDocs |

### PlatformIO 디바이스 (`c-cpp/platformio/`)

| 디바이스 | 보드 |
| --- | --- |
| `arduino-nano` | ATmega328P |
| `arduino-pro-micro` | ATmega32U4 |
| `esp32-devkit` | ESP32 DevKit |
| `stm32f411` | STM32F411 BlackPill |

---

## 빠른 시작

### Linux / macOS

```bash
# 원하는 위치에 클론
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# PATH에 추가 (최초 1회 설정)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # 또는 ~/.bashrc
source ~/.zshrc

# 새 프로젝트 생성
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (PowerShell)

```powershell
# 원하는 위치에 클론
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates

# 새 프로젝트 생성
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Pure C:\Projects\my_cpp_app
.\IT-Project-Templates\new-project-script.ps1 -Python -Pure C:\Projects\my_python_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Hybrid C:\Projects\my_hybrid_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -PlatformIO -Esp32Devkit C:\Projects\sensor_node
```

또는 배치 런처를 사용하세요 — 더블클릭하거나 cmd에서 실행:

```cmd
new-project-shell.bat -CCpp -Pure C:\Projects\my_cpp_app
```

### 프로젝트 생성 후

1. VS Code에서 프로젝트 폴더 열기
2. **"Reopen in Container"** 클릭 (또는 `Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. 최초 실행 시 컨테이너가 자동으로 빌드됩니다
4. Pre-commit 훅이 자동으로 설치됩니다 — 바로 시작할 수 있습니다!

---

## 사용 참조

### Linux / macOS 플래그

```
new-project [언어] [타입] [디바이스] <경로>

언어:
  --c-cpp            C/C++ 프로젝트
  --python           Python 프로젝트

타입:
  --pure             순수 C/C++ 또는 Python
  --hybrid           하이브리드 C/C++ + Python/Cython  (--c-cpp 전용)
  --platformio       임베디드 개발                     (--c-cpp 전용)

PlatformIO 디바이스:
  --arduino-nano
  --arduino-pro-micro
  --esp32-devkit
  --stm32f411
```

### Windows (PowerShell) 플래그

```
new-project-script.ps1 [언어] [타입] [디바이스] <경로>

언어:
  -CCpp              C/C++ 프로젝트
  -Python            Python 프로젝트

타입:
  -Pure              순수 C/C++ 또는 Python
  -Hybrid            하이브리드 C/C++ + Python/Cython  (-CCpp 전용)
  -PlatformIO        임베디드 개발                     (-CCpp 전용)

PlatformIO 디바이스:
  -ArduinoNano
  -ArduinoProMicro
  -Esp32Devkit
  -Stm32f411
```

---

## 설치

### 1. 저장소 클론

```bash
# Linux / macOS
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Windows (PowerShell)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates
```

### 2. PATH에 추가

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

**Windows — 시스템 PATH (영구 설정):**
```powershell
[Environment]::SetEnvironmentVariable(
    "Path",
    "$env:Path;$env:USERPROFILE\IT-Project-Templates",
    "User"
)
```

> **참고 (Linux/macOS):** `new-project.sh`는 클론 후 이미 실행 가능합니다. 그렇지 않은 경우: `chmod +x new-project.sh`

### 3. 사전 요구 사항

| 도구 | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | 필수 — [docker.com](https://www.docker.com/) | 필수 — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **VS Code** | 필수 — [code.visualstudio.com](https://code.visualstudio.com/) | 필수 |
| **Dev Containers 확장** | 필수 — VS Code에서 설치 | 필수 |
| **GitHub CLI** | 권장 — `gh auth login` | 권장 |
| **Python** | 하이브리드/Python 템플릿용 | 하이브리드/Python 템플릿용 |
| **Git** | 필수 | 필수 |

> **GitHub CLI 팁:** 호스트에서 `gh auth login`으로 한 번만 인증하세요. 컨테이너는 호스트의 `~/.config/gh`를 bind-mount합니다 — Dev Container 안에서 재인증이 필요 없습니다.

---

## 저장소 구조

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # 자동 의존성 업데이트 (Actions + pre-commit)
├── c-cpp/
│   ├── pure/                   # 순수 C/C++ 템플릿
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
│   ├── hybrid/                 # C/C++ + Python/Cython 템플릿
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
│   └── platformio/             # 임베디드 템플릿
│       ├── .devcontainer/      # 공유 devcontainer (PlatformIO + Clang)
│       ├── .vscode/            # 공유 VS Code 설정
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       └── stm32f411/
├── python/
│   └── pure/                   # 순수 Python 템플릿
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
├── meta-template/              # 새 템플릿 생성을 위한 기반
├── new-project.sh              # Linux / macOS 스크립트
├── new-project-script.ps1      # Windows PowerShell 스크립트
├── new-project-shell.bat       # Windows 배치 런처
├── LICENSE
└── README.md
```

---

## Dev Container 기능

모든 컨테이너는 **Arch Linux (최신)** 기반으로 빌드되며 다음을 포함합니다:

- **셸**: Oh My Zsh + Powerlevel10k가 적용된 Zsh
- **에디터**: Neovim
- **VCS**: Git, git-delta, GitHub CLI
- **AI 에이전트**: Claude Code, Qwen Code, Kilo Code CLI (AUR에서 설치) — 모두 CLI 도구로 사용 가능
- **Docker**: Docker + Docker Buildx + Lazydocker (컨테이너 안에서 컨테이너 실행용)
- **GitHub 인증**: 호스트에서 bind-mount된 `~/.config/gh` — 재인증 불필요

### C/C++ 컨테이너

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### C/C++ 하이브리드 컨테이너

C/C++의 모든 것에 추가로:

- Python 3, pip, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (문서화)

### Python 컨테이너

- Python 3, pip, virtualenv
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo
- pre-commit

### PlatformIO 컨테이너

- PlatformIO Core + udev 규칙
- Clang, cppcheck (코드 분석용)
- Python 3, pip
- pre-commit
- USB 디바이스 접근 (컨테이너가 `--privileged`로 실행됨)

---

## VS Code 확장

모든 템플릿은 Dev Container에서 열 때 확장을 자동으로 설치하며, Docker 없이 열 때는 권장 사항으로 표시합니다.

### 공통 (모든 템플릿)

| 카테고리 | 확장 | 목적 |
| --- | --- | --- |
| **AI** | Claude Code | AI 에이전트 (CLI + VS Code) |
| | TONGYI Lingma | AI 어시스턴트 및 코드 자동 완성 |
| | Kilo Code | 400개 이상의 모델을 지원하는 AI 에이전트 |
| **Git** | GitLens | 고급 Git 기능 (블레임, 히스토리) |
| | Git Graph | 시각적 커밋 히스토리 |
| **코드 품질** | Better Comments | 다채로운 TODO/FIXME/NOTE 주석 |
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

### 하이브리드 템플릿

모든 C/C++ 및 Python 확장이 결합됩니다.

### PlatformIO 템플릿

- **PlatformIO IDE** — 임베디드 개발 플랫폼
- **Wokwi Simulator** — VS Code 내에서 직접 Arduino/ESP32/STM32 인터랙티브 시뮬레이션
- **C/C++ Tools** — 마이크로컨트롤러 코드 지원

---

## 코드 품질 & CI/CD

### Pre-commit 훅

훅은 각 커밋 전에 자동으로 실행됩니다. Dev Container가 시작될 때(`postCreateCommand`) 설치됩니다 — 일반 훅과 커밋 메시지 훅 모두.

#### C/C++ 프로젝트
- **clang-format** — 자동 코드 포맷팅 (LLVM 스타일)
- **clang-tidy** — 버그 및 스타일 문제에 대한 정적 분석
- **cppcheck** — 메모리 누수, null 포인터 검사, 정의되지 않은 동작
- **valgrind memcheck** — 런타임 메모리 오류 감지 (hybrid + pure)

#### Python 프로젝트
- **ruff** — 빠른 린팅 + 임포트 정렬 (flake8 + isort 대체)
- **ruff-format** — 코드 포맷팅 (black 호환)
- **pylint** — 깊은 의미론적 분석: 도달 불가능한 코드, 잘못된 인수 수, 존재하지 않는 속성 접근
- **mypy** — 정적 타입 검사

#### 모든 프로젝트
- **commitlint** — [Conventional Commits](https://www.conventionalcommits.org/)에 따른 커밋 메시지 형식 검증
- YAML 유효성 검사
- 대용량 파일 감지 (> 1 MB)
- 후행 공백 제거
- 파일 끝 수정
- 병합 충돌 감지

> 훅이 실패하면 문제가 수정될 때까지 커밋이 차단됩니다. 이로써 손상된 코드가 저장소에 들어가지 않습니다.

### GitHub Actions

각 템플릿에는 두 개의 워크플로우가 포함됩니다: `ci.yml`(매 push/PR 시 실행)과 `release.yml`(`v*` 태그 시 실행).

#### C/C++ Pure & Hybrid
- **Lint**: pre-commit 검사 (clang-format, clang-tidy, cppcheck, commitlint)
- **Build**: 프리셋을 사용한 CMake Debug + Release 빌드
- **Test**: ctest를 통한 GoogleTest 테스트
- **Coverage**: gcov + lcov — HTML 보고서를 아티팩트로 업로드
- **Docs**: Doxygen (pure) 또는 Doxygen + Sphinx/furo (hybrid)
- **Pages**: `main` 브랜치 push 시 GitHub Pages에 문서 자동 게시
- **Release**: `v*` 태그 시 — 바이너리 + Python Wheel 빌드, GitHub Release 생성

#### Python Pure
- **Lint**: pre-commit 검사 (ruff, pylint, mypy, commitlint)
- **Test**: pytest
- **Coverage**: pytest-cov — XML 보고서 + 아티팩트
- **Docs**: Sphinx + furo, ReadTheDocs를 통해 게시
- **Release**: `v*` 태그 시 — wheel + sdist 빌드, GitHub Release 생성

#### PlatformIO
- **Lint**: pre-commit 검사 (clang-format, cppcheck, commitlint)
- **Build**: `pio run` — 펌웨어 컴파일
- **Test**: `pio test` (test 디렉토리가 있는 경우)
- **Size**: `pio run --target size` — 펌웨어 크기 보고서
- **Static analysis**: `pio check --fail-on-defect high`
- **Wokwi CI**: 클라우드에서 펌웨어 시뮬레이션 — 실제 하드웨어 없이 Serial 출력 검증 (GitHub Secrets에 `WOKWI_CLI_TOKEN` 필요, 월 50분 무료)
- **Release**: `v*` 태그 시 — `.elf`/`.hex`/`.bin`을 GitHub Release에 업로드

> **Wokwi CI와 VS Code 확장**은 동일한 `diagram.json`을 사용합니다 — [wokwi.com](https://wokwi.com)에서 그린 회로도. 자세한 내용은 생성된 프로젝트의 `@PROJECT_NAME@.md`를 참조하세요.

모든 워크플로우는 개발 환경과의 일관성을 위해 **Arch Linux 컨테이너**에서 실행됩니다.

### Dependabot

저장소 루트에 `.github/dependabot.yml`이 있습니다 — 모든 템플릿의 버전이 최신인지 자동으로 모니터링하고 PR을 통해 업데이트를 제안합니다. 대상:

- **GitHub Actions** — actions/checkout, upload-artifact 등의 버전
- **pre-commit hooks** — clang-format, ruff, mypy, pylint 등의 리비전

업데이트는 매주 확인됩니다 — 버전 수동 추적 불필요.

### AI 에이전트를 위한 컨텍스트

생성된 각 프로젝트에는 `@PROJECT_NAME@.md` 파일이 포함됩니다 — 아키텍처 설명, 스택, 빌드 지침, AI 에이전트 규칙이 담긴 단일 진실 소스입니다. `CLAUDE.md`, `QWEN.md`, `AGENTS.md`는 이 파일에 대한 심볼릭 링크이므로 Claude Code, Qwen Code, Kilo Code가 자동으로 동일한 컨텍스트를 읽습니다.

---

## 문서화

### C/C++ Pure

문서는 **Doxygen**을 통해 생성되며 `main`에 push할 때마다 **GitHub Pages**에 자동으로 게시됩니다.

### C/C++ Hybrid & Python Pure

문서는 **Sphinx**와 **furo** 테마(다크 모드 지원)로 빌드되고 **ReadTheDocs**를 통해 게시됩니다. Hybrid 템플릿은 추가로 **Breathe**를 사용하여 Doxygen의 C++ API를 Sphinx에 가져옵니다.

ReadTheDocs 연결 방법:
1. [readthedocs.org](https://readthedocs.org)에서 저장소 연결
2. ReadTheDocs가 `.readthedocs.yaml`을 자동으로 감지하고 매 push마다 빌드를 시작합니다

---

## 라이선스

**MIT 라이선스** — Copyright © 2025–2026 Vais Vaisov

자유롭게 사용, 수정, 배포하세요.

---

## 기여

기여를 환영합니다! 이슈를 열거나 Pull Request를 제출해 주세요.

---

<div align="center">

*IT Project Templates — 몇 분 만에 제로에서 코드까지*

</div>
