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

Eine Sammlung von Projektvorlagen, die dafür ausgelegt sind, in wenigen Minuten vom Nichts zum Coden zu bringen. Jede Vorlage enthält einen vollständig konfigurierten **VS Code Dev Container** auf Arch Linux-Basis — gleiche Umgebung auf jeder Maschine, unabhängig vom Host-Betriebssystem.

### Warum das statt eines leeren Projekts?

- 🚀 **Keine Einrichtungszeit**: In VS Code öffnen, „Reopen in Container" klicken, loslegen
- 🤖 **KI-bereit**: Claude Code, Qwen Code und Kilo Code in jedem Container vorinstalliert
- 🔒 **Qualitätssicherung**: pre-commit Hooks fangen Probleme ab, bevor sie ins Repo gelangen
- ⚙️ **CI/CD inklusive**: GitHub Actions Workflows für Linting, Build, Tests, Coverage, Dokumentation und Releases
- 📝 **Conventional Commits**: commitlint prüft das Format von Commit-Nachrichten
- 🌍 **Plattformübergreifend**: Dasselbe Skript funktioniert auf Linux, macOS und Windows

---

## Verfügbare Vorlagen

### C/C++ (`c-cpp/`)

| Vorlage | Beschreibung |
| --- | --- |
| `pure` | C/C++ mit CMake, Ninja, GoogleTest, Doxygen, Coverage via lcov |
| `hybrid` | C/C++ + Python/Cython — beide Sprachen in einem Projekt, Sphinx + ReadTheDocs |
| `platformio/` | Embedded-Entwicklung: Arduino, ESP32, STM32 |

### Python (`python/`)

| Vorlage | Beschreibung |
| --- | --- |
| `pure` | Python mit pytest, ruff, pylint, mypy, Sphinx + ReadTheDocs |

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
3. Beim ersten Start wird der Container automatisch gebaut
4. Pre-commit Hooks werden automatisch installiert — sofort loslegen!

---

## Befehlsreferenz

### Linux / macOS

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

### Windows (PowerShell)

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

## Repository-Struktur

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # Automatische Abhängigkeitsaktualisierungen (Actions + pre-commit)
├── c-cpp/
│   ├── pure/                   # Reine C/C++ Vorlage
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
│   ├── hybrid/                 # C/C++ + Python/Cython Vorlage
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
│   └── platformio/             # Embedded Vorlagen
│       ├── .devcontainer/      # Gemeinsamer devcontainer (PlatformIO + Clang)
│       ├── .vscode/            # Gemeinsame VS Code Konfiguration
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       └── stm32f411/
├── python/
│   └── pure/                   # Reine Python Vorlage
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
- **KI-Agenten**: Claude Code, Qwen Code, Kilo Code CLI (aus AUR) — alle als CLI-Tools verfügbar
- **Docker**: Docker + Docker Buildx + Lazydocker (für Container-in-Container)
- **GitHub Auth**: `~/.config/gh` wird vom Host eingebunden — keine erneute Anmeldung

### C/C++ Container

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### C/C++ Hybrid Container

Alles aus C/C++, zusätzlich:

- Python 3, pip, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (Dokumentation)

### Python Container

- Python 3, pip, virtualenv
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
- **Wokwi Simulator** — Interaktiver Arduino/ESP32/STM32-Simulator direkt in VS Code
- **C/C++ Tools** — Mikrocontroller-Code-Unterstützung

---

## Codequalität & CI/CD

### Pre-commit Hooks

Hooks laufen automatisch vor jedem Commit. Sie werden beim Start des Dev Containers installiert (`postCreateCommand`) — sowohl normale Hooks als auch der Commit-Message-Hook.

#### C/C++ Projekte
- **clang-format** — Automatische Code-Formatierung (LLVM Stil)
- **clang-tidy** — Statische Analyse auf Bugs und Stilprobleme
- **cppcheck** — Speicherlecks, Null-Pointer-Prüfungen, undefiniertes Verhalten
- **valgrind memcheck** — Laufzeit-Speicherfehlererkennung (hybrid + pure)

#### Python Projekte
- **ruff** — Schnelles Linting + Import-Sortierung (ersetzt flake8 + isort)
- **ruff-format** — Code-Formatierung (black-kompatibel)
- **pylint** — Tiefe semantische Analyse: unerreichbarer Code, falsche Argumentanzahl, fehlende Attribute
- **mypy** — Statische Typüberprüfung

#### Alle Projekte
- **commitlint** — Überprüfung des Commit-Nachrichtenformats nach [Conventional Commits](https://www.conventionalcommits.org/)
- YAML-Validierung
- Erkennung großer Dateien (> 1 MB)
- Entfernung von Leerzeichen am Zeilenende
- End-of-File Korrektur
- Erkennung von Merge-Konflikten

> Wenn ein Hook fehlschlägt, wird der Commit blockiert, bis das Problem behoben ist. Damit bleibt fehlerhafter Code aus dem Repository.

### GitHub Actions

Jede Vorlage enthält zwei Workflows: `ci.yml` (läuft bei jedem Push/PR) und `release.yml` (läuft beim Tag `v*`).

#### C/C++ Pure & Hybrid
- **Lint**: pre-commit Prüfungen (clang-format, clang-tidy, cppcheck, commitlint)
- **Build**: CMake Debug + Release Builds mit Presets
- **Test**: GoogleTest Tests via ctest
- **Coverage**: gcov + lcov — HTML-Bericht als Artefakt hochgeladen
- **Docs**: Doxygen (pure) oder Doxygen + Sphinx/furo (hybrid)
- **Pages**: Automatische Dokumentationsveröffentlichung auf GitHub Pages (nur `main` Branch)
- **Release**: Bei Tag `v*` — baut Binaries + Python Wheel, erstellt GitHub Release

#### Python Pure
- **Lint**: pre-commit Prüfungen (ruff, pylint, mypy, commitlint)
- **Test**: pytest
- **Coverage**: pytest-cov — XML-Bericht + Artefakt
- **Docs**: Sphinx + furo, Veröffentlichung via ReadTheDocs
- **Release**: Bei Tag `v*` — baut Wheel + sdist, erstellt GitHub Release

#### PlatformIO
- **Lint**: pre-commit Prüfungen (clang-format, cppcheck, commitlint)
- **Build**: `pio run` — Firmware kompilieren
- **Test**: `pio test` (falls Verzeichnis test vorhanden)
- **Size**: `pio run --target size` — Firmware-Größenbericht
- **Static analysis**: `pio check --fail-on-defect high`
- **Wokwi CI**: Firmware-Simulation in der Cloud — prüft Serial-Ausgabe ohne echte Hardware (erfordert `WOKWI_CLI_TOKEN` in GitHub Secrets, 50 Min/Monat kostenlos)
- **Release**: Bei Tag `v*` — lädt `.elf`/`.hex`/`.bin` in GitHub Release hoch

> **Wokwi CI und VS Code Erweiterung** verwenden dieselbe `diagram.json` — das Schema, das auf [wokwi.com](https://wokwi.com) gezeichnet wird. Details in `@PROJECT_NAME@.md` des generierten Projekts.

Alle Workflows laufen auf **Arch Linux Containern** für vollständige Konsistenz mit der Entwicklungsumgebung.

### Dependabot

Im Stammverzeichnis befindet sich `.github/dependabot.yml` — es überwacht automatisch die Aktualität der Versionen in allen Vorlagen und schlägt Aktualisierungen via PR vor. Abgedeckt:

- **GitHub Actions** — Versionen von actions/checkout, upload-artifact und anderen
- **pre-commit Hooks** — Revisionen von clang-format, ruff, mypy, pylint und anderen

Aktualisierungen werden wöchentlich geprüft — kein manuelles Versions-Tracking.

### KI-Kontext für Agenten

Jedes generierte Projekt enthält eine `@PROJECT_NAME@.md`-Datei — eine einzige Quelle der Wahrheit mit Architektur-, Stack-, Build- und KI-Agenten-Anweisungen. `CLAUDE.md`, `QWEN.md` und `AGENTS.md` sind Symlinks auf diese Datei, sodass Claude Code, Qwen Code und Kilo Code automatisch denselben Kontext lesen.

---

## Dokumentation

### C/C++ Pure

Dokumentation wird via **Doxygen** generiert und automatisch auf **GitHub Pages** bei jedem Push auf `main` veröffentlicht.

### C/C++ Hybrid & Python Pure

Dokumentation wird via **Sphinx** mit dem **furo**-Theme (Dark Mode Unterstützung) gebaut und via **ReadTheDocs** veröffentlicht. Die Hybrid-Vorlage verwendet zusätzlich **Breathe**, um C++ API aus Doxygen in Sphinx zu importieren.

So wird ReadTheDocs verbunden:
1. Repository auf [readthedocs.org](https://readthedocs.org) verbinden
2. ReadTheDocs erkennt `.readthedocs.yaml` automatisch und beginnt bei jedem Push zu bauen

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
