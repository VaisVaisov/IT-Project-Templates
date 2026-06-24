# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**Template di progetto pronti all'uso con VS Code Dev Containers**

*Arch Linux · toolchain Clang · agenti AI pre-installati*

[Template](#template-disponibili) • [Avvio rapido](#avvio-rapido) • [Installazione](#installazione) • [Dev Container](#funzionalità-del-dev-container) • [CI/CD](#qualità-del-codice--cicd) • [PlatformIO](#template-platformio) • [Funzionalità](#funzionalità--come-usarle)

**[🇷🇺 Русский](README.ru.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇬🇧 English](README.md)**

</div>

---

## Cos'è questo?

Una raccolta di template di progetto che ti permettono di iniziare a sviluppare in pochi minuti. Ogni template include un **VS Code Dev Container** completamente configurato basato su Arch Linux — lo stesso ambiente su qualsiasi macchina, indipendentemente dal sistema operativo host.

### Perché usarlo?

- 🚀 **Zero configurazione**: apri in VS Code, clicca "Reopen in Container" — inizia subito a programmare
- 🤖 **Pronto per l'AI**: Claude Code, Qwen Code e Kilo Code pre-installati in ogni container
- 🔒 **Controlli di qualità**: gli hook pre-commit bloccano i problemi prima che raggiungano il repository
- ⚙️ **CI/CD incluso**: GitHub Actions per linting, build, test, coverage, documentazione e release
- 📝 **Conventional Commits**: commitlint impone il formato dei messaggi di commit
- 🌍 **Cross-platform**: uno script funziona su Linux, macOS e Windows (via WSL2)

---

## Template disponibili

### C/C++ (`c-cpp/`)

| Template | Descrizione |
| --- | --- |
| `pure` | C/C++ con CMake, Ninja, GoogleTest, Google Benchmark, Doxygen, coverage lcov |
| `hybrid` | C/C++ + Python/Cython — entrambi i linguaggi in un progetto, Sphinx + ReadTheDocs |
| `platformio/` | Sviluppo embedded (Arduino, ESP32, ESP8266, Pico, STM32) |

### Python (`python/`)

| Template | Descrizione |
| --- | --- |
| `pure` | Python con pytest, ruff, pylint, mypy, Sphinx + ReadTheDocs |

### Dispositivi PlatformIO (`c-cpp/platformio/`)

| Directory | Scheda | Architettura | Wokwi CI |
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

> \* STM32F411: Wokwi usa `board-st-nucleo-f411re` (stesso MCU STM32F411, pinout diverso) — vedi la sezione [PlatformIO](#template-platformio). ESP8266: non supportato da Wokwi — solo build.

---

## Avvio rapido

### Linux / macOS

```bash
# Clona dove preferisci
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Aggiungi al PATH (una volta sola)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # o ~/.bashrc
source ~/.zshrc

# Crea un nuovo progetto
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (WSL2)

Su Windows, l'intero ecosistema gira tramite WSL2. Installa WSL2 e usa lo stesso script:

```bash
# Clona nella home di WSL2
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Aggiungi al PATH (una volta, in WSL2)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # o ~/.bashrc
source ~/.zshrc

# Crea un nuovo progetto (da WSL2)
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Dopo aver creato un progetto

1. Apri la cartella del progetto in VS Code
2. Clicca **"Reopen in Container"** (o `Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. Il container si costruisce automaticamente al primo avvio
4. Gli hook pre-commit si installano da soli — sei pronto!

---

## Riferimento comandi

```
new-project [--help] <linguaggio> <tipo> [dispositivo] <percorso>

Linguaggio:
  --c-cpp            Progetto C/C++
  --python           Progetto Python

Tipo:
  --pure             C/C++ o Python puro
  --hybrid           Ibrido C/C++ + Python/Cython  (solo --c-cpp)
  --platformio       Sviluppo embedded              (solo --c-cpp)

Dispositivi PlatformIO (Arduino):
  --arduino-nano          Arduino Nano (ATmega328P)
  --arduino-pro-micro     Arduino Pro Micro (ATmega32U4, USB HID)

Dispositivi PlatformIO (ESP32):
  --esp32-devkit          ESP32 DevKit V1 (Xtensa LX6, WiFi + BT)
  --esp32-s2-saola        ESP32-S2 Saola (Xtensa LX7, USB OTG)
  --esp32-s3-devkitc      ESP32-S3 DevKitC (Xtensa LX7, AI+IoT)
  --esp32-c3-devkitm      ESP32-C3 DevKitM (RISC-V, WiFi + BT)
  --esp32-c6-devkitc      ESP32-C6 DevKitC (RISC-V, WiFi 6 + Zigbee)
  --esp32-h2-devkitm      ESP32-H2 DevKitM (RISC-V, Zigbee + Thread)

Dispositivi PlatformIO (altri):
  --esp8266-wemos-d1-mini Wemos D1 Mini (ESP8266, WiFi) — solo build, no Wokwi
  --rpi-pico              Raspberry Pi Pico (RP2040, dual-core ARM Cortex-M0+)
  --stm32f411-blackpill   STM32F411 Black Pill (Cortex-M4, 100 MHz)
  --stm32f103-bluepill    STM32F103 Blue Pill (Cortex-M3, 72 MHz)

Opzioni:
  --help, -h         Mostra questo aiuto ed esci
```

---

## Installazione

### 1. Clona il repository

```bash
# Linux / macOS / Windows (WSL2)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates
```

### 2. Aggiungi al PATH

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

> **Nota:** `new-project.sh` è già eseguibile dopo il clone. Se non lo fosse: `chmod +x new-project.sh`

### 3. Prerequisiti

| Strumento | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Richiesto — [docker.com](https://www.docker.com/) | Richiesto — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **WSL2** | — | Richiesto — [Guida installazione WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) + estensione **WSL** in VS Code |
| **VS Code** | Richiesto — [code.visualstudio.com](https://code.visualstudio.com/) | Richiesto |
| **Estensione Dev Containers** | Richiesta — installa da VS Code | Richiesta (apri il progetto da WSL2) |
| **GitHub CLI** | Consigliato | Consigliato (per Windows — in WSL2) |
| **uv** | Per template hybrid/python — [astral.sh/uv](https://astral.sh/uv) | Per template hybrid/python — installa in WSL2 |
| **Git** | Richiesto | Richiesto — installa in WSL2 |

> **Suggerimento GitHub CLI:** autenticati una volta sull'host (per Windows — in WSL2) con `gh auth login`. Il container monta `~/.config/gh` dall'host — nessuna nuova autenticazione necessaria nei Dev Container.

---

## Struttura del progetto

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # Aggiornamenti automatici delle dipendenze (Actions + pre-commit)
├── c-cpp/
│   ├── pure/                   # Template C/C++ puro
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB + lcov + valgrind
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Esempi Google Benchmark
│   │   ├── tools/profiler/     # Script Valgrind + perf
│   │   └── ...
│   ├── hybrid/                 # Template C/C++ + Python/Cython
│   │   ├── .devcontainer/      # Clang + Python + Cython + ruff + pylint
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Esempi Google Benchmark
│   │   ├── tools/profiler/     # Valgrind + perf + profiler Python
│   │   └── ...
│   └── platformio/             # Template embedded
│       ├── devcontainers/      # Dev container per famiglia di schede
│       │   ├── base/           # Arduino + ESP (PlatformIO + Clang)
│       │   ├── stm32/          # STM32 (+ strumenti ST-Link + GDB)
│       │   └── pico/           # Raspberry Pi Pico (+ picotool)
│       ├── .vscode/            # Configurazione VS Code condivisa
│       ├── arduino/            # Template famiglia Arduino
│       ├── esp32/              # Template famiglia ESP32
│       ├── esp8266/            # Template famiglia ESP8266
│       ├── stm32/              # Template famiglia STM32
│       └── pico/               # Template Raspberry Pi Pico
├── python/
│   └── pure/                   # Template Python puro
│       ├── .devcontainer/      # Python + ruff + pylint + mypy
│       ├── .github/
│       │   ├── workflows/      # ci.yml + release.yml
│       │   └── ISSUE_TEMPLATE/
│       ├── .vscode/
│       ├── tools/profiler/     # Profiler Python
│       └── ...
├── meta-template/              # Base per creare nuovi template
├── new-project.sh              # Script per Linux / macOS / Windows (WSL2)
├── LICENSE
└── README.md
```

---

## Funzionalità del Dev Container

Ogni container è costruito su **Arch Linux (latest)** e include:

- **Shell**: Zsh con Oh My Zsh + Powerlevel10k
- **Editor**: Neovim
- **VCS**: Git, git-delta, GitHub CLI
- **Agenti AI**: Claude Code, Qwen Code, Kilo Code CLI (da AUR) — tutti disponibili come strumenti CLI
- **Docker**: Docker + Docker Buildx + Lazydocker (per eseguire container dentro container)
- **Auth GitHub**: `~/.config/gh` montato dall'host — nessuna nuova autenticazione necessaria

### Container C/C++

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### Container Hybrid (C/C++ + Python)

Tutto da C/C++, più:

- Python 3, pip, uv, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (documentazione)
- py-spy, memory-profiler (profilazione Python)

### Container Python

- Python 3, pip, uv, virtualenv
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo
- pre-commit

### Container PlatformIO (Arduino + ESP)

- PlatformIO Core + regole udev
- Clang, cppcheck (analisi statica)
- Python 3, pip
- pre-commit
- Accesso dispositivi USB (il container gira con `--privileged`)

### Container PlatformIO (STM32)

Tutto da Arduino + ESP, più:

- stlink (`st-flash`, `st-info`, `st-util` — flashing e debug via ST-Link)
- GDB (debugger per connettersi al server GDB `st-util`)

### Container PlatformIO (Pico)

Tutto da Arduino + ESP, più:

- picotool (gestione firmware Raspberry Pi Pico senza BOOTSEL)

---

## Estensioni VS Code

Tutti i template installano automaticamente le estensioni all'apertura in un Dev Container e le mostrano come consigliate quando si apre senza Docker.

### Comuni (tutti i template)

| Categoria | Estensione | Scopo |
| --- | --- | --- |
| **AI** | Claude Code | Agente AI (CLI + VS Code) |
| | TONGYI Lingma | Assistente AI e completamento codice |
| | Kilo Code | Agente AI che supporta 400+ modelli |
| **Git** | GitLens | Funzionalità Git avanzate (blame, cronologia) |
| | Git Graph | Grafico visuale dei commit |
| **Qualità** | Better Comments | Commenti TODO/FIXME/NOTE colorati |
| | Code Spell Checker | Controllo ortografico nel codice e commenti |
| **Docker** | Docker | Gestione container |
| **Markdown** | Markdown All in One | Supporto Markdown completo |
| | Markdown Converter | Esporta in PDF/HTML/Word |
| **Formati** | YAML (Red Hat) | Supporto YAML |
| | JSON (Meezilla) | Editing JSON avanzato |

### Template C/C++

- **C/C++ Tools** — IntelliSense e debug
- **clangd** — Analisi avanzata del codice e navigazione
- **Code Runner** — Esecuzione rapida del codice

### Template Python

- **Python** + **Pylance** — Supporto core e language server
- **debugpy** — Debugger Python
- **Python Envs** — Gestione ambienti virtuali
- **autodocstring** — Generazione automatica docstring
- **Django** + **Jinja** — Supporto framework (Python puro)

### Template Hybrid

Tutte le estensioni C/C++ e Python combinate.

### Template PlatformIO

- **PlatformIO IDE** — Piattaforma di sviluppo embedded
- **Wokwi Simulator** — Simulatore interattivo Arduino/ESP32/STM32 direttamente in VS Code
- **C/C++ Tools** — Supporto codice microcontrollore

---

## Qualità del codice & CI/CD

### Hook Pre-commit

Gli hook vengono eseguiti automaticamente prima di ogni commit. Sia gli hook regolari che l'hook commit-msg vengono installati all'avvio del Dev Container (`postCreateCommand`).

#### Progetti C/C++
- **clang-format** — Formattazione automatica del codice (stile LLVM)
- **clang-tidy** — Analisi statica per bug e problemi di stile
- **cppcheck** — Memory leak, controlli null pointer, comportamento indefinito
- **valgrind memcheck** — Rilevamento errori di memoria a runtime (hybrid + pure)

#### Progetti Python
- **ruff** — Linting veloce + ordinamento import (sostituisce flake8 + isort)
- **ruff-format** — Formattazione codice (compatibile con black)
- **pylint** — Analisi semantica approfondita: codice irraggiungibile, conteggio argomenti errato, attributi mancanti
- **mypy** — Controllo statico dei tipi

#### Tutti i progetti
- **commitlint** — Impone il formato [Conventional Commits](https://www.conventionalcommits.org/)
- **detect-secrets** — Blocca i commit contenenti segreti (chiavi API, token, password)
- Validazione YAML
- Rilevamento file grandi (> 1 MB)
- Rimozione spazi finali
- Correzione fine file
- Rilevamento conflitti di merge

> Se un hook fallisce, il commit viene bloccato finché il problema non viene risolto. Questo mantiene il codice rotto fuori dal repository.

### GitHub Actions

Ogni template include due workflow: `ci.yml` (eseguito su ogni push/PR) e `release.yml` (eseguito sui tag `v*`).

#### C/C++ Pure & Hybrid
- **Lint**: controlli pre-commit (clang-format, clang-tidy, cppcheck, commitlint)
- **Build**: preset CMake Debug + Release
- **Test**: suite GoogleTest via ctest
- **Benchmark**: esegue i binari Google Benchmark (se presenti in `benchmarks/`)
- **Coverage**: gcov + lcov — report HTML + riepilogo nell'UI di GitHub Actions + badge coverage su GitHub Pages
- **Sanitize ASan**: AddressSanitizer + UBSan + LeakSanitizer — errori di memoria e UB
- **Sanitize MSan**: MemorySanitizer (Clang) — letture da memoria non inizializzata
- **Sanitize TSan**: ThreadSanitizer — data race nel codice multithreaded
- **Valgrind**: `ctest -T memcheck` — analisi dettagliata della memoria sull'intera suite di test
- **Matrix**: Python 3.10–3.13 (solo hybrid)
- **Security**: Trivy — scansione CVE (HIGH/CRITICAL, blocca il merge)
- **Docs**: Doxygen (pure) o Doxygen + Sphinx/furo (hybrid) → GitHub Pages su `main`
- **Release**: sul tag `v*` — git-cliff genera il CHANGELOG, compila gli artifact, crea una GitHub Release

#### Python Pure
- **Lint**: controlli pre-commit (ruff, pylint, mypy, commitlint)
- **Test**: pytest + riepilogo coverage nell'UI di GitHub Actions + commento coverage sulla PR
- **Badge coverage**: pubblicato su GitHub Pages su `main`
- **Matrix**: Python 3.10–3.13
- **Security**: Trivy — scansione CVE (HIGH/CRITICAL, blocca il merge)
- **Docs**: Sphinx + furo → GitHub Pages (`main`) + ReadTheDocs (tutti i branch/tag)
- **Release**: sul tag `v*` — git-cliff genera il CHANGELOG, compila wheel + sdist, crea una GitHub Release

Tutti i workflow girano su **container Arch Linux** per la massima coerenza con l'ambiente di sviluppo.

### Dependabot

Un `.github/dependabot.yml` nella root di questo repository mantiene automaticamente tutti i template aggiornati aprendo PR quando sono disponibili nuove versioni. Copre:

- Versioni di **GitHub Actions** (actions/checkout, upload-artifact, ecc.)
- Revisioni degli **hook pre-commit** (clang-format, ruff, mypy, pylint, ecc.)

Gli aggiornamenti vengono controllati settimanalmente — nessun tracciamento manuale delle versioni necessario.

### Contesto per agenti AI

Ogni progetto generato include un file `@PROJECT_NAME@.md` — unica fonte di verità che descrive l'architettura del progetto, lo stack tecnologico, le istruzioni di build e le regole per gli agenti AI. `CLAUDE.md`, `QWEN.md` e `AGENTS.md` sono symlink che puntano a questo file, così Claude Code, Qwen Code e Kilo Code leggono automaticamente lo stesso contesto.

---

## Template PlatformIO

### Schede supportate

| Directory | Scheda | Architettura | Wokwi CI |
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

> \* STM32F411: Wokwi non supporta direttamente la BlackPill — `diagram.json` usa `board-st-nucleo-f411re` (stesso MCU STM32F411, pinout diverso). ESP8266: non supportato da Wokwi — solo build.

### Wokwi: simulazione senza hardware

Wokwi ti permette di eseguire il firmware nel browser o in VS Code senza hardware fisico.

**Configurazione VS Code:**
1. Installa l'estensione **Wokwi Simulator**
2. Attiva la licenza (gratuita per progetti personali) tramite `Ctrl+Shift+P` → "Wokwi: Request Free License"
3. Apri `diagram.json` nella root del progetto — lo schema si apre nell'editor Wokwi
4. Premi ▶ per avviare la simulazione

**Configurazione Wokwi CI (GitHub Actions):**
1. Ottieni un token su [wokwi.com/ci](https://wokwi.com/ci)
2. Aggiungilo ai GitHub Secrets: `Settings` → `Secrets and variables` → `Actions` → `New repository secret` → `WOKWI_CLI_TOKEN`
3. La CI eseguirà automaticamente la simulazione e verificherà l'output Serial

**Schema `diagram.json`:**
Disegna il circuito su [wokwi.com](https://wokwi.com), scarica `diagram.json` e sostituisci il file nel progetto. La CI Wokwi e l'estensione VS Code condividono lo stesso file.

### Comandi base

```bash
pio run                        # Compila il firmware
pio run -t upload              # Compila e carica sul dispositivo
pio device monitor             # Apri il Serial Monitor
pio device monitor --baud 115200
pio test                       # Esegui test unitari sul dispositivo
pio run --target size          # Report dimensione firmware
pio check                      # Analisi statica
```

### Scelta del framework

Tutti i template usano `framework = arduino` di default. Modificalo in `platformio.ini`:

```ini
[env:esp32dev]
platform = espressif32
board    = esp32dev
framework = arduino      ; default — ricco ecosistema di librerie

; Alternative (decommenta secondo necessità):
; framework = espidf     ; ESP-IDF — controllo completo, SDK nativo Espressif
; framework = arduino    ; può essere combinato con componenti ESP-IDF
```

| Framework | Piattaforma | Quando usarlo |
| --- | --- | --- |
| `arduino` | Tutti | Massime librerie pronte, avvio rapido |
| `espidf` | ESP32 | Controllo completo, stack Bluetooth/WiFi, FreeRTOS |
| `arduino` (con ESP-IDF) | ESP32 | Librerie Arduino + componenti ESP-IDF |
| `pico-sdk` | Raspberry Pi Pico | Accesso diretto all'SDK RP2040 |
| `arduino` | Pico | Compatibilità ecosistema Arduino |

### Caricamento del firmware

Il protocollo di upload è impostato in `platformio.ini`:

```ini
; upload_protocol = esptool     ; ESP32/ESP8266 — USB UART (default)
; upload_protocol = espota      ; ESP32/ESP8266 — OTA (over the air)
; upload_protocol = esp-prog    ; ESP32 — debugger JTAG
; upload_protocol = stlink      ; STM32 — programmatore ST-Link
; upload_protocol = picotool    ; Raspberry Pi Pico — USB (tieni premuto BOOTSEL)
; upload_protocol = arduino     ; Arduino AVR — via bootloader
; upload_protocol = usbasp      ; Arduino AVR — programmatore USBasp
```

### CI/CD

- **Lint**: controlli pre-commit (clang-format, cppcheck, commitlint)
- **Build**: `pio run` — compilazione firmware
- **Test**: `pio test` (se esiste la directory test)
- **Size**: `pio run --target size` — report dimensione firmware
- **Analisi statica**: `pio check --fail-on-defect high`
- **Wokwi CI**: simulazione firmware cloud (tranne ESP8266) — configurazione nella sezione [Wokwi](#wokwi-simulazione-senza-hardware) sopra
- **Release**: sul tag `v*` — carica `.elf`/`.hex`/`.bin` nella GitHub Release

I workflow girano su **container Arch Linux** per la massima coerenza con l'ambiente di sviluppo.

---

## Funzionalità & come usarle

### Test

#### C/C++ (GoogleTest)

```bash
# Compila ed esegui tutti i test
cmake --preset linux-debug && cmake --build --preset linux-debug
cd cmake-build-linux-debug && ctest --output-on-failure

# Esegui un test specifico
ctest -R MyTest --output-on-failure

# Output verboso
ctest -V
```

I test si trovano in `test/`. Ogni `*_test.cpp` viene rilevato automaticamente da CMake.

#### Python (pytest)

```bash
# Esegui tutti i test
python -m pytest -v

# File o test specifico
python -m pytest tests/test_module.py::test_function -v

# Traceback breve in caso di fallimento
python -m pytest -v --tb=short
```

---

### Coverage del codice

#### C++ — lcov

```bash
# Compila con coverage
cmake --preset linux-coverage && cmake --build --preset linux-coverage

# Esegui i test e genera il report
cd cmake-build-linux-coverage
ctest --output-on-failure
lcov --capture --directory . --output-file coverage.info
lcov --remove coverage.info '/usr/*' '*/libraries/*' '*/test/*' --output-file coverage.info
genhtml coverage.info --output-directory coverage-html

# Apri il report nel browser
xdg-open coverage-html/index.html
```

Il report HTML mostra la coverage per file, funzione e riga. Verde = coperto, rosso = non coperto.

#### Python — pytest-cov

```bash
# Coverage con output nel terminale
python -m pytest --cov --cov-report=term

# Report HTML
python -m pytest --cov --cov-report=html
xdg-open htmlcov/index.html

# Mostra le righe non coperte
python -m pytest --cov --cov-report=term-missing
```

#### Badge e commenti sulle PR

Dopo il push su `main`, GitHub Actions pubblica automaticamente un badge coverage su GitHub Pages. Su ogni PR, un commento mostra la percentuale di coverage attuale.

---

### Google Benchmark

Google Benchmark misura le prestazioni di singole funzioni con precisione al nanosecondo.

```bash
# Compila in Release (obbligatorio — il Debug distorce i risultati)
cmake --preset linux-release && cmake --build --preset linux-release

# Esegui tutti i benchmark
./cmake-build-linux-release/bench_example  # o il nome del tuo binario

# Filtra per nome
./cmake-build-linux-release/bench_example --benchmark_filter=BM_MyFunction

# Output come JSON per analisi successive
./cmake-build-linux-release/bench_example --benchmark_out=results.json --benchmark_out_format=json

# Confronta due esecuzioni
benchmark_compare results_before.json results_after.json
```

Output di esempio:
```
Benchmark                Time        CPU      Iterations
--------------------------------------------------------
BM_VectorPushBack       45.2 ns    45.1 ns    15000000
BM_MapInsert           120.5 ns   120.3 ns     5800000
```

I benchmark si trovano in `benchmarks/`. Aggiungine di nuovi seguendo `bench_example.cpp`.

---

### Sanitizer

I sanitizer sono strumenti basati sul compilatore che rilevano errori a runtime: buffer overflow, data race, memory leak e comportamento indefinito.

#### ASan + UBSan + LSan — errori di memoria e UB

```bash
cmake --preset linux-asan && cmake --build --preset linux-asan
cd cmake-build-linux-asan && ctest --output-on-failure
```

Cosa rileva:
- **ASan** (AddressSanitizer) — accesso fuori dai limiti, use-after-free, double-free
- **UBSan** (UndefinedBehaviorSanitizer) — overflow intero, shift negativo, dereferenziazione null pointer
- **LSan** (LeakSanitizer) — memory leak

#### MSan — memoria non inizializzata

```bash
cmake --preset linux-msan && cmake --build --preset linux-msan
cd cmake-build-linux-msan && ctest --output-on-failure
```

Rileva letture da memoria non inizializzata. **Solo Clang.**

#### TSan — data race

```bash
cmake --preset linux-tsan && cmake --build --preset linux-tsan
cd cmake-build-linux-tsan && ctest --output-on-failure
```

Rileva data race nel codice multithreaded.

> I sanitizer non possono essere combinati tra loro — ognuno gira separatamente. In CI girano come job paralleli.

---

### Valgrind

Valgrind funziona senza ricompilazione — analizza un binario Debug già compilato.

#### Memcheck — errori di memoria

```bash
# Tutti i test via ctest (modalità CI e pre-commit)
tools/profiler/run-memcheck.sh

# Binario specifico
tools/profiler/run-memcheck.sh my_binary
```

Rileva: accesso fuori dai limiti, use-after-free, memory leak, syscall non valide.

#### Helgrind — data race

```bash
# Tutti i test
tools/profiler/run-helgrind.sh

# Binario specifico
tools/profiler/run-helgrind.sh my_binary
```

Simile a TSan, ma senza bisogno di ricompilare. Più lento, ma funziona su qualsiasi binario.

#### DRD — data race (alternativa)

```bash
tools/profiler/run-drd.sh          # tutti i test
tools/profiler/run-drd.sh my_binary
```

Meno preciso di Helgrind, ma più veloce.

> **Quando usare cosa:** Sanitizer — più veloci, comodi durante lo sviluppo. Valgrind — per la verifica finale o quando la ricompilazione non è possibile.

---

### Profilazione C++

#### Callgrind — call graph e tempo CPU

```bash
tools/profiler/run-callgrind.sh my_binary
# Output: profiles/callgrind.out
```

Visualizza: carica `callgrind.out` su [speedscope.app](https://speedscope.app) — flamegraph interattivo nel browser.

Mostra: quali funzioni consumano più CPU, call graph, conteggio istruzioni.

#### Cachegrind — cache miss

```bash
tools/profiler/run-cachegrind.sh my_binary
# Output: profiles/cachegrind.out
```

Mostra: conteggio cache miss L1/L2/L3, branch misprediction. Aiuta a ottimizzare i pattern di accesso alla memoria.

#### Massif — utilizzo heap

```bash
tools/profiler/run-massif.sh my_binary
# Output: profiles/massif.out (con report testuale su stdout)
```

Mostra: crescita e riduzione dell'heap nel tempo, picchi di allocazione.

#### perf — profilazione di sistema

```bash
tools/profiler/run-perf.sh my_binary
```

Profiler di campionamento Linux veloce. Mostra i punti critici con overhead minimo.

---

### Profilazione Python (hybrid + python/pure)

#### cProfile — statistiche chiamate di funzione

```bash
tools/profiler/profile-python.sh
# Output: profiles/profile.prof — visualizza: snakeviz profiles/profile.prof
```

Mostra: conteggio chiamate per funzione, tempo totale e medio. Visualizza interattivamente con snakeviz nel browser.

#### tracemalloc — utilizzo della memoria

```bash
tools/profiler/profile-memory.sh
# Output: profiles/memory_stats.txt
```

Mostra: top-10 allocazioni di memoria per riga.

#### py-spy — profiler a campionamento senza modifiche al codice

```bash
tools/profiler/profile-spy.sh
# Output: profiles/pyspy.svg — apri nel browser
```

Funziona senza modifiche al codice, overhead minimo. Flamegraph SVG: apri nel browser, clicca i blocchi per zoomare.

---

### Documentazione

#### C/C++ Pure — Doxygen

```bash
# Genera la documentazione
doxygen Doxyfile

# Apri nel browser
xdg-open docs/html/index.html
```

Documenta il codice con commenti:
```cpp
/// @brief Calcola la somma di due numeri
/// @param a primo operando
/// @param b secondo operando
/// @return somma di a e b
int add(int a, int b);
```

#### Hybrid & Python Pure — Sphinx

```bash
# Compila la documentazione
cd docs && make html

# Apri nel browser
xdg-open docs/_build/html/index.html
```

Il template hybrid usa **Breathe** per importare l'API C++ da Doxygen in Sphinx — la documentazione C++ e Python viene unificata in un unico sito con il tema **furo** (supporto dark mode).

#### Pubblicazione

- **GitHub Pages** — tutti i template: automaticamente ad ogni push su `main`
- **ReadTheDocs** — solo Hybrid e Python Pure: automaticamente ad ogni push (tutti i branch e tag, con versioning)

Per configurare ReadTheDocs (Hybrid / Python Pure):
1. Collega il repository su [readthedocs.org](https://readthedocs.org)
2. ReadTheDocs rileverà automaticamente `.readthedocs.yaml` e compilerà ad ogni push

---

## Licenza

**Licenza MIT** — Copyright © 2025–2026 Vais Vaisov

Libero di usare, modificare e distribuire.

---

## Contribuire

I contributi sono benvenuti! Leggi [CONTRIBUTING.md](.github/CONTRIBUTING.md) e sentiti libero di aprire una issue o inviare una Pull Request.

---

<div align="center">

*IT Project Templates — da zero a programmare in pochi minuti*

</div>
