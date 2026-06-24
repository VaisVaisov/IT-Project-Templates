# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**Templates de projets prêts à l'emploi avec VS Code Dev Containers**

*Arch Linux · Chaîne d'outils Clang · Agents IA de coding préinstallés*

[Templates](#templates-disponibles) • [Démarrage rapide](#démarrage-rapide) • [Installation](#installation) • [Dev Containers](#fonctionnalités-dev-container) • [CI/CD](#qualité-du-code--cicd) • [PlatformIO](#templates-platformio) • [Fonctionnalités](#fonctionnalités--utilisation)

**[🇷🇺 Русский](README.ru.md) · [🇬🇧 English](README.md) · [🇩🇪 Deutsch](README.de.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## Qu'est-ce que c'est ?

Une collection de templates de projets qui vous permettent de commencer à développer en quelques minutes. Chaque template est livré avec un **VS Code Dev Container** entièrement configuré basé sur Arch Linux — le même environnement sur n'importe quelle machine, quel que soit l'OS hôte.

### Pourquoi l'utiliser ?

- 🚀 **Zéro configuration** : ouvrir dans VS Code, cliquer sur « Reopen in Container » — coder immédiatement
- 🤖 **Prêt pour l'IA** : Claude Code, Qwen Code et Kilo Code préinstallés dans chaque container
- 🔒 **Portes de qualité** : les hooks pre-commit détectent les problèmes avant qu'ils n'atteignent le dépôt
- ⚙️ **CI/CD inclus** : GitHub Actions pour le linting, les builds, les tests, la couverture, la doc et les releases
- 📝 **Conventional Commits** : commitlint impose le format des messages de commit
- 🌍 **Multi-plateforme** : un seul script fonctionne sur Linux, macOS et Windows (via WSL2)

---

## Templates disponibles

### C/C++ (`c-cpp/`)

| Template | Description |
| --- | --- |
| `pure` | C/C++ avec CMake, Ninja, GoogleTest, Google Benchmark, Doxygen, couverture lcov |
| `hybrid` | C/C++ + Python/Cython — les deux langages dans un projet, Sphinx + ReadTheDocs |
| `platformio/` | Développement embarqué (Arduino, ESP32, ESP8266, Pico, STM32) |

### Python (`python/`)

| Template | Description |
| --- | --- |
| `pure` | Python avec pytest, ruff, pylint, mypy, Sphinx + ReadTheDocs |

### Appareils PlatformIO (`c-cpp/platformio/`)

| Répertoire | Carte | Architecture | Wokwi CI |
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

> \* STM32F411 : Wokwi utilise `board-st-nucleo-f411re` (même MCU, pinout différent) — voir la section [PlatformIO](#templates-platformio). ESP8266 : Wokwi non supporté — build uniquement.

---

## Démarrage rapide

### Linux / macOS

```bash
# Cloner où vous voulez
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Ajouter au PATH (une seule fois)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # ou ~/.bashrc
source ~/.zshrc

# Créer un nouveau projet
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (WSL2)

Sur Windows, tout l'écosystème fonctionne via WSL2. Installer WSL2 et utiliser le même script :

```bash
# Cloner dans le home WSL2
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Ajouter au PATH (une fois, dans WSL2)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # ou ~/.bashrc
source ~/.zshrc

# Créer un nouveau projet (depuis WSL2)
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Après la création du projet

1. Ouvrir le dossier du projet dans VS Code
2. Cliquer sur **« Reopen in Container »** (ou `Ctrl+Shift+P` → « Dev Containers: Reopen in Container »)
3. Le container se construit automatiquement au premier lancement
4. Les hooks pre-commit s'installent d'eux-mêmes — prêt à coder !

---

## Référence d'utilisation

```
new-project [--help] <langage> <type> [appareil] <chemin>

Langage :
  --c-cpp            Projet C/C++
  --python           Projet Python

Type :
  --pure             C/C++ ou Python pur
  --hybrid           Hybride C/C++ + Python/Cython  (--c-cpp uniquement)
  --platformio       Développement embarqué           (--c-cpp uniquement)

Appareils PlatformIO (Arduino) :
  --arduino-nano          Arduino Nano (ATmega328P)
  --arduino-pro-micro     Arduino Pro Micro (ATmega32U4, USB HID)

Appareils PlatformIO (ESP32) :
  --esp32-devkit          ESP32 DevKit V1 (Xtensa LX6, WiFi + BT)
  --esp32-s2-saola        ESP32-S2 Saola (Xtensa LX7, USB OTG)
  --esp32-s3-devkitc      ESP32-S3 DevKitC (Xtensa LX7, AI+IoT)
  --esp32-c3-devkitm      ESP32-C3 DevKitM (RISC-V, WiFi + BT)
  --esp32-c6-devkitc      ESP32-C6 DevKitC (RISC-V, WiFi 6 + Zigbee)
  --esp32-h2-devkitm      ESP32-H2 DevKitM (RISC-V, Zigbee + Thread)

Appareils PlatformIO (autres) :
  --esp8266-wemos-d1-mini Wemos D1 Mini (ESP8266, WiFi) — build uniquement, sans Wokwi
  --rpi-pico              Raspberry Pi Pico (RP2040, dual-core ARM Cortex-M0+)
  --stm32f411-blackpill   STM32F411 Black Pill (Cortex-M4, 100 MHz)
  --stm32f103-bluepill    STM32F103 Blue Pill (Cortex-M3, 72 MHz)

Options :
  --help, -h         Afficher cette aide et quitter
```

---

## Installation

### 1. Cloner le dépôt

```bash
# Linux / macOS / Windows (WSL2)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates
```

### 2. Ajouter au PATH

**Bash :**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**Zsh :**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

> **Note :** `new-project.sh` est déjà exécutable après le clonage. Sinon : `chmod +x new-project.sh`

### 3. Prérequis

| Outil | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Requis — [docker.com](https://www.docker.com/) | Requis — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **WSL2** | — | Requis — [Guide d'installation WSL2](https://learn.microsoft.com/fr-fr/windows/wsl/install) + extension **WSL** dans VS Code |
| **VS Code** | Requis — [code.visualstudio.com](https://code.visualstudio.com/) | Requis |
| **Extension Dev Containers** | Requis — installer depuis VS Code | Requis (ouvrir le projet depuis WSL2) |
| **GitHub CLI** | Recommandé | Recommandé (pour Windows — dans WSL2) |
| **uv** | Pour templates hybrid/python — [astral.sh/uv](https://astral.sh/uv) | Pour templates hybrid/python — installer dans WSL2 |
| **Git** | Requis | Requis — installer dans WSL2 |

> **Astuce GitHub CLI :** s'authentifier une fois sur l'hôte (pour Windows — dans WSL2) avec `gh auth login`. Le container monte `~/.config/gh` depuis l'hôte — pas besoin de se ré-authentifier dans le Dev Container.

---

## Structure du projet

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # Mises à jour automatiques des dépendances (Actions + pre-commit)
├── c-cpp/
│   ├── pure/                   # Template C/C++ pur
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB + lcov + valgrind
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Exemples Google Benchmark
│   │   ├── tools/profiler/     # Scripts Valgrind + perf
│   │   └── ...
│   ├── hybrid/                 # Template C/C++ + Python/Cython
│   │   ├── .devcontainer/      # Clang + Python + Cython + ruff + pylint
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Exemples Google Benchmark
│   │   ├── tools/profiler/     # Valgrind + perf + profileurs Python
│   │   └── ...
│   └── platformio/             # Templates embarqués
│       ├── devcontainers/      # Dev-containers par famille de carte
│       │   ├── base/           # Arduino + ESP (PlatformIO + Clang)
│       │   ├── stm32/          # STM32 (+ outils ST-Link + GDB)
│       │   └── pico/           # Raspberry Pi Pico (+ picotool)
│       ├── .vscode/            # Config VS Code partagée
│       ├── arduino/            # Template famille Arduino
│       ├── esp32/              # Template famille ESP32
│       ├── esp8266/            # Template famille ESP8266
│       ├── stm32/              # Template famille STM32
│       └── pico/               # Template Raspberry Pi Pico
├── python/
│   └── pure/                   # Template Python pur
│       ├── .devcontainer/      # Python + ruff + pylint + mypy
│       ├── .github/
│       │   ├── workflows/      # ci.yml + release.yml
│       │   └── ISSUE_TEMPLATE/
│       ├── .vscode/
│       ├── tools/profiler/     # Profileurs Python
│       └── ...
├── meta-template/              # Base pour créer de nouveaux templates
├── new-project.sh              # Script pour Linux / macOS / Windows (WSL2)
├── LICENSE
└── README.md
```

---

## Fonctionnalités Dev Container

Chaque container est construit sur **Arch Linux (latest)** et inclut :

- **Shell** : Zsh avec Oh My Zsh + Powerlevel10k
- **Éditeur** : Neovim
- **VCS** : Git, git-delta, GitHub CLI
- **Agents IA** : Claude Code, Qwen Code, Kilo Code CLI (depuis AUR) — tous disponibles comme outils CLI
- **Docker** : Docker + Docker Buildx + Lazydocker (pour exécuter des containers dans des containers)
- **Auth GitHub** : `~/.config/gh` monté depuis l'hôte — pas de ré-authentification nécessaire

### Containers C/C++

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### Containers Hybrid (C/C++ + Python)

Tout ce qui est dans C/C++, plus :

- Python 3, pip, uv, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (documentation)
- py-spy, memory-profiler (profiling Python)

### Containers Python

- Python 3, pip, uv, virtualenv
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo
- pre-commit

### Containers PlatformIO

- PlatformIO Core + règles udev
- Clang, cppcheck (analyse statique)
- Python 3, pip
- pre-commit
- Accès aux appareils USB (container lancé avec `--privileged`)

---

## Extensions VS Code

Tous les templates installent automatiquement les extensions lors de l'ouverture dans un Dev Container et les affichent comme recommandations sans Docker.

### Commun (tous les templates)

| Catégorie | Extension | Rôle |
| --- | --- | --- |
| **IA** | Claude Code | Agent IA (CLI + VS Code) |
| | TONGYI Lingma | Assistant IA et complétion de code |
| | Kilo Code | Agent IA supportant 400+ modèles |
| **Git** | GitLens | Fonctionnalités Git avancées (blame, historique) |
| | Git Graph | Graphe de commits visuel |
| **Qualité** | Better Comments | Commentaires TODO/FIXME/NOTE colorés |
| | Code Spell Checker | Vérification orthographique dans le code |
| **Docker** | Docker | Gestion des containers |
| **Markdown** | Markdown All in One | Support Markdown complet |
| | Markdown Converter | Export en PDF/HTML/Word |
| **Formats** | YAML (Red Hat) | Support YAML |
| | JSON (Meezilla) | Édition JSON avancée |

### Templates C/C++

- **C/C++ Tools** — IntelliSense et débogage
- **clangd** — Analyse de code avancée et navigation
- **Code Runner** — Exécution rapide du code

### Templates Python

- **Python** + **Pylance** — Support de base et serveur de langage
- **debugpy** — Débogueur Python
- **Python Envs** — Gestion des environnements virtuels
- **autodocstring** — Auto-génération de docstrings
- **Django** + **Jinja** — Support des frameworks (Python pur)

### Templates Hybrid

Toutes les extensions C/C++ et Python combinées.

### Templates PlatformIO

- **PlatformIO IDE** — Plateforme de développement embarqué
- **Wokwi Simulator** — Simulateur Arduino/ESP32/STM32 interactif directement dans VS Code
- **C/C++ Tools** — Support du code microcontrôleur

---

## Qualité du code & CI/CD

### Hooks pre-commit

Les hooks s'exécutent automatiquement avant chaque commit. Ils sont installés au démarrage du Dev Container (`postCreateCommand`).

#### Projets C/C++
- **clang-format** — Formatage automatique du code (style LLVM)
- **clang-tidy** — Analyse statique pour les bugs et problèmes de style
- **cppcheck** — Fuites mémoire, null pointer, comportement indéfini
- **valgrind memcheck** — Détection d'erreurs mémoire à l'exécution (hybrid + pure)

#### Projets Python
- **ruff** — Linting rapide + tri des imports (remplace flake8 + isort)
- **ruff-format** — Formatage du code (compatible black)
- **pylint** — Analyse sémantique profonde : code inaccessible, mauvais nombre d'arguments, attributs manquants
- **mypy** — Vérification statique des types

#### Tous les projets
- **commitlint** — Impose le format [Conventional Commits](https://www.conventionalcommits.org/)
- **detect-secrets** — Bloque les commits contenant des secrets (clés API, tokens, mots de passe)
- Validation YAML
- Détection des grands fichiers (> 1 Mo)
- Suppression des espaces en fin de ligne
- Correcteur de fin de fichier
- Détection des conflits de fusion

> Si un hook échoue, le commit est bloqué jusqu'à la résolution du problème. Cela empêche le code cassé d'entrer dans le dépôt.

### GitHub Actions

Chaque template inclut deux workflows : `ci.yml` (à chaque push/PR) et `release.yml` (aux tags `v*`).

#### C/C++ Pure & Hybrid
- **Lint** : vérifications pre-commit (clang-format, clang-tidy, cppcheck, commitlint)
- **Build** : presets CMake Debug + Release
- **Test** : suites GoogleTest via ctest
- **Benchmark** : exécution des binaires Google Benchmark (si présents dans `benchmarks/`)
- **Coverage** : gcov + lcov — rapport HTML + résumé dans GitHub Actions UI + badge sur GitHub Pages
- **Sanitize ASan** : AddressSanitizer + UBSan + LeakSanitizer — erreurs mémoire et UB
- **Sanitize MSan** : MemorySanitizer (Clang) — lectures de mémoire non initialisée
- **Sanitize TSan** : ThreadSanitizer — data races dans le code multi-threadé
- **Valgrind** : `ctest -T memcheck` — analyse mémoire détaillée sur toute la suite de tests
- **Matrix** : Python 3.10–3.13 (hybrid uniquement)
- **Security** : Trivy — scan CVE (HIGH/CRITICAL, bloque le merge)
- **Docs** : Doxygen (pure) ou Doxygen + Sphinx/furo (hybrid) → GitHub Pages sur `main`
- **Release** : au tag `v*` — git-cliff génère le CHANGELOG, construit les artefacts, crée la GitHub Release

#### Python Pure
- **Lint** : vérifications pre-commit (ruff, pylint, mypy, commitlint)
- **Test** : pytest + résumé de couverture dans GitHub Actions UI + commentaire PR
- **Badge de couverture** : publié sur GitHub Pages sur `main`
- **Matrix** : Python 3.10–3.13
- **Security** : Trivy — scan CVE (HIGH/CRITICAL, bloque le merge)
- **Docs** : Sphinx + furo → GitHub Pages (`main`) + ReadTheDocs (toutes branches/tags)
- **Release** : au tag `v*` — git-cliff génère le CHANGELOG, construit wheel + sdist, crée la GitHub Release

Tous les workflows tournent sur des **containers Arch Linux** pour une cohérence totale avec l'environnement de développement.

### Dependabot

Un `.github/dependabot.yml` à la racine de ce dépôt maintient automatiquement tous les templates à jour. Couvre :

- Versions des **GitHub Actions** (actions/checkout, upload-artifact, etc.)
- Révisions des **hooks pre-commit** (clang-format, ruff, mypy, pylint, etc.)

Les mises à jour sont vérifiées hebdomadairement — pas de suivi manuel des versions.

### Contexte pour les agents IA

Chaque projet généré contient un fichier `@PROJECT_NAME@.md` — source unique de vérité décrivant l'architecture, la stack technique, les instructions de build et les règles pour les agents IA. `CLAUDE.md`, `QWEN.md` et `AGENTS.md` sont des liens symboliques vers ce fichier, donc Claude Code, Qwen Code et Kilo Code lisent tous le même contexte automatiquement.

---

## Templates PlatformIO

### Cartes supportées

| Répertoire | Carte | Architecture | Wokwi CI |
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

> \* STM32F411 : Wokwi ne supporte pas BlackPill directement — `diagram.json` utilise `board-st-nucleo-f411re` (même MCU STM32F411, pinout différent). ESP8266 : Wokwi non supporté — build uniquement.

### Wokwi : Simulation sans matériel

Wokwi permet d'exécuter le firmware dans le navigateur ou VS Code sans matériel physique.

**Configuration VS Code :**
1. Installer l'extension **Wokwi Simulator**
2. Activer la licence (gratuite pour les projets personnels) via `Ctrl+Shift+P` → « Wokwi: Request Free License »
3. Ouvrir `diagram.json` à la racine du projet — le schéma s'ouvre dans l'éditeur Wokwi
4. Appuyer sur ▶ pour démarrer la simulation

**Configuration Wokwi CI (GitHub Actions) :**
1. Obtenir un token sur [wokwi.com/ci](https://wokwi.com/ci)
2. Ajouter aux GitHub Secrets : `Settings` → `Secrets and variables` → `Actions` → `New repository secret` → `WOKWI_CLI_TOKEN`
3. La CI exécutera automatiquement la simulation et vérifiera la sortie Serial

**Schéma `diagram.json` :**
Dessiner le circuit sur [wokwi.com](https://wokwi.com), télécharger `diagram.json` et remplacer le fichier dans le projet. Wokwi CI et l'extension VS Code partagent le même fichier.

### Commandes de base

```bash
pio run                        # Compiler le firmware
pio run -t upload              # Compiler et flasher sur l'appareil
pio device monitor             # Ouvrir le Serial Monitor
pio device monitor --baud 115200
pio test                       # Exécuter les tests unitaires sur l'appareil
pio run --target size          # Rapport de taille du firmware
pio check                      # Analyse statique
```

### Sélection du framework

Tous les templates utilisent `framework = arduino` par défaut. Modifier dans `platformio.ini` :

```ini
[env:esp32dev]
platform = espressif32
board    = esp32dev
framework = arduino      ; défaut — riche écosystème de bibliothèques

; Alternatives (décommenter selon besoin) :
; framework = espidf     ; ESP-IDF — contrôle total, SDK natif Espressif
; framework = arduino    ; peut être combiné avec des composants ESP-IDF
```

| Framework | Plateforme | Quand l'utiliser |
| --- | --- | --- |
| `arduino` | Tous | Maximum de bibliothèques prêtes, démarrage rapide |
| `espidf` | ESP32 | Contrôle total, stack Bluetooth/WiFi, FreeRTOS |
| `arduino` (avec ESP-IDF) | ESP32 | Bibliothèques Arduino + composants ESP-IDF |
| `pico-sdk` | Raspberry Pi Pico | Accès direct au SDK RP2040 |
| `arduino` | Pico | Compatibilité avec l'écosystème Arduino |

### Flashage du firmware

Le protocole de flashage est défini dans `platformio.ini` :

```ini
; upload_protocol = esptool     ; ESP32/ESP8266 — USB UART (défaut)
; upload_protocol = espota      ; ESP32/ESP8266 — OTA (over the air)
; upload_protocol = esp-prog    ; ESP32 — débogueur JTAG
; upload_protocol = stlink      ; STM32 — programmateur ST-Link
; upload_protocol = picotool    ; Raspberry Pi Pico — USB (maintenir BOOTSEL)
; upload_protocol = arduino     ; Arduino AVR — via bootloader
; upload_protocol = usbasp      ; Arduino AVR — programmateur USBasp
```

### CI/CD

- **Lint** : vérifications pre-commit (clang-format, cppcheck, commitlint)
- **Build** : `pio run` — compilation du firmware
- **Test** : `pio test` (si le répertoire test existe)
- **Size** : `pio run --target size` — rapport de taille du firmware
- **Static analysis** : `pio check --fail-on-defect high`
- **Wokwi CI** : simulation du firmware dans le cloud (sauf ESP8266) — configuration dans la section [Wokwi](#wokwi--simulation-sans-matériel) ci-dessus
- **Release** : au tag `v*` — upload de `.elf`/`.hex`/`.bin` dans la GitHub Release

Les workflows tournent sur des **containers Arch Linux** pour une cohérence totale avec l'environnement de développement.

---

## Fonctionnalités & Utilisation

### Tests

#### C/C++ (GoogleTest)

```bash
# Compiler et exécuter tous les tests
cmake --preset linux-debug && cmake --build --preset linux-debug
cd cmake-build-linux-debug && ctest --output-on-failure

# Exécuter un test spécifique
ctest -R MyTest --output-on-failure

# Sortie détaillée
ctest -V
```

Les tests se trouvent dans `test/`. Chaque `*_test.cpp` est automatiquement pris en charge par CMake.

#### Python (pytest)

```bash
# Exécuter tous les tests
python -m pytest -v

# Fichier ou test spécifique
python -m pytest tests/test_module.py::test_function -v

# Traceback court en cas d'échec
python -m pytest -v --tb=short
```

---

### Couverture de code

#### C++ — lcov

```bash
# Compiler avec couverture
cmake --preset linux-coverage && cmake --build --preset linux-coverage

# Exécuter les tests et générer le rapport
cd cmake-build-linux-coverage
ctest --output-on-failure
lcov --capture --directory . --output-file coverage.info
lcov --remove coverage.info '/usr/*' '*/libraries/*' '*/test/*' --output-file coverage.info
genhtml coverage.info --output-directory coverage-html

# Ouvrir le rapport dans le navigateur
xdg-open coverage-html/index.html
```

Le rapport HTML affiche la couverture par fichier, fonction et ligne. Vert = couvert, rouge = non couvert.

#### Python — pytest-cov

```bash
# Couverture avec sortie terminal
python -m pytest --cov --cov-report=term

# Rapport HTML
python -m pytest --cov --cov-report=html
xdg-open htmlcov/index.html

# Afficher les lignes non couvertes
python -m pytest --cov --cov-report=term-missing
```

#### Badges et commentaires PR

Après un push sur `main`, GitHub Actions publie automatiquement un badge de couverture sur GitHub Pages. À chaque PR, un commentaire affiche le pourcentage de couverture actuel.

---

### Google Benchmark

Google Benchmark mesure la performance de fonctions individuelles avec une précision en nanosecondes.

```bash
# Compiler en Release (obligatoire — Debug fausse les résultats)
cmake --preset linux-release && cmake --build --preset linux-release

# Exécuter tous les benchmarks
./cmake-build-linux-release/bench_example  # ou le nom de votre binaire

# Filtrer par nom
./cmake-build-linux-release/bench_example --benchmark_filter=BM_MyFunction

# Sortie JSON pour analyse ultérieure
./cmake-build-linux-release/bench_example --benchmark_out=results.json --benchmark_out_format=json

# Comparer deux exécutions
benchmark_compare results_before.json results_after.json
```

Exemple de sortie :
```
Benchmark                Time        CPU      Iterations
--------------------------------------------------------
BM_VectorPushBack       45.2 ns    45.1 ns    15000000
BM_MapInsert           120.5 ns   120.3 ns     5800000
```

Les benchmarks se trouvent dans `benchmarks/`. Ajouter de nouveaux fichiers en suivant le modèle `bench_example.cpp`.

---

### Sanitizers

Les sanitizers sont des outils basés sur le compilateur qui détectent les erreurs à l'exécution : débordements de tampon, data races, fuites mémoire et comportement indéfini.

#### ASan + UBSan + LSan — erreurs mémoire et UB

```bash
cmake --preset linux-asan && cmake --build --preset linux-asan
cd cmake-build-linux-asan && ctest --output-on-failure
```

Ce qu'il détecte :
- **ASan** (AddressSanitizer) — accès hors limites, use-after-free, double-free
- **UBSan** (UndefinedBehaviorSanitizer) — débordement entier, décalage négatif, déréférencement de pointeur null
- **LSan** (LeakSanitizer) — fuites mémoire

#### MSan — mémoire non initialisée

```bash
cmake --preset linux-msan && cmake --build --preset linux-msan
cd cmake-build-linux-msan && ctest --output-on-failure
```

Détecte les lectures de mémoire non initialisée. **Clang uniquement.**

#### TSan — data races

```bash
cmake --preset linux-tsan && cmake --build --preset linux-tsan
cd cmake-build-linux-tsan && ctest --output-on-failure
```

Détecte les data races dans le code multi-threadé.

> Les sanitizers ne peuvent pas être combinés entre eux — chacun s'exécute séparément. En CI, ils tournent en jobs parallèles.

---

### Valgrind

Valgrind fonctionne sans recompilation — il analyse un binaire Debug déjà compilé.

#### Memcheck — erreurs mémoire

```bash
# Tous les tests via ctest (mode CI et pre-commit)
tools/profiler/run-memcheck.sh

# Binaire spécifique
tools/profiler/run-memcheck.sh my_binary
```

Détecte : accès hors limites, use-after-free, fuites mémoire, appels système invalides.

#### Helgrind — data races

```bash
# Tous les tests
tools/profiler/run-helgrind.sh

# Binaire spécifique
tools/profiler/run-helgrind.sh my_binary
```

Similaire à TSan, mais sans recompilation. Plus lent, mais fonctionne sur n'importe quel binaire.

#### DRD — data races (alternative)

```bash
tools/profiler/run-drd.sh          # tous les tests
tools/profiler/run-drd.sh my_binary
```

Moins précis que Helgrind, mais plus rapide.

> **Quand utiliser quoi :** Sanitizers — plus rapides, pratiques pendant le développement. Valgrind — pour la vérification finale ou quand la recompilation n'est pas possible.

---

### Profiling C++

#### Callgrind — graphe d'appels et temps CPU

```bash
tools/profiler/run-callgrind.sh my_binary
# Résultat : profiles/callgrind.out
```

Visualiser : uploader `callgrind.out` sur [speedscope.app](https://speedscope.app) — flamegraph interactif dans le navigateur.

Affiche : quelles fonctions consomment le plus de CPU, graphe d'appels, comptages d'instructions.

#### Cachegrind — cache misses

```bash
tools/profiler/run-cachegrind.sh my_binary
# Résultat : profiles/cachegrind.out
```

Affiche : comptages de cache misses L1/L2/L3, erreurs de prédiction de branchement. Aide à optimiser les patterns d'accès mémoire.

#### Massif — utilisation du tas

```bash
tools/profiler/run-massif.sh my_binary
# Résultat : profiles/massif.out (avec rapport texte dans stdout)
```

Affiche : croissance et décroissance du tas dans le temps, pics d'allocations.

#### perf — profiling système

```bash
tools/profiler/run-perf.sh my_binary
```

Sampling profiler Linux rapide. Affiche les points chauds avec un overhead minimal.

---

### Profiling Python (hybrid + python/pure)

#### cProfile — statistiques d'appels de fonctions

```bash
tools/profiler/profile-python.sh
# Résultat : profiles/profile.prof — visualiser : snakeviz profiles/profile.prof
```

Affiche : nombre d'appels par fonction, temps total et moyen. Visualisation interactive avec snakeviz dans le navigateur.

#### tracemalloc — utilisation mémoire

```bash
tools/profiler/profile-memory.sh
# Résultat : profiles/memory_stats.txt
```

Affiche : top-10 des allocations mémoire par ligne.

#### py-spy — sampling profiler sans modification du code

```bash
tools/profiler/profile-spy.sh
# Résultat : profiles/pyspy.svg — ouvrir dans le navigateur
```

Fonctionne sans modification du code, overhead minimal. Flamegraph SVG : ouvrir dans le navigateur, cliquer sur les blocs pour zoomer.

---

### Documentation

#### C/C++ Pure — Doxygen

```bash
# Générer la documentation
doxygen Doxyfile

# Ouvrir dans le navigateur
xdg-open docs/html/index.html
```

Documenter le code avec des commentaires :
```cpp
/// @brief Calcule la somme de deux nombres
/// @param a premier opérande
/// @param b deuxième opérande
/// @return somme de a et b
int add(int a, int b);
```

#### Hybrid & Python Pure — Sphinx

```bash
# Construire la documentation
cd docs && make html

# Ouvrir dans le navigateur
xdg-open docs/_build/html/index.html
```

Le template hybrid utilise **Breathe** pour importer l'API C++ depuis Doxygen dans Sphinx — la documentation C++ et Python est construite en un site unifié avec le thème **furo** (support du mode sombre).

#### Publication

- **GitHub Pages** — tous les templates : automatiquement à chaque push sur `main`
- **ReadTheDocs** — Hybrid et Python Pure uniquement : automatiquement à chaque push (toutes branches et tags, avec versioning)

Pour configurer ReadTheDocs (Hybrid / Python Pure) :
1. Connecter le dépôt sur [readthedocs.org](https://readthedocs.org)
2. ReadTheDocs détectera `.readthedocs.yaml` automatiquement et construira à chaque push

---

## Licence

**MIT License** — Copyright © 2025–2026 Vais Vaisov

Libre d'utiliser, modifier et distribuer.

---

## Contribution

Les contributions sont les bienvenues ! Lire [CONTRIBUTING.md](.github/CONTRIBUTING.md) et n'hésitez pas à ouvrir une issue ou une Pull Request.

---

<div align="center">

*IT Project Templates — de zéro au code en quelques minutes*

</div>
