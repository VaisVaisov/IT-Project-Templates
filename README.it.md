# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**Template di progetto pronti all'uso con VS Code Dev Containers**

*Base Arch Linux · Toolchain Clang · Agenti AI preinstallati*

[Template](#template-disponibili) • [Avvio rapido](#avvio-rapido) • [Installazione](#installazione) • [Dev Containers](#funzionalità-dev-container) • [CI/CD](#qualità-del-codice--cicd)

**[🇬🇧 English](README.md) · [🇷🇺 Русский](README.ru.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## Cos'è questo?

Una raccolta di template di progetto progettati per portarti da zero al codice in pochi minuti. Ogni template include un **VS Code Dev Container** completamente configurato su Arch Linux — lo stesso ambiente su ogni macchina, indipendentemente dal sistema operativo host.

### Perché questo invece di un progetto vuoto?

- 🚀 **Nessun tempo di configurazione**: apri in VS Code, clicca "Reopen in Container" e inizia a programmare
- 🤖 **Pronto per l'IA**: Claude Code, Qwen Code e Kilo Code CLI preinstallati in ogni container
- 🔒 **Controllo qualità**: gli hook pre-commit individuano i problemi prima che raggiungano il repository
- ⚙️ **CI/CD incluso**: workflow GitHub Actions per linting, build, test, coverage, documentazione e release
- 📝 **Conventional Commits**: commitlint verifica il formato dei messaggi di commit
- 🌍 **Multipiattaforma**: lo stesso script funziona su Linux, macOS e Windows (tramite WSL2)

---

## Template disponibili

### C/C++ (`c-cpp/`)

| Template | Descrizione |
| --- | --- |
| `pure` | C/C++ con CMake, Ninja, GoogleTest, Doxygen, coverage via lcov |
| `hybrid` | C/C++ + Python/Cython — entrambi i linguaggi in un solo progetto, Sphinx + ReadTheDocs |
| `platformio/` | Sviluppo embedded: Arduino, ESP32, STM32 |

### Python (`python/`)

| Template | Descrizione |
| --- | --- |
| `pure` | Python con pytest, ruff, pylint, mypy, Sphinx + ReadTheDocs |

### Dispositivi PlatformIO (`c-cpp/platformio/`)

| Dispositivo | Scheda |
| --- | --- |
| `arduino-nano` | ATmega328P |
| `arduino-pro-micro` | ATmega32U4 |
| `esp32-devkit` | ESP32 DevKit |
| `stm32f411` | STM32F411 BlackPill |

---

## Avvio rapido

### Linux / macOS

```bash
# Clona dove vuoi
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Aggiungi al PATH (una sola volta)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # o ~/.bashrc
source ~/.zshrc

# Crea un nuovo progetto
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (WSL2)

Su Windows, l'intero ecosistema funziona attraverso WSL2. Installa WSL2 e usa lo stesso script:

```bash
# Clona nel home di WSL2
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Aggiungi al PATH (una sola volta, in WSL2)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # o ~/.bashrc
source ~/.zshrc

# Crea un nuovo progetto (da WSL2)
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Dopo aver creato il progetto

1. Aprire la cartella del progetto in VS Code
2. Cliccare su **"Reopen in Container"** (o `Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. Al primo avvio, il container viene costruito automaticamente
4. Gli hook pre-commit si installano automaticamente — si può iniziare!

---

## Riferimento comandi

### Flag Linux / macOS

```
new-project [linguaggio] [tipo] [dispositivo] <percorso>

Linguaggio:
  --c-cpp            Progetto C/C++
  --python           Progetto Python

Tipo:
  --pure             C/C++ o Python puro
  --hybrid           Ibrido C/C++ + Python/Cython  (solo --c-cpp)
  --platformio       Sviluppo embedded              (solo --c-cpp)

Dispositivi PlatformIO:
  --arduino-nano
  --arduino-pro-micro
  --esp32-devkit
  --stm32f411
```

---

## Installazione

### 1. Clonare il repository

```bash
# Linux / macOS / Windows (WSL2)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates
```

### 2. Aggiungere al PATH

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

> **Nota:** `new-project.sh` è già eseguibile dopo il clone. Se non lo è: `chmod +x new-project.sh`

### 3. Prerequisiti

| Strumento | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Obbligatorio — [docker.com](https://www.docker.com/) | Obbligatorio — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **WSL2** | — | Obbligatorio — [Guida installazione WSL2](https://learn.microsoft.com/it-it/windows/wsl/install) + estensione **WSL** in VS Code |
| **VS Code** | Obbligatorio — [code.visualstudio.com](https://code.visualstudio.com/) | Obbligatorio |
| **Estensione Dev Containers** | Obbligatorio — installare da VS Code | Obbligatorio (aprire il progetto da WSL2) |
| **GitHub CLI** | Consigliato | Consigliato (per Windows — in WSL2) |
| **uv** | Per i template hybrid/python — [astral.sh/uv](https://astral.sh/uv) | Per i template hybrid/python — installare in WSL2 |
| **Git** | Obbligatorio | Obbligatorio — installare in WSL2 |

> **Suggerimento GitHub CLI:** autenticati una volta sull'host (per Windows — in WSL2) con `gh auth login`. Il container monta `~/.config/gh` dall'host — nessuna ri-autenticazione necessaria nei Dev Containers.

---

## Struttura del repository

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # Aggiornamento automatico delle dipendenze (Actions + pre-commit)
├── c-cpp/
│   ├── pure/                   # Template C/C++ puro
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
│   ├── hybrid/                 # Template C/C++ + Python/Cython
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
│   └── platformio/             # Template embedded
│       ├── .devcontainer/      # Devcontainer condiviso (PlatformIO + Clang)
│       ├── .vscode/            # Configurazione VS Code condivisa
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       └── stm32f411/
├── python/
│   └── pure/                   # Template Python puro
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
├── meta-template/              # Base per creare nuovi template
├── new-project.sh              # Script Linux / macOS / Windows (WSL2)
├── LICENSE
└── README.md
```

---

## Funzionalità Dev Container

Ogni container è costruito su **Arch Linux (ultimo)** e include:

- **Shell**: Zsh con Oh My Zsh + Powerlevel10k
- **Editor**: Neovim
- **VCS**: Git, git-delta, GitHub CLI
- **Agenti AI**: Claude Code, Qwen Code, Kilo Code CLI (da AUR) — tutti disponibili come strumenti CLI
- **Docker**: Docker + Docker Buildx + Lazydocker (per eseguire container dentro container)
- **Auth GitHub**: `~/.config/gh` montato dall'host — nessuna ri-autenticazione necessaria

### Container C/C++

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### Container C/C++ ibridi

Tutto di C/C++, più:

- Python 3, pip, uv, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (documentazione)

### Container Python

- Python 3, pip, uv, virtualenv
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo
- pre-commit

### Container PlatformIO

- PlatformIO Core + regole udev
- Clang, cppcheck (per analisi del codice)
- Python 3, pip
- pre-commit
- Accesso dispositivi USB (il container gira con `--privileged`)

---

## Estensioni VS Code

Tutti i template installano automaticamente le estensioni all'apertura in un Dev Container e le mostrano come raccomandazioni senza Docker.

### Comuni (tutti i template)

| Categoria | Estensione | Scopo |
| --- | --- | --- |
| **AI** | Claude Code | Agente AI (CLI + VS Code) |
| | TONGYI Lingma | Assistente AI e completamento automatico del codice |
| | Kilo Code | Agente AI con supporto per 400+ modelli |
| **Git** | GitLens | Funzioni Git avanzate (blame, cronologia) |
| | Git Graph | Cronologia visuale dei commit |
| **Qualità** | Better Comments | Commenti TODO/FIXME/NOTE colorati |
| | Code Spell Checker | Controllo ortografico nel codice e nei commenti |
| **Docker** | Docker | Gestione container |
| **Markdown** | Markdown All in One | Supporto Markdown completo |
| | Markdown Converter | Esportazione in PDF/HTML/Word |
| **Formati** | YAML (Red Hat) | Supporto YAML |
| | JSON (Meezilla) | Editing JSON avanzato |

### Template C/C++

- **C/C++ Tools** — IntelliSense e debugging
- **clangd** — Analisi del codice e navigazione avanzate
- **Code Runner** — Esecuzione rapida del codice

### Template Python

- **Python** + **Pylance** — Supporto base e language server
- **debugpy** — Debugger Python
- **Python Envs** — Gestione ambienti virtuali
- **autodocstring** — Generazione automatica docstring
- **Django** + **Jinja** — Supporto framework (Python puro)

### Template ibridi

Tutte le estensioni C/C++ e Python combinate.

### Template PlatformIO

- **PlatformIO IDE** — Piattaforma di sviluppo embedded
- **Wokwi Simulator** — Simulatore interattivo Arduino/ESP32/STM32 direttamente in VS Code
- **C/C++ Tools** — Supporto codice per microcontrollori

---

## Qualità del codice & CI/CD

### Hook pre-commit

Gli hook vengono eseguiti automaticamente prima di ogni commit e vengono installati all'avvio del Dev Container (`postCreateCommand`) — sia gli hook normali che l'hook per il messaggio di commit.

#### Progetti C/C++
- **clang-format** — Formattazione automatica del codice (stile LLVM)
- **clang-tidy** — Analisi statica per bug e problemi di stile
- **cppcheck** — Perdite di memoria, controlli null pointer, comportamento indefinito
- **valgrind memcheck** — Rilevamento errori di memoria a runtime (hybrid + pure)

#### Progetti Python
- **ruff** — Linting veloce + ordinamento import (sostituisce flake8 + isort)
- **ruff-format** — Formattazione del codice (compatibile con black)
- **pylint** — Analisi semantica profonda: codice irraggiungibile, numero errato di argomenti, accesso ad attributi inesistenti
- **mypy** — Controllo statico dei tipi

#### Tutti i progetti
- **commitlint** — Verifica del formato dei messaggi di commit secondo [Conventional Commits](https://www.conventionalcommits.org/)
- **detect-secrets** — Blocca i commit contenenti segreti (chiavi API, token, password)
- Validazione YAML
- Rilevamento file grandi (> 1 MB)
- Rimozione spazi a fine riga
- Correzione fine file
- Rilevamento conflitti di merge

> Se un hook fallisce, il commit viene bloccato finché il problema non è risolto. Questo impedisce al codice difettoso di entrare nel repository.

### GitHub Actions

Ogni template include due workflow: `ci.yml` (eseguito ad ogni push/PR) e `release.yml` (eseguito sul tag `v*`).

#### C/C++ Pure & Hybrid
- **Lint**: verifiche pre-commit (clang-format, clang-tidy, cppcheck, commitlint)
- **Build**: build CMake Debug + Release con preset
- **Test**: test GoogleTest via ctest
- **Coverage**: gcov + lcov — report HTML + riepilogo in GitHub Actions UI + badge di copertura su GitHub Pages
- **Matrix**: Python 3.10–3.13 (solo hybrid)
- **Security**: Trivy — scansione CVE (HIGH/CRITICAL, blocca il merge)
- **Docs**: Doxygen (pure) o Doxygen + Sphinx/furo (hybrid) → GitHub Pages su `main`
- **Release**: su tag `v*` — git-cliff genera CHANGELOG, compila artefatti, crea GitHub Release

#### Python Pure
- **Lint**: verifiche pre-commit (ruff, pylint, mypy, commitlint)
- **Test**: pytest + riepilogo copertura in GitHub Actions UI + commento copertura nella PR
- **Badge di copertura**: pubblicato su GitHub Pages al push su `main`
- **Matrix**: Python 3.10–3.13
- **Security**: Trivy — scansione CVE (HIGH/CRITICAL, blocca il merge)
- **Docs**: Sphinx + furo → GitHub Pages (`main`) + ReadTheDocs (tutti i branch/tag)
- **Release**: su tag `v*` — git-cliff genera CHANGELOG, compila wheel + sdist, crea GitHub Release

#### PlatformIO
- **Lint**: verifiche pre-commit (clang-format, cppcheck, commitlint)
- **Build**: `pio run` — compilazione firmware
- **Test**: `pio test` (se la directory test esiste)
- **Size**: `pio run --target size` — report dimensione firmware
- **Static analysis**: `pio check --fail-on-defect high`
- **Wokwi CI**: simulazione firmware nel cloud — verifica l'output Serial senza hardware reale (richiede `WOKWI_CLI_TOKEN` nei GitHub Secrets, 50 min/mese gratuiti)
- **Release**: su tag `v*` — carica `.elf`/`.hex`/`.bin` nel GitHub Release

> **Wokwi CI e l'estensione VS Code** usano lo stesso `diagram.json` — lo schema disegnato su [wokwi.com](https://wokwi.com). Dettagli in `@PROJECT_NAME@.md` del progetto generato.
>
> **Nota per STM32F411**: Wokwi non supporta BlackPill direttamente — `diagram.json` usa `board-st-nucleo-f411re` (stesso MCU STM32F411, pinout diverso). Adattare lo schema all'hardware reale.

Tutti i workflow girano su **container Arch Linux** per coerenza con l'ambiente di sviluppo.

### Dependabot

Nella root del repository si trova `.github/dependabot.yml` — monitora automaticamente l'aggiornamento delle versioni in tutti i template e propone aggiornamenti via PR. Copre:

- **GitHub Actions** — versioni di actions/checkout, upload-artifact e altri
- **pre-commit hook** — revisioni di clang-format, ruff, mypy, pylint e altri

Gli aggiornamenti vengono controllati settimanalmente — nessun tracciamento manuale delle versioni.

### Contesto AI per gli agenti

Ogni progetto generato contiene il file `@PROJECT_NAME@.md` — fonte unica di verità con la descrizione dell'architettura, dello stack, delle istruzioni di build e delle regole per gli agenti AI. `CLAUDE.md`, `QWEN.md` e `AGENTS.md` sono symlink a questo file, quindi Claude Code, Qwen Code e Kilo Code leggono automaticamente lo stesso contesto.

---

## Documentazione

### C/C++ Pure

La documentazione viene generata tramite **Doxygen** e pubblicata automaticamente su **GitHub Pages** ad ogni push su `main`.

### C/C++ Hybrid & Python Pure

La documentazione viene costruita tramite **Sphinx** con il tema **furo** (supporto modalità scura) e pubblicata in **due posti**:
- **GitHub Pages** — automaticamente ad ogni push su `main`
- **ReadTheDocs** — automaticamente ad ogni push (tutti i branch/tag, con versioning)

Il template hybrid usa anche **Breathe** per importare l'API C++ da Doxygen in Sphinx.

Per connettere ReadTheDocs:
1. Collegare il repository su [readthedocs.org](https://readthedocs.org)
2. ReadTheDocs rileverà automaticamente `.readthedocs.yaml` e inizierà la build ad ogni push

---

## Licenza

**Licenza MIT** — Copyright © 2025–2026 Vais Vaisov

Libero di usare, modificare e distribuire.

---

## Contribuire

I contributi sono benvenuti! Leggi [CONTRIBUTING.md](.github/CONTRIBUTING.md) e sentiti libero di aprire una issue o inviare una Pull Request.

---

<div align="center">

*IT Project Templates — da zero al codice in pochi minuti*

</div>
