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
- ⚙️ **CI/CD incluso**: workflow GitHub Actions per build, test e documentazione
- 🌍 **Multipiattaforma**: lo stesso script funziona su Linux, macOS e Windows

---

## Template disponibili

### C/C++ (`c-cpp/`)

| Template | Descrizione |
| --- | --- |
| `pure` | C/C++ con CMake, Ninja, GoogleTest, Doxygen |
| `hybrid` | C/C++ + Python/Cython — entrambi i linguaggi in un solo progetto |
| `platformio/` | Sviluppo embedded per Arduino, ESP32, STM32 |

### Python (`python/`)

| Template | Descrizione |
| --- | --- |
| `pure` | Python con pytest, black, isort, pylint, mypy, flake8 |

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

### Windows (PowerShell)

```powershell
# Clona dove vuoi
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates

# Crea un nuovo progetto
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Pure C:\Projects\my_cpp_app
.\IT-Project-Templates\new-project-script.ps1 -Python -Pure C:\Projects\my_python_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Hybrid C:\Projects\my_hybrid_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -PlatformIO -Esp32Devkit C:\Projects\sensor_node
```

Oppure usa il launcher batch — doppio clic o esegui da cmd:

```cmd
new-project-shell.bat -CCpp -Pure C:\Projects\my_cpp_app
```

### Dopo aver creato il progetto

1. Aprire la cartella del progetto in VS Code
2. Cliccare su **"Reopen in Container"** (o `Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. Al primo avvio, attendere che il container venga costruito
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

### Flag Windows (PowerShell)

```
new-project-script.ps1 [linguaggio] [tipo] [dispositivo] <percorso>

Linguaggio:
  -CCpp              Progetto C/C++
  -Python            Progetto Python

Tipo:
  -Pure              C/C++ o Python puro
  -Hybrid            Ibrido C/C++ + Python/Cython  (solo -CCpp)
  -PlatformIO        Sviluppo embedded              (solo -CCpp)

Dispositivi PlatformIO:
  -ArduinoNano
  -ArduinoProMicro
  -Esp32Devkit
  -Stm32f411
```

---

## Installazione

### 1. Clonare il repository

```bash
# Linux / macOS
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Windows (PowerShell)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates
```

### 2. Aggiungere al PATH

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

**Windows — PATH di sistema (permanente):**
```powershell
[Environment]::SetEnvironmentVariable(
    "Path",
    "$env:Path;$env:USERPROFILE\IT-Project-Templates",
    "User"
)
```

> **Nota (Linux/macOS):** `new-project.sh` è già eseguibile dopo il clone. Se non lo è: `chmod +x new-project.sh`

### 3. Prerequisiti

| Strumento | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Obbligatorio — [docker.com](https://www.docker.com/) | Obbligatorio — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **VS Code** | Obbligatorio — [code.visualstudio.com](https://code.visualstudio.com/) | Obbligatorio |
| **Estensione Dev Containers** | Obbligatorio — installare da VS Code | Obbligatorio |
| **GitHub CLI** | Consigliato — `gh auth login` | Consigliato |
| **Python** | Per i template hybrid/python | Per i template hybrid/python |
| **Git** | Obbligatorio | Obbligatorio |

> **Suggerimento GitHub CLI:** autenticati una volta sull'host con `gh auth login`. Il container monta `~/.config/gh` dall'host — nessuna ri-autenticazione necessaria nei Dev Containers.

---

## Struttura del progetto

```
IT-Project-Templates/
├── .devcontainer/              # Container base (Arch + Zsh + Agenti AI)
├── c-cpp/
│   ├── pure/                   # Template C/C++ puro
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB
│   │   ├── .vscode/
│   │   ├── .github/workflows/
│   │   └── ...
│   ├── hybrid/                 # Template C/C++ + Python/Cython
│   │   ├── .devcontainer/      # Clang + Python + Cython
│   │   ├── .vscode/
│   │   ├── .github/workflows/
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
│       ├── .devcontainer/      # Python + pytest + linter
│       ├── .vscode/
│       ├── .github/workflows/
│       └── ...
├── meta-template/              # Base per creare nuovi template
├── new-project.sh              # Script Linux / macOS
├── new-project-script.ps1      # Script Windows PowerShell
├── new-project-shell.bat       # Launcher batch Windows
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
- GDB
- cppcheck (analisi statica)
- pre-commit

### Container C/C++ ibridi

Tutto di C/C++, più:

- Python 3, pip, virtualenv
- Cython, NumPy
- pytest, black, isort, pylint, mypy
- Sphinx (documentazione)

### Container Python

- Python 3, pip, virtualenv
- pytest, black, isort, pylint, mypy, flake8
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
- **Wokwi Simulator** — Simulatore Arduino/ESP32
- **C/C++ Tools** — Supporto codice per microcontrollori

---

## Qualità del codice & CI/CD

### Hook pre-commit

Gli hook vengono eseguiti automaticamente prima di ogni commit e vengono installati all'avvio del Dev Container (`postCreateCommand`).

#### Progetti C/C++
- **clang-format** — Formattazione automatica del codice (stile LLVM, limite 100 caratteri)
- **clang-tidy** — Analisi statica per bug e problemi di stile
- **cppcheck** — Perdite di memoria, controlli null pointer, comportamento indefinito

#### Progetti Python
- **black** — Formattazione del codice (conforme a PEP 8)
- **isort** — Ordinamento degli import
- **flake8** — Linting sintassi e stile
- **mypy** — Controllo statico dei tipi
- **pylint** — Analisi della qualità del codice

#### Tutti i progetti
- Validazione YAML
- Rilevamento file grandi (> 1 MB)
- Rimozione spazi a fine riga
- Correzione fine file
- Rilevamento conflitti di merge

> Se un hook fallisce, il commit viene bloccato finché il problema non è risolto. Questo impedisce al codice difettoso di entrare nel repository.

### GitHub Actions

Ogni template include un workflow CI in `.github/workflows/ci.yml`.

#### C/C++ Pure & Hybrid
- Build con CMake + Ninja
- Esecuzione suite GoogleTest
- Generazione documentazione Doxygen
- Pubblicazione automatica dei docs su GitHub Pages (solo branch main)

#### Python Pure
- Esecuzione suite pytest
- Controlli qualità del codice (black, isort, flake8, mypy)
- Report di copertura dei test

#### PlatformIO
- Compilazione firmware per il dispositivo target
- Verifica limiti dimensione firmware

Tutti i workflow girano su **container Arch Linux** per coerenza con l'ambiente di sviluppo.

---

## Licenza

**Licenza MIT** — Copyright © 2025–2026 Vais Vaisov

Libero di usare, modificare e distribuire.

---

## Contribuire

I contributi sono benvenuti! Sentiti libero di aprire una issue o inviare una Pull Request.

---

<div align="center">

*IT Project Templates — da zero al codice in pochi minuti*

</div>
