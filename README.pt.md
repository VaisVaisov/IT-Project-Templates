# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**Templates de projeto prontos para usar com VS Code Dev Containers**

*Arch Linux · Toolchain Clang · Agentes de IA pré-instalados*

[Templates](#templates-disponíveis) • [Início rápido](#início-rápido) • [Instalação](#instalação) • [Dev Containers](#funcionalidades-dev-container) • [CI/CD](#qualidade-de-código--cicd) • [PlatformIO](#templates-platformio) • [Funcionalidades](#funcionalidades--uso)

**[🇷🇺 Русский](README.ru.md) · [🇬🇧 English](README.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## O que é isso?

Uma coleção de templates de projeto que permitem começar a desenvolver em minutos. Cada template vem com um **VS Code Dev Container** completamente configurado baseado em Arch Linux — o mesmo ambiente em qualquer máquina, independente do SO host.

### Por que usar?

- 🚀 **Zero configuração**: abrir no VS Code, clicar em "Reopen in Container" — começar a codar imediatamente
- 🤖 **Pronto para IA**: Claude Code, Qwen Code e Kilo Code pré-instalados em cada container
- 🔒 **Portas de qualidade**: hooks pre-commit detectam problemas antes de chegarem ao repositório
- ⚙️ **CI/CD incluído**: GitHub Actions para lint, build, testes, cobertura, docs e releases
- 📝 **Conventional Commits**: commitlint impõe o formato das mensagens de commit
- 🌍 **Multiplataforma**: um script funciona no Linux, macOS e Windows (via WSL2)

---

## Templates disponíveis

### C/C++ (`c-cpp/`)

| Template | Descrição |
| --- | --- |
| `pure` | C/C++ com CMake, Ninja, GoogleTest, Google Benchmark, Doxygen, cobertura lcov |
| `hybrid` | C/C++ + Python/Cython — ambas as linguagens em um projeto, Sphinx + ReadTheDocs |
| `platformio/` | Desenvolvimento embarcado (Arduino, ESP32, ESP8266, Pico, STM32) |

### Python (`python/`)

| Template | Descrição |
| --- | --- |
| `pure` | Python com pytest, ruff, pylint, mypy, Sphinx + ReadTheDocs |

### Dispositivos PlatformIO (`c-cpp/platformio/`)

| Diretório | Placa | Arquitetura | Wokwi CI |
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

> \* STM32F411: Wokwi usa `board-st-nucleo-f411re` (mesmo MCU, pinout diferente) — ver seção [PlatformIO](#templates-platformio). ESP8266: Wokwi não suportado — apenas build.

---

## Início rápido

### Linux / macOS

```bash
# Clonar em qualquer lugar
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Criar um link simbólico em ~/.local/bin
ln -s ~/IT-Project-Templates/new-project.sh ~/.local/bin/new-project

# Criar um novo projeto
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (WSL2)

No Windows, todo o ecossistema funciona via WSL2. Instale o WSL2 e use o mesmo script:

```bash
# Clonar no home do WSL2
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Criar um link simbólico em ~/.local/bin (no WSL2)
ln -s ~/IT-Project-Templates/new-project.sh ~/.local/bin/new-project

# Criar um novo projeto (do WSL2)
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Após criar um projeto

1. Abrir a pasta do projeto no VS Code
2. Clicar em **"Reopen in Container"** (ou `Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. O container é construído automaticamente no primeiro uso
4. Os hooks pre-commit se instalam sozinhos — pronto para codar!

---

## Referência de uso

```
new-project [--help] <linguagem> <tipo> [dispositivo] <caminho>

Linguagem:
  --c-cpp            Projeto C/C++
  --python           Projeto Python

Tipo:
  --pure             C/C++ ou Python puro
  --hybrid           Híbrido C/C++ + Python/Cython  (apenas --c-cpp)
  --platformio       Desenvolvimento embarcado        (apenas --c-cpp)

Dispositivos PlatformIO (Arduino):
  --arduino-nano          Arduino Nano (ATmega328P)
  --arduino-pro-micro     Arduino Pro Micro (ATmega32U4, USB HID)

Dispositivos PlatformIO (ESP32):
  --esp32-devkit          ESP32 DevKit V1 (Xtensa LX6, WiFi + BT)
  --esp32-s2-saola        ESP32-S2 Saola (Xtensa LX7, USB OTG)
  --esp32-s3-devkitc      ESP32-S3 DevKitC (Xtensa LX7, AI+IoT)
  --esp32-c3-devkitm      ESP32-C3 DevKitM (RISC-V, WiFi + BT)
  --esp32-c6-devkitc      ESP32-C6 DevKitC (RISC-V, WiFi 6 + Zigbee)
  --esp32-h2-devkitm      ESP32-H2 DevKitM (RISC-V, Zigbee + Thread)

Dispositivos PlatformIO (outros):
  --esp8266-wemos-d1-mini Wemos D1 Mini (ESP8266, WiFi) — apenas build, sem Wokwi
  --rpi-pico              Raspberry Pi Pico (RP2040, dual-core ARM Cortex-M0+)
  --stm32f411-blackpill   STM32F411 Black Pill (Cortex-M4, 100 MHz)
  --stm32f103-bluepill    STM32F103 Blue Pill (Cortex-M3, 72 MHz)

Opções:
  --help, -h         Mostrar ajuda e sair
```

---

## Instalação

### 1. Clonar o repositório

```bash
# Linux / macOS / Windows (WSL2)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates
```

### 2. Criar um link simbólico

```bash
ln -s ~/IT-Project-Templates/new-project.sh ~/.local/bin/new-project
```

> **Nota:** `new-project.sh` já é executável após clonar. Se não for: `chmod +x new-project.sh`

### 3. Pré-requisitos

| Ferramenta | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Obrigatório — [docker.com](https://www.docker.com/) | Obrigatório — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **WSL2** | — | Obrigatório — [Guia de instalação WSL2](https://learn.microsoft.com/pt-br/windows/wsl/install) + extensão **WSL** no VS Code |
| **VS Code** | Obrigatório — [code.visualstudio.com](https://code.visualstudio.com/) | Obrigatório |
| **Extensão Dev Containers** | Obrigatório — instalar do VS Code | Obrigatório (abrir projeto do WSL2) |
| **GitHub CLI** | Recomendado | Recomendado (para Windows — no WSL2) |
| **uv** | Para templates hybrid/python — [astral.sh/uv](https://astral.sh/uv) | Para templates hybrid/python — instalar no WSL2 |
| **Git** | Obrigatório | Obrigatório — instalar no WSL2 |

> **Dica GitHub CLI:** autentique-se uma vez no host (para Windows — no WSL2) com `gh auth login`. O container monta `~/.config/gh` do host — não é necessário re-autenticar dentro do Dev Container.

---

## Estrutura do projeto

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # Atualizações automáticas de dependências (Actions + pre-commit)
├── c-cpp/
│   ├── pure/                   # Template C/C++ puro
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB + lcov + valgrind
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Exemplos Google Benchmark
│   │   ├── tools/profiler/     # Scripts Valgrind + perf
│   │   └── ...
│   ├── hybrid/                 # Template C/C++ + Python/Cython
│   │   ├── .devcontainer/      # Clang + Python + Cython + ruff + pylint
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Exemplos Google Benchmark
│   │   ├── tools/profiler/     # Valgrind + perf + profilers Python
│   │   └── ...
│   └── platformio/             # Templates embarcados
│       ├── devcontainers/      # Dev-containers por família de placa
│       │   ├── base/           # Arduino + ESP (PlatformIO + Clang)
│       │   ├── stm32/          # STM32 (+ ferramentas ST-Link + GDB)
│       │   └── pico/           # Raspberry Pi Pico (+ picotool)
│       ├── .vscode/            # Configuração VS Code compartilhada
│       ├── arduino/            # Template família Arduino
│       ├── esp32/              # Template família ESP32
│       ├── esp8266/            # Template família ESP8266
│       ├── stm32/              # Template família STM32
│       └── pico/               # Template Raspberry Pi Pico
├── python/
│   └── pure/                   # Template Python puro
│       ├── .devcontainer/      # Python + ruff + pylint + mypy
│       ├── .github/
│       │   ├── workflows/      # ci.yml + release.yml
│       │   └── ISSUE_TEMPLATE/
│       ├── .vscode/
│       ├── tools/profiler/     # Profilers Python
│       └── ...
├── meta-template/              # Base para criar novos templates
├── new-project.sh              # Script para Linux / macOS / Windows (WSL2)
├── LICENSE
└── README.md
```

---

## Funcionalidades Dev Container

Cada container é construído sobre **Arch Linux (latest)** e inclui:

- **Shell**: Zsh com Oh My Zsh + Powerlevel10k
- **Editor**: Neovim
- **VCS**: Git, git-delta, GitHub CLI
- **Agentes IA**: Claude Code, Qwen Code, Kilo Code CLI (do AUR) — todos disponíveis como ferramentas CLI
- **Docker**: Docker + Docker Buildx + Lazydocker (para executar containers dentro de containers)
- **Auth GitHub**: `~/.config/gh` montado do host — sem necessidade de re-autenticação

### Containers C/C++

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### Containers Hybrid (C/C++ + Python)

Tudo do C/C++, mais:

- Python 3, pip, uv, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (documentação)
- py-spy, memory-profiler (profiling Python)

### Containers Python

- Python 3, pip, uv, virtualenv
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo
- pre-commit

### Containers PlatformIO

- PlatformIO Core + regras udev
- Clang, cppcheck (análise estática)
- Python 3, pip
- pre-commit
- Acesso a dispositivos USB (container executado com `--privileged`)

---

## Extensões VS Code

Todos os templates instalam extensões automaticamente ao abrir em um Dev Container e as mostram como recomendações sem Docker.

### Comuns (todos os templates)

| Categoria | Extensão | Propósito |
| --- | --- | --- |
| **IA** | Claude Code | Agente IA (CLI + VS Code) |
| | TONGYI Lingma | Assistente IA e autocompletar |
| | Kilo Code | Agente IA com suporte a 400+ modelos |
| **Git** | GitLens | Funcionalidades Git avançadas (blame, histórico) |
| | Git Graph | Grafo visual de commits |
| **Qualidade** | Better Comments | Comentários TODO/FIXME/NOTE coloridos |
| | Code Spell Checker | Verificação ortográfica em código e comentários |
| **Docker** | Docker | Gerenciamento de containers |
| **Markdown** | Markdown All in One | Suporte completo a Markdown |
| | Markdown Converter | Exportar para PDF/HTML/Word |
| **Formatos** | YAML (Red Hat) | Suporte YAML |
| | JSON (Meezilla) | Edição JSON aprimorada |

### Templates C/C++

- **C/C++ Tools** — IntelliSense e depuração
- **clangd** — Análise de código avançada e navegação
- **Code Runner** — Execução rápida de código

### Templates Python

- **Python** + **Pylance** — Suporte base e servidor de linguagem
- **debugpy** — Depurador Python
- **Python Envs** — Gerenciamento de ambientes virtuais
- **autodocstring** — Auto-geração de docstrings
- **Django** + **Jinja** — Suporte a frameworks (Python puro)

### Templates Hybrid

Todas as extensões de C/C++ e Python combinadas.

### Templates PlatformIO

- **PlatformIO IDE** — Plataforma de desenvolvimento embarcado
- **Wokwi Simulator** — Simulador interativo Arduino/ESP32/STM32 diretamente no VS Code
- **C/C++ Tools** — Suporte a código de microcontrolador

---

## Qualidade de código & CI/CD

### Hooks pre-commit

Hooks executam automaticamente antes de cada commit. São instalados quando o Dev Container inicia (`postCreateCommand`).

#### Projetos C/C++
- **clang-format** — Formatação automática de código (estilo LLVM)
- **clang-tidy** — Análise estática para bugs e problemas de estilo
- **cppcheck** — Vazamentos de memória, ponteiro nulo, comportamento indefinido
- **valgrind memcheck** — Detecção de erros de memória em runtime (hybrid + pure)

#### Projetos Python
- **ruff** — Linting rápido + ordenação de imports (substitui flake8 + isort)
- **ruff-format** — Formatação de código (compatível com black)
- **pylint** — Análise semântica profunda: código inacessível, argumentos incorretos, atributos ausentes
- **mypy** — Verificação estática de tipos

#### Todos os projetos
- **commitlint** — Impõe o formato [Conventional Commits](https://www.conventionalcommits.org/)
- **detect-secrets** — Bloqueia commits com secrets (chaves API, tokens, senhas)
- Validação YAML
- Detecção de arquivos grandes (> 1 MB)
- Remoção de espaços no fim de linha
- Corretor de fim de arquivo
- Detecção de conflitos de merge

> Se um hook falhar, o commit é bloqueado até que o problema seja resolvido. Isso impede que código quebrado entre no repositório.

### GitHub Actions

Cada template inclui dois workflows: `ci.yml` (a cada push/PR) e `release.yml` (em tags `v*`).

#### C/C++ Pure & Hybrid
- **Lint**: verificações pre-commit (clang-format, clang-tidy, cppcheck, commitlint)
- **Build**: presets CMake Debug + Release
- **Test**: suites GoogleTest via ctest
- **Benchmark**: executa binários Google Benchmark (se presentes em `benchmarks/`)
- **Coverage**: gcov + lcov — relatório HTML + resumo no GitHub Actions UI + badge no GitHub Pages
- **Sanitize ASan**: AddressSanitizer + UBSan + LeakSanitizer — erros de memória e UB
- **Sanitize MSan**: MemorySanitizer (Clang) — leituras de memória não inicializada
- **Sanitize TSan**: ThreadSanitizer — data races em código multithreaded
- **Valgrind**: `ctest -T memcheck` — análise detalhada de memória em toda a suite de testes
- **Matrix**: Python 3.10–3.13 (apenas hybrid)
- **Security**: Trivy — scan CVE (HIGH/CRITICAL, bloqueia merge)
- **Docs**: Doxygen (pure) ou Doxygen + Sphinx/furo (hybrid) → GitHub Pages no push para `main`
- **Release**: na tag `v*` — git-cliff gera CHANGELOG, constrói artefatos, cria GitHub Release

#### Python Pure
- **Lint**: verificações pre-commit (ruff, pylint, mypy, commitlint)
- **Test**: pytest + resumo de cobertura no GitHub Actions UI + comentário de cobertura no PR
- **Badge de cobertura**: publicado no GitHub Pages no push para `main`
- **Matrix**: Python 3.10–3.13
- **Security**: Trivy — scan CVE (HIGH/CRITICAL, bloqueia merge)
- **Docs**: Sphinx + furo → GitHub Pages (`main`) + ReadTheDocs (todas as branches/tags)
- **Release**: na tag `v*` — git-cliff gera CHANGELOG, constrói wheel + sdist, cria GitHub Release

Todos os workflows executam em **containers Arch Linux** para total consistência com o ambiente de desenvolvimento.

### Dependabot

Um `.github/dependabot.yml` na raiz deste repositório mantém todos os templates atualizados automaticamente. Cobre:

- Versões do **GitHub Actions** (actions/checkout, upload-artifact, etc.)
- Revisões dos **hooks pre-commit** (clang-format, ruff, mypy, pylint, etc.)

Atualizações verificadas semanalmente — sem rastreamento manual de versões.

### Contexto para agentes IA

Cada projeto gerado contém um arquivo `@PROJECT_NAME@.md` — fonte única da verdade descrevendo a arquitetura do projeto, stack tecnológico, instruções de build e regras para agentes IA. `CLAUDE.md`, `QWEN.md` e `AGENTS.md` são links simbólicos apontando para este arquivo, então Claude Code, Qwen Code e Kilo Code leem o mesmo contexto automaticamente.

---

## Templates PlatformIO

### Placas suportadas

| Diretório | Placa | Arquitetura | Wokwi CI |
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

> \* STM32F411: Wokwi não suporta BlackPill diretamente — `diagram.json` usa `board-st-nucleo-f411re` (mesmo MCU STM32F411, pinout diferente). ESP8266: Wokwi não suportado — apenas build.

### Wokwi: Simulação sem hardware

Wokwi permite executar firmware no navegador ou VS Code sem hardware físico.

**Configuração VS Code:**
1. Instalar a extensão **Wokwi Simulator**
2. Ativar a licença (gratuita para projetos pessoais) via `Ctrl+Shift+P` → "Wokwi: Request Free License"
3. Abrir `diagram.json` na raiz do projeto — o esquemático abre no editor Wokwi
4. Pressionar ▶ para iniciar a simulação

**Configuração Wokwi CI (GitHub Actions):**
1. Obter um token em [wokwi.com/ci](https://wokwi.com/ci)
2. Adicionar ao GitHub Secrets: `Settings` → `Secrets and variables` → `Actions` → `New repository secret` → `WOKWI_CLI_TOKEN`
3. A CI executará automaticamente a simulação e verificará a saída Serial

**Esquemático `diagram.json`:**
Desenhe o circuito em [wokwi.com](https://wokwi.com), baixe `diagram.json` e substitua o arquivo no projeto. Wokwi CI e a extensão VS Code compartilham o mesmo arquivo.

### Comandos básicos

```bash
pio run                        # Compilar firmware
pio run -t upload              # Compilar e gravar no dispositivo
pio device monitor             # Abrir Serial Monitor
pio device monitor --baud 115200
pio test                       # Executar testes unitários no dispositivo
pio run --target size          # Relatório de tamanho do firmware
pio check                      # Análise estática
```

### Seleção de framework

Todos os templates usam `framework = arduino` por padrão. Alterar em `platformio.ini`:

```ini
[env:esp32dev]
platform = espressif32
board    = esp32dev
framework = arduino      ; padrão — rico ecossistema de bibliotecas

; Alternativas (descomentar conforme necessário):
; framework = espidf     ; ESP-IDF — controle total, SDK nativo Espressif
; framework = arduino    ; pode ser combinado com componentes ESP-IDF
```

| Framework | Plataforma | Quando usar |
| --- | --- | --- |
| `arduino` | Todos | Máximo de bibliotecas prontas, início rápido |
| `espidf` | ESP32 | Controle total, stack Bluetooth/WiFi, FreeRTOS |
| `arduino` (com ESP-IDF) | ESP32 | Bibliotecas Arduino + componentes ESP-IDF |
| `pico-sdk` | Raspberry Pi Pico | Acesso direto ao SDK RP2040 |
| `arduino` | Pico | Compatibilidade com ecossistema Arduino |

### Gravação do firmware

O protocolo de upload é definido em `platformio.ini`:

```ini
; upload_protocol = esptool     ; ESP32/ESP8266 — USB UART (padrão)
; upload_protocol = espota      ; ESP32/ESP8266 — OTA (over the air)
; upload_protocol = esp-prog    ; ESP32 — depurador JTAG
; upload_protocol = stlink      ; STM32 — programador ST-Link
; upload_protocol = picotool    ; Raspberry Pi Pico — USB (segurar BOOTSEL)
; upload_protocol = arduino     ; Arduino AVR — via bootloader
; upload_protocol = usbasp      ; Arduino AVR — programador USBasp
```

### CI/CD

- **Lint**: verificações pre-commit (clang-format, cppcheck, commitlint)
- **Build**: `pio run` — compilação do firmware
- **Test**: `pio test` (se existir diretório test)
- **Size**: `pio run --target size` — relatório de tamanho do firmware
- **Static analysis**: `pio check --fail-on-defect high`
- **Wokwi CI**: simulação de firmware na nuvem (exceto ESP8266) — configuração na seção [Wokwi](#wokwi-simulação-sem-hardware) acima
- **Release**: na tag `v*` — faz upload de `.elf`/`.hex`/`.bin` para GitHub Release

Workflows executam em **containers Arch Linux** para total consistência com o ambiente de desenvolvimento.

---

## Funcionalidades & Uso

### Testes

#### C/C++ (GoogleTest)

```bash
# Compilar e executar todos os testes
cmake --preset linux-debug && cmake --build --preset linux-debug
cd cmake-build-linux-debug && ctest --output-on-failure

# Executar um teste específico
ctest -R MyTest --output-on-failure

# Saída detalhada
ctest -V
```

Testes ficam em `test/`. Cada `*_test.cpp` é detectado automaticamente pelo CMake.

#### Python (pytest)

```bash
# Executar todos os testes
python -m pytest -v

# Arquivo ou teste específico
python -m pytest tests/test_module.py::test_function -v

# Traceback curto em caso de falha
python -m pytest -v --tb=short
```

---

### Cobertura de código

#### C++ — lcov

```bash
# Compilar com cobertura
cmake --preset linux-coverage && cmake --build --preset linux-coverage

# Executar testes e gerar relatório
cd cmake-build-linux-coverage
ctest --output-on-failure
lcov --capture --directory . --output-file coverage.info
lcov --remove coverage.info '/usr/*' '*/libraries/*' '*/test/*' --output-file coverage.info
genhtml coverage.info --output-directory coverage-html

# Abrir relatório no navegador
xdg-open coverage-html/index.html
```

O relatório HTML mostra cobertura por arquivo, função e linha. Verde = coberto, vermelho = não coberto.

#### Python — pytest-cov

```bash
# Cobertura com saída no terminal
python -m pytest --cov --cov-report=term

# Relatório HTML
python -m pytest --cov --cov-report=html
xdg-open htmlcov/index.html

# Mostrar linhas não cobertas
python -m pytest --cov --cov-report=term-missing
```

#### Badges e comentários em PR

Após push para `main`, o GitHub Actions publica automaticamente um badge de cobertura no GitHub Pages. Em cada PR aparece um comentário com o percentual de cobertura atual.

---

### Google Benchmark

Google Benchmark mede a performance de funções individuais com precisão de nanossegundos.

```bash
# Compilar em Release (obrigatório — Debug distorce os resultados)
cmake --preset linux-release && cmake --build --preset linux-release

# Executar todos os benchmarks
./cmake-build-linux-release/bench_example  # ou o nome do seu binário

# Filtrar por nome
./cmake-build-linux-release/bench_example --benchmark_filter=BM_MyFunction

# Saída JSON para análise posterior
./cmake-build-linux-release/bench_example --benchmark_out=results.json --benchmark_out_format=json

# Comparar duas execuções
benchmark_compare results_before.json results_after.json
```

Exemplo de saída:
```
Benchmark                Time        CPU      Iterations
--------------------------------------------------------
BM_VectorPushBack       45.2 ns    45.1 ns    15000000
BM_MapInsert           120.5 ns   120.3 ns     5800000
```

Benchmarks ficam em `benchmarks/`. Adicione novos seguindo o modelo `bench_example.cpp`.

---

### Sanitizers

Sanitizers são ferramentas baseadas no compilador que detectam erros em runtime: buffer overflows, data races, vazamentos de memória e comportamento indefinido.

#### ASan + UBSan + LSan — erros de memória e UB

```bash
cmake --preset linux-asan && cmake --build --preset linux-asan
cd cmake-build-linux-asan && ctest --output-on-failure
```

O que detecta:
- **ASan** (AddressSanitizer) — acesso fora dos limites, use-after-free, double-free
- **UBSan** (UndefinedBehaviorSanitizer) — overflow de inteiro, shift negativo, dereference de ponteiro nulo
- **LSan** (LeakSanitizer) — vazamentos de memória

#### MSan — memória não inicializada

```bash
cmake --preset linux-msan && cmake --build --preset linux-msan
cd cmake-build-linux-msan && ctest --output-on-failure
```

Detecta leituras de memória não inicializada. **Apenas Clang.**

#### TSan — data races

```bash
cmake --preset linux-tsan && cmake --build --preset linux-tsan
cd cmake-build-linux-tsan && ctest --output-on-failure
```

Detecta data races em código multithreaded.

> Sanitizers não podem ser combinados entre si — cada um executa separadamente. Na CI executam como jobs paralelos.

---

### Valgrind

Valgrind funciona sem recompilação — analisa um binário Debug já compilado.

#### Memcheck — erros de memória

```bash
# Todos os testes via ctest (modo CI e pre-commit)
tools/profiler/run-memcheck.sh

# Binário específico
tools/profiler/run-memcheck.sh my_binary
```

Detecta: acesso fora dos limites, use-after-free, vazamentos de memória, syscalls inválidas.

#### Helgrind — data races

```bash
# Todos os testes
tools/profiler/run-helgrind.sh

# Binário específico
tools/profiler/run-helgrind.sh my_binary
```

Similar ao TSan, mas sem recompilação. Mais lento, mas funciona em qualquer binário.

#### DRD — data races (alternativa)

```bash
tools/profiler/run-drd.sh          # todos os testes
tools/profiler/run-drd.sh my_binary
```

Menos preciso que Helgrind, mas mais rápido.

> **Quando usar o quê:** Sanitizers — mais rápidos, convenientes durante o desenvolvimento. Valgrind — para verificação final ou quando recompilação não é possível.

---

### Profiling C++

#### Callgrind — grafo de chamadas e tempo de CPU

```bash
tools/profiler/run-callgrind.sh my_binary
# Resultado: profiles/callgrind.out
```

Visualizar: fazer upload de `callgrind.out` em [speedscope.app](https://speedscope.app) — flamegraph interativo no navegador.

Mostra: quais funções consomem mais CPU, grafo de chamadas, contagem de instruções.

#### Cachegrind — cache misses

```bash
tools/profiler/run-cachegrind.sh my_binary
# Resultado: profiles/cachegrind.out
```

Mostra: contagem de cache misses L1/L2/L3, erros de previsão de branches. Ajuda a otimizar padrões de acesso à memória.

#### Massif — uso do heap

```bash
tools/profiler/run-massif.sh my_binary
# Resultado: profiles/massif.out (com relatório de texto no stdout)
```

Mostra: crescimento e queda do heap ao longo do tempo, picos de alocação.

#### perf — profiling de sistema

```bash
tools/profiler/run-perf.sh my_binary
```

Sampling profiler rápido do Linux. Mostra hot spots com overhead mínimo.

---

### Profiling Python (hybrid + python/pure)

#### cProfile — estatísticas de chamadas de funções

```bash
tools/profiler/profile-python.sh
# Resultado: profiles/profile.prof — visualizar: snakeviz profiles/profile.prof
```

Mostra: número de chamadas por função, tempo total e médio. Visualização interativa com snakeviz no navegador.

#### tracemalloc — uso de memória

```bash
tools/profiler/profile-memory.sh
# Resultado: profiles/memory_stats.txt
```

Mostra: top-10 de alocações de memória por linha.

#### py-spy — sampling profiler sem alterar o código

```bash
tools/profiler/profile-spy.sh
# Resultado: profiles/pyspy.svg — abrir no navegador
```

Funciona sem alterações no código, overhead mínimo. Flamegraph SVG: abrir no navegador, clicar nos blocos para zoom.

---

### Documentação

#### C/C++ Pure — Doxygen

```bash
# Gerar documentação
doxygen Doxyfile

# Abrir no navegador
xdg-open docs/html/index.html
```

Documente o código com comentários:
```cpp
/// @brief Calcula a soma de dois números
/// @param a primeiro operando
/// @param b segundo operando
/// @return soma de a e b
int add(int a, int b);
```

#### Hybrid & Python Pure — Sphinx

```bash
# Construir documentação
cd docs && make html

# Abrir no navegador
xdg-open docs/_build/html/index.html
```

O template hybrid usa **Breathe** para importar a API C++ do Doxygen para o Sphinx — a documentação C++ e Python é construída em um site unificado com o tema **furo** (suporte a modo escuro).

#### Publicação

- **GitHub Pages** — todos os templates: automaticamente a cada push para `main`
- **ReadTheDocs** — apenas Hybrid e Python Pure: automaticamente a cada push (todas as branches e tags, com versionamento)

Para configurar o ReadTheDocs (Hybrid / Python Pure):
1. Conectar o repositório em [readthedocs.org](https://readthedocs.org)
2. O ReadTheDocs detectará `.readthedocs.yaml` automaticamente e fará build a cada push

---

## Licença

**MIT License** — Copyright © 2025–2026 Vais Vaisov

Livre para usar, modificar e distribuir.

---

## Contribuindo

Contribuições são bem-vindas! Leia [CONTRIBUTING.md](.github/CONTRIBUTING.md) e fique à vontade para abrir uma issue ou Pull Request.

---

<div align="center">

*IT Project Templates — do zero ao código em minutos*

</div>
