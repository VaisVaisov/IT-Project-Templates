# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**Sofort einsatzbereite Projektvorlagen mit VS Code Dev Containers**

*Arch Linux Basis · Clang Toolchain · KI-Agenten vorinstalliert*

[Vorlagen](#verfügbare-vorlagen) • [Schnellstart](#schnellstart) • [Installation](#installation) • [Dev Containers](#dev-container-funktionen) • [CI/CD](#codequalität--cicd)

**[🇬🇧 English](README.md) · [🇷🇺 Русский](README.ru.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## Was ist das?

Eine Sammlung von Projektvorlagen, die dafür ausgelegt sind, dich in wenigen Minuten vom Nichts zum Coden zu bringen. Jede Vorlage enthält einen vollständig konfigurierten **VS Code Dev Container** auf Arch Linux-Basis — gleiche Umgebung auf jeder Maschine, unabhängig vom Host-Betriebssystem.

### Warum das statt eines leeren Projekts?

- 🚀 **Keine Einrichtungszeit**: In VS Code öffnen, „Reopen in Container" klicken, loslegen
- 🤖 **KI-bereit**: Claude Code und Qwen Code in jedem Container vorinstalliert
- 🔒 **Qualitätssicherung**: pre-commit Hooks fangen Probleme ab, bevor sie ins Repo gelangen
- ⚙️ **CI/CD inklusive**: GitHub Actions Workflows für Build, Tests und Dokumentation
- 🌍 **Plattformübergreifend**: Dasselbe Skript funktioniert auf Linux, macOS und Windows

---

## Verfügbare Vorlagen

### C/C++ (`c-cpp/`)

| Vorlage | Beschreibung |
| --- | --- |
| `pure` | C/C++ mit CMake, Ninja, GoogleTest, Doxygen |
| `hybrid` | C/C++ + Python/Cython — beide Sprachen in einem Projekt |
| `platformio/` | Embedded-Entwicklung für Arduino, ESP32, STM32 |

### Python (`python/`)

| Vorlage | Beschreibung |
| --- | --- |
| `pure` | Python mit pytest, black, isort, pylint, mypy, flake8 |

### PlatformIO Geräte (`c-cpp/platformio/`)

| Gerät | Board |
| --- | --- |
| `arduino-nano` | ATmega328P |
| `arduino-pro-micro` | ATmega32U4 |
| `esp32-devkit` | ESP32 DevKit |
| `stm32f411` | STM32F411 BlackPill |

---

## Schnellstart

### Linux / macOS

```bash
# Beliebig klonen
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Zum PATH hinzufügen (einmalig)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # oder ~/.bashrc
source ~/.zshrc

# Neues Projekt erstellen
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (PowerShell)

```powershell
# Beliebig klonen
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates

# Neues Projekt erstellen
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Pure C:\Projects\my_cpp_app
.\IT-Project-Templates\new-project-script.ps1 -Python -Pure C:\Projects\my_python_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Hybrid C:\Projects\my_hybrid_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -PlatformIO -Esp32Devkit C:\Projects\sensor_node
```

Oder den Batch-Launcher verwenden — Doppelklick oder aus cmd ausführen:

```cmd
new-project-shell.bat -CCpp -Pure C:\Projects\my_cpp_app
```

### Nach der Projekterstellung

1. Projektordner in VS Code öffnen
2. **„Reopen in Container"** klicken (oder `Ctrl+Shift+P` → „Dev Containers: Reopen in Container")
3. Beim ersten Start wartet der Container auf den Build
4. Pre-commit Hooks werden automatisch installiert — sofort loslegen!

---

## Befehlsreferenz

### Linux / macOS Flags

```
new-project [sprache] [typ] [gerät] <pfad>

Sprache:
  --c-cpp            C/C++ Projekt
  --python           Python Projekt

Typ:
  --pure             Reines C/C++ oder Python
  --hybrid           Hybrid C/C++ + Python/Cython  (nur --c-cpp)
  --platformio       Embedded-Entwicklung          (nur --c-cpp)

PlatformIO Geräte:
  --arduino-nano
  --arduino-pro-micro
  --esp32-devkit
  --stm32f411
```

### Windows (PowerShell) Flags

```
new-project-script.ps1 [sprache] [typ] [gerät] <pfad>

Sprache:
  -CCpp              C/C++ Projekt
  -Python            Python Projekt

Typ:
  -Pure              Reines C/C++ oder Python
  -Hybrid            Hybrid C/C++ + Python/Cython  (nur -CCpp)
  -PlatformIO        Embedded-Entwicklung          (nur -CCpp)

PlatformIO Geräte:
  -ArduinoNano
  -ArduinoProMicro
  -Esp32Devkit
  -Stm32f411
```

---

## Installation

### 1. Repository klonen

```bash
# Linux / macOS
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Windows (PowerShell)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates
```

### 2. Zum PATH hinzufügen

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

**Windows — System PATH (dauerhaft):**
```powershell
[Environment]::SetEnvironmentVariable(
    "Path",
    "$env:Path;$env:USERPROFILE\IT-Project-Templates",
    "User"
)
```

> **Hinweis (Linux/macOS):** `new-project.sh` ist nach dem Klonen bereits ausführbar. Falls nicht: `chmod +x new-project.sh`

### 3. Voraussetzungen

| Tool | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Erforderlich — [docker.com](https://www.docker.com/) | Erforderlich — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **VS Code** | Erforderlich — [code.visualstudio.com](https://code.visualstudio.com/) | Erforderlich |
| **Dev Containers Erweiterung** | Erforderlich — aus VS Code installieren | Erforderlich |
| **GitHub CLI** | Empfohlen — `gh auth login` | Empfohlen |
| **Python** | Für hybrid/python Vorlagen | Für hybrid/python Vorlagen |
| **Git** | Erforderlich | Erforderlich |

> **GitHub CLI Tipp:** Einmal auf dem Host mit `gh auth login` authentifizieren. Der Container bindet `~/.config/gh` vom Host ein — keine erneute Anmeldung in Dev Containers erforderlich.

---

## Projektstruktur

```
IT-Project-Templates/
├── .devcontainer/              # Basiscontainer (Arch + Zsh + KI-Agenten)
├── c-cpp/
│   ├── pure/                   # Reine C/C++ Vorlage
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB
│   │   ├── .vscode/
│   │   ├── .github/workflows/
│   │   └── ...
│   ├── hybrid/                 # C/C++ + Python/Cython Vorlage
│   │   ├── .devcontainer/      # Clang + Python + Cython
│   │   ├── .vscode/
│   │   ├── .github/workflows/
│   │   └── ...
│   └── platformio/             # Embedded Vorlagen
│       ├── .devcontainer/      # Gemeinsamer devcontainer (PlatformIO + Clang)
│       ├── .vscode/            # Gemeinsame VS Code Konfiguration
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       └── stm32f411/
├── python/
│   └── pure/                   # Reine Python Vorlage
│       ├── .devcontainer/      # Python + pytest + Linter
│       ├── .vscode/
│       ├── .github/workflows/
│       └── ...
├── meta-template/              # Basis für neue Vorlagen
├── new-project.sh              # Linux / macOS Skript
├── new-project-script.ps1      # Windows PowerShell Skript
├── new-project-shell.bat       # Windows Batch-Launcher
├── LICENSE
└── README.md
```

---

## Dev Container Funktionen

Jeder Container basiert auf **Arch Linux (aktuell)** und enthält:

- **Shell**: Zsh mit Oh My Zsh + Powerlevel10k
- **Editor**: Neovim
- **VCS**: Git, git-delta, GitHub CLI
- **KI-Agenten**: Claude Code, Qwen Code (aus AUR)
- **Docker**: Docker + Docker Buildx + Lazydocker (für Container-in-Container)
- **GitHub Auth**: `~/.config/gh` wird vom Host eingebunden — keine erneute Anmeldung

### C/C++ Container

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB
- cppcheck (statische Analyse)
- pre-commit

### C/C++ Hybrid Container

Alles aus C/C++, zusätzlich:

- Python 3, pip, virtualenv
- Cython, NumPy
- pytest, black, isort, pylint, mypy
- Sphinx (Dokumentation)

### Python Container

- Python 3, pip, virtualenv
- pytest, black, isort, pylint, mypy, flake8
- pre-commit

### PlatformIO Container

- PlatformIO Core + udev Regeln
- Clang, cppcheck (für Code-Analyse)
- Python 3, pip
- pre-commit
- USB-Gerätezugriff (Container läuft mit `--privileged`)

---

## VS Code Erweiterungen

Alle Vorlagen installieren Erweiterungen automatisch beim Öffnen in einem Dev Container und zeigen sie als Empfehlungen ohne Docker an.

### Allgemein (alle Vorlagen)

| Kategorie | Erweiterung | Zweck |
| --- | --- | --- |
| **KI** | Claude Code | KI-Agent (CLI + VS Code) |
| | TONGYI Lingma | KI-Assistent und Code-Vervollständigung |
| | Kilo Code | KI-Agent mit 400+ Modellen |
| **Git** | GitLens | Erweiterte Git-Funktionen (Blame, Verlauf) |
| | Git Graph | Visueller Commit-Verlauf |
| **Code-Qualität** | Better Comments | Farbige TODO/FIXME/NOTE Kommentare |
| | Code Spell Checker | Rechtschreibprüfung in Code und Kommentaren |
| **Docker** | Docker | Container-Verwaltung |
| **Markdown** | Markdown All in One | Vollständige Markdown-Unterstützung |
| | Markdown Converter | Export nach PDF/HTML/Word |
| **Formate** | YAML (Red Hat) | YAML-Unterstützung |
| | JSON (Meezilla) | Erweitertes JSON-Editieren |

### C/C++ Vorlagen

- **C/C++ Tools** — IntelliSense und Debugging
- **clangd** — Erweiterte Code-Analyse und Navigation
- **Code Runner** — Schnelle Code-Ausführung

### Python Vorlagen

- **Python** + **Pylance** — Kernunterstützung und Sprachserver
- **debugpy** — Python Debugger
- **Python Envs** — Verwaltung virtueller Umgebungen
- **autodocstring** — Automatische Docstring-Generierung
- **Django** + **Jinja** — Framework-Unterstützung (Pure Python)

### Hybrid Vorlagen

Alle C/C++ und Python Erweiterungen kombiniert.

### PlatformIO Vorlagen

- **PlatformIO IDE** — Embedded-Entwicklungsplattform
- **Wokwi Simulator** — Arduino/ESP32 Simulator
- **C/C++ Tools** — Mikrocontroller-Code-Unterstützung

---

## Codequalität & CI/CD

### Pre-commit Hooks

Hooks laufen automatisch vor jedem Commit. Sie werden beim Start des Dev Containers installiert (`postCreateCommand`).

#### C/C++ Projekte
- **clang-format** — Automatische Code-Formatierung (LLVM Stil, 100 Zeichen Limit)
- **clang-tidy** — Statische Analyse auf Bugs und Stilprobleme
- **cppcheck** — Speicherlecks, Null-Pointer-Prüfungen, undefiniertes Verhalten

#### Python Projekte
- **black** — Code-Formatierung (PEP 8 konform)
- **isort** — Import-Sortierung
- **flake8** — Syntax- und Stil-Linting
- **mypy** — Statische Typüberprüfung
- **pylint** — Code-Qualitätsanalyse

#### Alle Projekte
- YAML-Validierung
- Erkennung großer Dateien (> 1 MB)
- Entfernung von Leerzeichen am Zeilenende
- End-of-File Korrektur
- Erkennung von Merge-Konflikten

> Wenn ein Hook fehlschlägt, wird der Commit blockiert, bis das Problem behoben ist. Damit bleibt fehlerhafter Code aus dem Repository.

### GitHub Actions

Jede Vorlage enthält einen CI-Workflow in `.github/workflows/ci.yml`.

#### C/C++ Pure & Hybrid
- Build mit CMake + Ninja
- GoogleTest Suites ausführen
- Doxygen Dokumentation generieren
- Docs automatisch auf GitHub Pages veröffentlichen (nur main Branch)

#### Python Pure
- pytest Suite ausführen
- Code-Qualitätsprüfungen (black, isort, flake8, mypy)
- Testabdeckungsberichte

#### PlatformIO
- Firmware für das Zielgerät bauen
- Firmware-Größenlimits prüfen

Alle Workflows laufen auf **Arch Linux Containern** für Konsistenz mit der Entwicklungsumgebung.

---

## Lizenz

**MIT-Lizenz** — Copyright © 2025–2026 Vais Vaisov

Kostenlos zu verwenden, zu modifizieren und zu verteilen.

---

## Beitragen

Beiträge sind willkommen! Öffne gerne ein Issue oder reiche einen Pull Request ein.

---

<div align="center">

*IT Project Templates — in Minuten vom Nichts zum Code*

</div>
