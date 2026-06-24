# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**Fertige Projektvorlagen mit VS Code Dev Containers**

*Arch Linux · Clang toolchain · KI-Coding-Agenten vorinstalliert*

[Vorlagen](#verfügbare-vorlagen) • [Schnellstart](#schnellstart) • [Installation](#installation) • [Dev Containers](#dev-container-funktionen) • [CI/CD](#codequalität--cicd) • [PlatformIO](#platformio-vorlagen) • [Funktionen](#funktionen--verwendung)

**[🇷🇺 Русский](README.ru.md) · [🇬🇧 English](README.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## Was ist das?

Eine Sammlung von Projektvorlagen, mit denen du in wenigen Minuten mit der Entwicklung beginnen kannst. Jede Vorlage wird mit einem vollständig konfigurierten **VS Code Dev Container** auf Basis von Arch Linux geliefert — dieselbe Umgebung auf jedem Rechner, unabhängig vom Host-Betriebssystem.

### Warum sollte man das nutzen?

- 🚀 **Kein Setup**: in VS Code öffnen, „Reopen in Container" klicken — sofort loslegen
- 🤖 **KI-bereit**: Claude Code, Qwen Code und Kilo Code in jedem Container vorinstalliert
- 🔒 **Qualitätssicherung**: pre-commit Hooks fangen Probleme ab, bevor sie ins Repository gelangen
- ⚙️ **CI/CD inklusive**: GitHub Actions für Linting, Builds, Tests, Coverage, Docs und Releases
- 📝 **Conventional Commits**: commitlint erzwingt das Format von Commit-Nachrichten
- 🌍 **Plattformübergreifend**: ein Skript funktioniert auf Linux, macOS und Windows (über WSL2)

---

## Verfügbare Vorlagen

### C/C++ (`c-cpp/`)

| Vorlage | Beschreibung |
| --- | --- |
| `pure` | C/C++ mit CMake, Ninja, GoogleTest, Google Benchmark, Doxygen, lcov Coverage |
| `hybrid` | C/C++ + Python/Cython — beide Sprachen in einem Projekt, Sphinx + ReadTheDocs |
| `platformio/` | Embedded-Entwicklung (Arduino, ESP32, ESP8266, Pico, STM32) |

### Python (`python/`)

| Vorlage | Beschreibung |
| --- | --- |
| `pure` | Python mit pytest, ruff, pylint, mypy, Sphinx + ReadTheDocs |

### PlatformIO-Geräte (`c-cpp/platformio/`)

| Verzeichnis | Board | Architektur | Wokwi CI |
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

> \* STM32F411: Wokwi verwendet `board-st-nucleo-f411re` (gleicher MCU, anderes Pinout) — siehe Abschnitt [PlatformIO](#platformio-vorlagen). ESP8266: Wokwi nicht unterstützt — nur Build.

---

## Schnellstart

### Linux / macOS

```bash
# Irgendwo klonen
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Symlink in ~/.local/bin erstellen
ln -s ~/IT-Project-Templates/new-project.sh ~/.local/bin/new-project

# Neues Projekt erstellen
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (WSL2)

Unter Windows läuft das gesamte Ökosystem über WSL2. WSL2 installieren und dasselbe Skript verwenden:

```bash
# In WSL2 Home klonen
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Symlink in ~/.local/bin erstellen (in WSL2)
ln -s ~/IT-Project-Templates/new-project.sh ~/.local/bin/new-project

# Neues Projekt erstellen (aus WSL2)
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Nach dem Erstellen eines Projekts

1. Projektordner in VS Code öffnen
2. **„Reopen in Container"** klicken (oder `Ctrl+Shift+P` → „Dev Containers: Reopen in Container")
3. Der Container wird beim ersten Start automatisch gebaut
4. Pre-commit Hooks installieren sich selbst — bereit zum Loslegen!

---

## Verwendungsreferenz

```
new-project [--help] <Sprache> <Typ> [Gerät] <Pfad>

Sprache:
  --c-cpp            C/C++ Projekt
  --python           Python Projekt

Typ:
  --pure             Reines C/C++ oder Python
  --hybrid           Hybrid C/C++ + Python/Cython  (nur --c-cpp)
  --platformio       Embedded-Entwicklung           (nur --c-cpp)

PlatformIO-Geräte (Arduino):
  --arduino-nano          Arduino Nano (ATmega328P)
  --arduino-pro-micro     Arduino Pro Micro (ATmega32U4, USB HID)

PlatformIO-Geräte (ESP32):
  --esp32-devkit          ESP32 DevKit V1 (Xtensa LX6, WiFi + BT)
  --esp32-s2-saola        ESP32-S2 Saola (Xtensa LX7, USB OTG)
  --esp32-s3-devkitc      ESP32-S3 DevKitC (Xtensa LX7, AI+IoT)
  --esp32-c3-devkitm      ESP32-C3 DevKitM (RISC-V, WiFi + BT)
  --esp32-c6-devkitc      ESP32-C6 DevKitC (RISC-V, WiFi 6 + Zigbee)
  --esp32-h2-devkitm      ESP32-H2 DevKitM (RISC-V, Zigbee + Thread)

PlatformIO-Geräte (sonstige):
  --esp8266-wemos-d1-mini Wemos D1 Mini (ESP8266, WiFi) — nur Build, kein Wokwi
  --rpi-pico              Raspberry Pi Pico (RP2040, Dual-Core ARM Cortex-M0+)
  --stm32f411-blackpill   STM32F411 Black Pill (Cortex-M4, 100 MHz)
  --stm32f103-bluepill    STM32F103 Blue Pill (Cortex-M3, 72 MHz)

Optionen:
  --help, -h         Diese Hilfe anzeigen und beenden
```

---

## Installation

### 1. Repository klonen

```bash
# Linux / macOS / Windows (WSL2)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates
```

### 2. Symlink erstellen

```bash
ln -s ~/IT-Project-Templates/new-project.sh ~/.local/bin/new-project
```

> **Hinweis:** `new-project.sh` ist nach dem Klonen bereits ausführbar. Falls nicht: `chmod +x new-project.sh`

### 3. Voraussetzungen

| Werkzeug | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Erforderlich — [docker.com](https://www.docker.com/) | Erforderlich — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **WSL2** | — | Erforderlich — [WSL2 Installationsanleitung](https://learn.microsoft.com/de-de/windows/wsl/install) + **WSL**-Erweiterung in VS Code |
| **VS Code** | Erforderlich — [code.visualstudio.com](https://code.visualstudio.com/) | Erforderlich |
| **Dev Containers Erweiterung** | Erforderlich — aus VS Code installieren | Erforderlich (Projekt aus WSL2 öffnen) |
| **GitHub CLI** | Empfohlen | Empfohlen (für Windows — in WSL2) |
| **uv** | Für hybrid/python Vorlagen — [astral.sh/uv](https://astral.sh/uv) | Für hybrid/python Vorlagen — in WSL2 installieren |
| **Git** | Erforderlich | Erforderlich — in WSL2 installieren |

> **GitHub CLI Tipp:** einmalig auf dem Host (für Windows — in WSL2) mit `gh auth login` authentifizieren. Der Container mountet `~/.config/gh` vom Host — keine erneute Authentifizierung im Dev Container nötig.

---

## Projektstruktur

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # Automatische Abhängigkeitsaktualisierungen (Actions + pre-commit)
├── c-cpp/
│   ├── pure/                   # Reines C/C++ Template
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB + lcov + valgrind
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Google Benchmark Beispiele
│   │   ├── tools/profiler/     # Valgrind + perf Skripte
│   │   └── ...
│   ├── hybrid/                 # C/C++ + Python/Cython Template
│   │   ├── .devcontainer/      # Clang + Python + Cython + ruff + pylint
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Google Benchmark Beispiele
│   │   ├── tools/profiler/     # Valgrind + perf + Python Profiler
│   │   └── ...
│   └── platformio/             # Embedded-Templates
│       ├── devcontainers/      # Dev-Container nach Board-Familie
│       │   ├── base/           # Arduino + ESP (PlatformIO + Clang)
│       │   ├── stm32/          # STM32 (+ ST-Link-Tools + GDB)
│       │   └── pico/           # Raspberry Pi Pico (+ picotool)
│       ├── .vscode/            # Gemeinsame VS Code-Konfiguration
│       ├── arduino/            # Arduino-Familien-Template
│       ├── esp32/              # ESP32-Familien-Template
│       ├── esp8266/            # ESP8266-Familien-Template
│       ├── stm32/              # STM32-Familien-Template
│       └── pico/               # Raspberry Pi Pico Template
├── python/
│   └── pure/                   # Reines Python Template
│       ├── .devcontainer/      # Python + ruff + pylint + mypy
│       ├── .github/
│       │   ├── workflows/      # ci.yml + release.yml
│       │   └── ISSUE_TEMPLATE/
│       ├── .vscode/
│       ├── tools/profiler/     # Python Profiler
│       └── ...
├── meta-template/              # Basis für neue Vorlagen
├── new-project.sh              # Skript für Linux / macOS / Windows (WSL2)
├── LICENSE
└── README.md
```

---

## Dev Container Funktionen

Jeder Container basiert auf **Arch Linux (latest)** und enthält:

- **Shell**: Zsh mit Oh My Zsh + Powerlevel10k
- **Editor**: Neovim
- **VCS**: Git, git-delta, GitHub CLI
- **KI-Agenten**: Claude Code, Qwen Code, Kilo Code CLI (aus AUR) — alle als CLI-Tools verfügbar
- **Docker**: Docker + Docker Buildx + Lazydocker (für Container in Containern)
- **GitHub Auth**: `~/.config/gh` vom Host gemountet — keine erneute Authentifizierung nötig

### C/C++ Container

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### Hybrid Container (C/C++ + Python)

Alles aus C/C++, plus:

- Python 3, pip, uv, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (Dokumentation)
- py-spy, memory-profiler (Python Profiling)

### Python Container

- Python 3, pip, uv, virtualenv
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo
- pre-commit

### PlatformIO Container

- PlatformIO Core + udev Regeln
- Clang, cppcheck (statische Analyse)
- Python 3, pip
- pre-commit
- USB-Gerätezugriff (Container läuft mit `--privileged`)

---

## VS Code Erweiterungen

Alle Vorlagen installieren Erweiterungen automatisch beim Öffnen im Dev Container und zeigen sie als Empfehlungen ohne Docker an.

### Allgemein (alle Vorlagen)

| Kategorie | Erweiterung | Zweck |
| --- | --- | --- |
| **KI** | Claude Code | KI-Agent (CLI + VS Code) |
| | TONGYI Lingma | KI-Assistent und Code-Vervollständigung |
| | Kilo Code | KI-Agent mit Unterstützung für 400+ Modelle |
| **Git** | GitLens | Erweiterte Git-Funktionen (blame, Verlauf) |
| | Git Graph | Visueller Commit-Graph |
| **Codequalität** | Better Comments | Farbige TODO/FIXME/NOTE Kommentare |
| | Code Spell Checker | Rechtschreibprüfung in Code und Kommentaren |
| **Docker** | Docker | Container-Verwaltung |
| **Markdown** | Markdown All in One | Vollständige Markdown-Unterstützung |
| | Markdown Converter | Export nach PDF/HTML/Word |
| **Formate** | YAML (Red Hat) | YAML-Unterstützung |
| | JSON (Meezilla) | Erweitertes JSON-Editing |

### C/C++ Vorlagen

- **C/C++ Tools** — IntelliSense und Debugging
- **clangd** — Erweiterte Codeanalyse und Navigation
- **Code Runner** — Schnelle Code-Ausführung

### Python Vorlagen

- **Python** + **Pylance** — Kernunterstützung und Language Server
- **debugpy** — Python Debugger
- **Python Envs** — Verwaltung virtueller Umgebungen
- **autodocstring** — Auto-Generierung von Docstrings
- **Django** + **Jinja** — Framework-Unterstützung (Pure Python)

### Hybrid Vorlagen

Alle C/C++- und Python-Erweiterungen kombiniert.

### PlatformIO Vorlagen

- **PlatformIO IDE** — Embedded-Entwicklungsplattform
- **Wokwi Simulator** — Interaktiver Arduino/ESP32/STM32-Simulator direkt in VS Code
- **C/C++ Tools** — Mikrocontroller-Code-Unterstützung

---

## Codequalität & CI/CD

### Pre-commit Hooks

Hooks werden automatisch vor jedem Commit ausgeführt. Sie werden beim Start des Dev Containers installiert (`postCreateCommand`).

#### C/C++ Projekte
- **clang-format** — Automatische Code-Formatierung (LLVM-Stil)
- **clang-tidy** — Statische Analyse auf Bugs und Stilprobleme
- **cppcheck** — Speicherlecks, Null-Pointer, undefiniertes Verhalten
- **valgrind memcheck** — Laufzeit-Speicherfehlererkennung (hybrid + pure)

#### Python Projekte
- **ruff** — Schnelles Linting + Import-Sortierung (ersetzt flake8 + isort)
- **ruff-format** — Code-Formatierung (black-kompatibel)
- **pylint** — Tiefe semantische Analyse: unerreichbarer Code, falsche Argumentanzahl, fehlende Attribute
- **mypy** — Statische Typprüfung

#### Alle Projekte
- **commitlint** — Erzwingt das [Conventional Commits](https://www.conventionalcommits.org/) Format
- **detect-secrets** — Blockiert Commits mit Secrets (API-Keys, Tokens, Passwörter)
- YAML-Validierung
- Erkennung großer Dateien (> 1 MB)
- Entfernung von Leerzeichen am Zeilenende
- End-of-File Fixer
- Erkennung von Merge-Konflikten

> Wenn ein Hook fehlschlägt, wird der Commit blockiert bis das Problem behoben ist. So gelangt kein fehlerhafter Code ins Repository.

### GitHub Actions

Jede Vorlage enthält zwei Workflows: `ci.yml` (bei jedem Push/PR) und `release.yml` (bei `v*`-Tags).

#### C/C++ Pure & Hybrid
- **Lint**: pre-commit Prüfungen (clang-format, clang-tidy, cppcheck, commitlint)
- **Build**: CMake Debug + Release Presets
- **Test**: GoogleTest Suites via ctest
- **Benchmark**: Google Benchmark Binaries ausführen (falls in `benchmarks/` vorhanden)
- **Coverage**: gcov + lcov — HTML-Bericht + Summary in GitHub Actions UI + Coverage Badge auf GitHub Pages
- **Sanitize ASan**: AddressSanitizer + UBSan + LeakSanitizer — Speicherfehler und UB
- **Sanitize MSan**: MemorySanitizer (Clang) — nicht initialisierter Speicher
- **Sanitize TSan**: ThreadSanitizer — Data Races in Multithreading-Code
- **Valgrind**: `ctest -T memcheck` — detaillierte Speicheranalyse über alle Tests
- **Matrix**: Python 3.10–3.13 (nur hybrid)
- **Security**: Trivy — CVE-Scanning (HIGH/CRITICAL, blockiert Merge)
- **Docs**: Doxygen (pure) oder Doxygen + Sphinx/furo (hybrid) → GitHub Pages bei Push auf `main`
- **Release**: bei `v*`-Tag — git-cliff generiert CHANGELOG, baut Artefakte, erstellt GitHub Release

#### Python Pure
- **Lint**: pre-commit Prüfungen (ruff, pylint, mypy, commitlint)
- **Test**: pytest + Coverage Summary in GitHub Actions UI + PR Coverage Kommentar
- **Coverage Badge**: wird bei Push auf `main` auf GitHub Pages veröffentlicht
- **Matrix**: Python 3.10–3.13
- **Security**: Trivy — CVE-Scanning (HIGH/CRITICAL, blockiert Merge)
- **Docs**: Sphinx + furo → GitHub Pages (`main`) + ReadTheDocs (alle Branches/Tags)
- **Release**: bei `v*`-Tag — git-cliff generiert CHANGELOG, baut wheel + sdist, erstellt GitHub Release

Alle Workflows laufen auf **Arch Linux Containern** für vollständige Konsistenz mit der Entwicklungsumgebung.

### Dependabot

Eine `.github/dependabot.yml` im Root dieses Repositories hält alle Vorlagen automatisch aktuell. Abgedeckt:

- **GitHub Actions** Versionen (actions/checkout, upload-artifact, etc.)
- **pre-commit Hook** Revisionen (clang-format, ruff, mypy, pylint, etc.)

Updates werden wöchentlich geprüft — kein manuelles Versions-Tracking nötig.

### KI-Agenten-Kontext

Jedes generierte Projekt enthält eine `@PROJECT_NAME@.md`-Datei — die einzige Quelle der Wahrheit mit Projektarchitektur, Tech-Stack, Build-Anweisungen und Regeln für KI-Agenten. `CLAUDE.md`, `QWEN.md` und `AGENTS.md` sind Symlinks auf diese Datei, sodass Claude Code, Qwen Code und Kilo Code denselben Kontext lesen.

---

## PlatformIO Vorlagen

### Unterstützte Boards

| Verzeichnis | Board | Architektur | Wokwi CI |
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

> \* STM32F411: Wokwi unterstützt BlackPill nicht direkt — `diagram.json` verwendet `board-st-nucleo-f411re` (gleicher STM32F411 MCU, anderes Pinout). ESP8266: Wokwi nicht unterstützt — nur Build.

### Wokwi: Simulation ohne Hardware

Wokwi ermöglicht das Ausführen von Firmware im Browser oder in VS Code ohne physisches Gerät.

**VS Code Setup:**
1. **Wokwi Simulator** Erweiterung installieren
2. Lizenz aktivieren (kostenlos für persönliche Projekte) über `Ctrl+Shift+P` → „Wokwi: Request Free License"
3. `diagram.json` im Projektstamm öffnen — das Schema öffnet sich im Wokwi-Editor
4. ▶ drücken zum Starten der Simulation

**Wokwi CI Setup (GitHub Actions):**
1. Token unter [wokwi.com/ci](https://wokwi.com/ci) holen
2. Zu GitHub Secrets hinzufügen: `Settings` → `Secrets and variables` → `Actions` → `New repository secret` → `WOKWI_CLI_TOKEN`
3. CI führt die Simulation automatisch aus und prüft die Serial-Ausgabe

**`diagram.json` Schema:**
Schaltkreis auf [wokwi.com](https://wokwi.com) zeichnen, `diagram.json` herunterladen und die Datei im Projekt ersetzen. Wokwi CI und die VS Code Erweiterung verwenden dieselbe Datei.

### Grundlegende Befehle

```bash
pio run                        # Firmware bauen
pio run -t upload              # Bauen und auf Gerät laden
pio device monitor             # Serial Monitor öffnen
pio device monitor --baud 115200
pio test                       # Unit-Tests auf Gerät ausführen
pio run --target size          # Firmware-Größenbericht
pio check                      # Statische Analyse
```

### Framework-Auswahl

Alle Vorlagen verwenden standardmäßig `framework = arduino`. In `platformio.ini` ändern:

```ini
[env:esp32dev]
platform = espressif32
board    = esp32dev
framework = arduino      ; Standard — reiches Bibliotheks-Ökosystem

; Alternativen (bei Bedarf auskommentieren):
; framework = espidf     ; ESP-IDF — volle Kontrolle, nativer Espressif SDK
; framework = arduino    ; kann mit ESP-IDF Komponenten kombiniert werden
```

| Framework | Plattform | Wann verwenden |
| --- | --- | --- |
| `arduino` | Alle | Maximum fertige Bibliotheken, schneller Start |
| `espidf` | ESP32 | Volle Kontrolle, Bluetooth/WiFi Stack, FreeRTOS |
| `arduino` (mit ESP-IDF) | ESP32 | Arduino-Bibliotheken + ESP-IDF Komponenten |
| `pico-sdk` | Raspberry Pi Pico | Direktzugriff auf RP2040 SDK |
| `arduino` | Pico | Arduino-Ökosystem-Kompatibilität |

### Firmware hochladen

Das Upload-Protokoll wird in `platformio.ini` festgelegt:

```ini
; upload_protocol = esptool     ; ESP32/ESP8266 — USB UART (Standard)
; upload_protocol = espota      ; ESP32/ESP8266 — OTA (over the air)
; upload_protocol = esp-prog    ; ESP32 — JTAG Debugger
; upload_protocol = stlink      ; STM32 — ST-Link Programmer
; upload_protocol = picotool    ; Raspberry Pi Pico — USB (BOOTSEL halten)
; upload_protocol = arduino     ; Arduino AVR — über Bootloader
; upload_protocol = usbasp      ; Arduino AVR — USBasp Programmer
```

### CI/CD

- **Lint**: pre-commit Prüfungen (clang-format, cppcheck, commitlint)
- **Build**: `pio run` — Firmware-Kompilierung
- **Test**: `pio test` (falls test-Verzeichnis vorhanden)
- **Size**: `pio run --target size` — Firmware-Größenbericht
- **Static analysis**: `pio check --fail-on-defect high`
- **Wokwi CI**: Cloud-Firmware-Simulation (außer ESP8266) — Setup im Abschnitt [Wokwi](#wokwi-simulation-ohne-hardware) oben
- **Release**: bei `v*`-Tag — lädt `.elf`/`.hex`/`.bin` in GitHub Release hoch

Workflows laufen auf **Arch Linux Containern** für vollständige Konsistenz mit der Entwicklungsumgebung.

---

## Funktionen & Verwendung

### Tests

#### C/C++ (GoogleTest)

```bash
# Alle Tests bauen und ausführen
cmake --preset linux-debug && cmake --build --preset linux-debug
cd cmake-build-linux-debug && ctest --output-on-failure

# Einzelnen Test ausführen
ctest -R MyTest --output-on-failure

# Ausführliche Ausgabe
ctest -V
```

Tests liegen in `test/`. Jede `*_test.cpp` wird automatisch von CMake erfasst.

#### Python (pytest)

```bash
# Alle Tests ausführen
python -m pytest -v

# Bestimmte Datei oder Test
python -m pytest tests/test_module.py::test_function -v

# Kurzer Traceback bei Fehler
python -m pytest -v --tb=short
```

---

### Code Coverage

#### C++ — lcov

```bash
# Mit Coverage bauen
cmake --preset linux-coverage && cmake --build --preset linux-coverage

# Tests ausführen und Bericht generieren
cd cmake-build-linux-coverage
ctest --output-on-failure
lcov --capture --directory . --output-file coverage.info
lcov --remove coverage.info '/usr/*' '*/libraries/*' '*/test/*' --output-file coverage.info
genhtml coverage.info --output-directory coverage-html

# Bericht im Browser öffnen
xdg-open coverage-html/index.html
```

Der HTML-Bericht zeigt Coverage pro Datei, Funktion und Zeile. Grün = abgedeckt, Rot = nicht abgedeckt.

#### Python — pytest-cov

```bash
# Coverage mit Terminal-Ausgabe
python -m pytest --cov --cov-report=term

# HTML-Bericht
python -m pytest --cov --cov-report=html
xdg-open htmlcov/index.html

# Nicht abgedeckte Zeilen anzeigen
python -m pytest --cov --cov-report=term-missing
```

#### Badges und PR-Kommentare

Nach dem Push auf `main` veröffentlicht GitHub Actions automatisch ein Coverage-Badge auf GitHub Pages. Bei jedem PR erscheint ein Kommentar mit dem aktuellen Coverage-Prozentsatz.

---

### Google Benchmark

Google Benchmark misst die Performance einzelner Funktionen mit Nanosekunden-Genauigkeit.

```bash
# Im Release-Modus bauen (erforderlich — Debug verfälscht Ergebnisse)
cmake --preset linux-release && cmake --build --preset linux-release

# Alle Benchmarks ausführen
./cmake-build-linux-release/bench_example  # oder dein Binary-Name

# Nach Name filtern
./cmake-build-linux-release/bench_example --benchmark_filter=BM_MyFunction

# Als JSON ausgeben für spätere Analyse
./cmake-build-linux-release/bench_example --benchmark_out=results.json --benchmark_out_format=json

# Zwei Läufe vergleichen
benchmark_compare results_before.json results_after.json
```

Beispielausgabe:
```
Benchmark                Time        CPU      Iterations
--------------------------------------------------------
BM_VectorPushBack       45.2 ns    45.1 ns    15000000
BM_MapInsert           120.5 ns   120.3 ns     5800000
```

Benchmarks liegen in `benchmarks/`. Neue nach dem Muster `bench_example.cpp` hinzufügen.

---

### Sanitizer

Sanitizer sind compiler-basierte Tools, die Laufzeitfehler erkennen: Buffer Overflows, Data Races, Speicherlecks und undefiniertes Verhalten.

#### ASan + UBSan + LSan — Speicherfehler und UB

```bash
cmake --preset linux-asan && cmake --build --preset linux-asan
cd cmake-build-linux-asan && ctest --output-on-failure
```

Was erkannt wird:
- **ASan** (AddressSanitizer) — Out-of-bounds, use-after-free, double-free
- **UBSan** (UndefinedBehaviorSanitizer) — Integer Overflow, negativer Shift, Null-Pointer-Dereferenzierung
- **LSan** (LeakSanitizer) — Speicherlecks

#### MSan — nicht initialisierter Speicher

```bash
cmake --preset linux-msan && cmake --build --preset linux-msan
cd cmake-build-linux-msan && ctest --output-on-failure
```

Erkennt Lesezugriffe auf nicht initialisierten Speicher. **Nur Clang.**

#### TSan — Data Races

```bash
cmake --preset linux-tsan && cmake --build --preset linux-tsan
cd cmake-build-linux-tsan && ctest --output-on-failure
```

Erkennt Data Races in Multithreading-Code.

> Sanitizer können nicht miteinander kombiniert werden — jeder läuft separat. In CI laufen sie als parallele Jobs.

---

### Valgrind

Valgrind arbeitet ohne Neukompilierung — analysiert ein bereits gebautes Debug-Binary.

#### Memcheck — Speicherfehler

```bash
# Alle Tests via ctest (CI und pre-commit Modus)
tools/profiler/run-memcheck.sh

# Bestimmtes Binary
tools/profiler/run-memcheck.sh my_binary
```

Erkennt: Out-of-bounds, use-after-free, Speicherlecks, ungültige Syscalls.

#### Helgrind — Data Races

```bash
# Alle Tests
tools/profiler/run-helgrind.sh

# Bestimmtes Binary
tools/profiler/run-helgrind.sh my_binary
```

Ähnlich wie TSan, aber ohne Neukompilierung. Langsamer, funktioniert aber auf jedem Binary.

#### DRD — Data Races (Alternative)

```bash
tools/profiler/run-drd.sh          # alle Tests
tools/profiler/run-drd.sh my_binary
```

Weniger präzise als Helgrind, aber schneller.

> **Wann was verwenden:** Sanitizer — schneller, praktisch während der Entwicklung. Valgrind — für finale Prüfung oder wenn Neukompilierung nicht möglich ist.

---

### C++ Profiling

#### Callgrind — Call-Graph und CPU-Zeit

```bash
tools/profiler/run-callgrind.sh my_binary
# Ergebnis: profiles/callgrind.out
```

Visualisieren: `callgrind.out` auf [speedscope.app](https://speedscope.app) hochladen — interaktiver Flamegraph im Browser.

Zeigt: welche Funktionen am meisten CPU verbrauchen, Call-Graph, Instruction Counts.

#### Cachegrind — Cache Misses

```bash
tools/profiler/run-cachegrind.sh my_binary
# Ergebnis: profiles/cachegrind.out
```

Zeigt: L1/L2/L3 Cache Miss Counts, Branch-Fehlvorhersagen. Hilft bei der Optimierung von Speicherzugriffsmustern.

#### Massif — Heap-Nutzung

```bash
tools/profiler/run-massif.sh my_binary
# Ergebnis: profiles/massif.out (mit Textbericht in stdout)
```

Zeigt: Heap-Wachstum und -Rückgang über die Zeit, Allokations-Peaks.

#### perf — System-Profiling

```bash
tools/profiler/run-perf.sh my_binary
```

Schneller Linux Sampling Profiler. Zeigt Hot Spots mit minimalem Overhead.

---

### Python Profiling (hybrid + python/pure)

#### cProfile — Funktionsaufruf-Statistiken

```bash
tools/profiler/profile-python.sh
# Ergebnis: profiles/profile.prof — visualisieren: snakeviz profiles/profile.prof
```

Zeigt: Aufrufanzahl pro Funktion, Gesamt- und Durchschnittszeit. Interaktive Visualisierung mit snakeviz im Browser.

#### tracemalloc — Speichernutzung

```bash
tools/profiler/profile-memory.sh
# Ergebnis: profiles/memory_stats.txt
```

Zeigt: Top-10 Speicher-Allokationen nach Zeile.

#### py-spy — Sampling Profiler ohne Code-Änderungen

```bash
tools/profiler/profile-spy.sh
# Ergebnis: profiles/pyspy.svg — im Browser öffnen
```

Arbeitet ohne Code-Änderungen, minimaler Overhead. SVG-Flamegraph: im Browser öffnen, auf Blöcke klicken zum Zoomen.

---

### Dokumentation

#### C/C++ Pure — Doxygen

```bash
# Dokumentation generieren
doxygen Doxyfile

# Im Browser öffnen
xdg-open docs/html/index.html
```

Code mit Kommentaren dokumentieren:
```cpp
/// @brief Berechnet die Summe zweier Zahlen
/// @param a erster Summand
/// @param b zweiter Summand
/// @return Summe von a und b
int add(int a, int b);
```

#### Hybrid & Python Pure — Sphinx

```bash
# Dokumentation bauen
cd docs && make html

# Im Browser öffnen
xdg-open docs/_build/html/index.html
```

Das Hybrid-Template verwendet **Breathe** zum Importieren der C++ API aus Doxygen in Sphinx — C++- und Python-Dokumentation wird in einer einheitlichen Website mit dem **furo**-Theme (Dark Mode) zusammengeführt.

#### Veröffentlichung

- **GitHub Pages** — alle Templates: automatisch bei jedem Push auf `main`
- **ReadTheDocs** — nur Hybrid und Python Pure: automatisch bei jedem Push (alle Branches und Tags, mit Versionierung)

ReadTheDocs einrichten (Hybrid / Python Pure):
1. Repository auf [readthedocs.org](https://readthedocs.org) verbinden
2. ReadTheDocs erkennt `.readthedocs.yaml` automatisch und baut bei jedem Push

---

## Lizenz

**MIT License** — Copyright © 2025–2026 Vais Vaisov

Frei zu verwenden, zu ändern und zu verteilen.

---

## Mitwirken

Beiträge sind willkommen! [CONTRIBUTING.md](.github/CONTRIBUTING.md) lesen und gerne ein Issue oder einen Pull Request öffnen.

---

<div align="center">

*IT Project Templates — von null zum Code in Minuten*

</div>
