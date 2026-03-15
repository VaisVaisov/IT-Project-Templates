# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**Modèles de projets prêts à l'emploi avec VS Code Dev Containers**

*Base Arch Linux · Chaîne Clang · Agents IA préinstallés*

[Modèles](#modèles-disponibles) • [Démarrage rapide](#démarrage-rapide) • [Installation](#installation) • [Dev Containers](#fonctionnalités-dev-container) • [CI/CD](#qualité-du-code--cicd)

**[🇬🇧 English](README.md) · [🇷🇺 Русский](README.ru.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## Qu'est-ce que c'est ?

Une collection de modèles de projets conçus pour vous faire passer de zéro au code en quelques minutes. Chaque modèle est livré avec un **VS Code Dev Container** entièrement configuré sous Arch Linux — même environnement sur toutes les machines, quel que soit le système hôte.

### Pourquoi utiliser cela plutôt qu'un projet vide ?

- 🚀 **Pas de configuration** : ouvrez dans VS Code, cliquez sur « Reopen in Container », commencez à coder
- 🤖 **Prêt pour l'IA** : Claude Code, Qwen Code et Kilo Code préinstallés dans chaque container
- 🔒 **Contrôle qualité** : les hooks pre-commit interceptent les problèmes avant qu'ils n'atteignent le dépôt
- ⚙️ **CI/CD inclus** : workflows GitHub Actions pour le linting, build, tests, coverage, documentation et releases
- 📝 **Conventional Commits** : commitlint vérifie le format des messages de commit
- 🌍 **Multiplateforme** : le même script fonctionne sur Linux, macOS et Windows

---

## Modèles disponibles

### C/C++ (`c-cpp/`)

| Modèle | Description |
| --- | --- |
| `pure` | C/C++ avec CMake, Ninja, GoogleTest, Doxygen, coverage via lcov |
| `hybrid` | C/C++ + Python/Cython — les deux langages dans un seul projet, Sphinx + ReadTheDocs |
| `platformio/` | Développement embarqué : Arduino, ESP32, STM32 |

### Python (`python/`)

| Modèle | Description |
| --- | --- |
| `pure` | Python avec pytest, ruff, pylint, mypy, Sphinx + ReadTheDocs |

### Appareils PlatformIO (`c-cpp/platformio/`)

| Appareil | Carte |
| --- | --- |
| `arduino-nano` | ATmega328P |
| `arduino-pro-micro` | ATmega32U4 |
| `esp32-devkit` | ESP32 DevKit |
| `stm32f411` | STM32F411 BlackPill |

---

## Démarrage rapide

### Linux / macOS

```bash
# Cloner où vous le souhaitez
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

### Windows (PowerShell)

```powershell
# Cloner où vous le souhaitez
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates

# Créer un nouveau projet
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Pure C:\Projects\my_cpp_app
.\IT-Project-Templates\new-project-script.ps1 -Python -Pure C:\Projects\my_python_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Hybrid C:\Projects\my_hybrid_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -PlatformIO -Esp32Devkit C:\Projects\sensor_node
```

Ou utilisez le lanceur batch — double-cliquez ou exécutez depuis cmd :

```cmd
new-project-shell.bat -CCpp -Pure C:\Projects\my_cpp_app
```

### Après la création du projet

1. Ouvrir le dossier du projet dans VS Code
2. Cliquer sur **« Reopen in Container »** (ou `Ctrl+Shift+P` → « Dev Containers: Reopen in Container »)
3. Lors du premier lancement, le container se construit automatiquement
4. Les hooks pre-commit s'installent automatiquement — vous êtes prêt !

---

## Référence des commandes

### Linux / macOS

```
new-project [langue] [type] [appareil] <chemin>

Langue :
  --c-cpp            Projet C/C++
  --python           Projet Python

Type :
  --pure             C/C++ ou Python pur
  --hybrid           Hybride C/C++ + Python/Cython  (--c-cpp uniquement)
  --platformio       Développement embarqué          (--c-cpp uniquement)

Appareils PlatformIO :
  --arduino-nano
  --arduino-pro-micro
  --esp32-devkit
  --stm32f411
```

### Windows (PowerShell)

```
new-project-script.ps1 [langue] [type] [appareil] <chemin>

Langue :
  -CCpp              Projet C/C++
  -Python            Projet Python

Type :
  -Pure              C/C++ ou Python pur
  -Hybrid            Hybride C/C++ + Python/Cython  (-CCpp uniquement)
  -PlatformIO        Développement embarqué          (-CCpp uniquement)

Appareils PlatformIO :
  -ArduinoNano
  -ArduinoProMicro
  -Esp32Devkit
  -Stm32f411
```

---

## Installation

### 1. Cloner le dépôt

```bash
# Linux / macOS
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Windows (PowerShell)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates
```

### 2. Ajouter au PATH

**Linux / macOS — Bash :**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**Linux / macOS — Zsh :**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**Windows — PATH système (permanent) :**
```powershell
[Environment]::SetEnvironmentVariable(
    "Path",
    "$env:Path;$env:USERPROFILE\IT-Project-Templates",
    "User"
)
```

> **Note (Linux/macOS) :** `new-project.sh` est déjà exécutable après le clonage. Sinon : `chmod +x new-project.sh`

### 3. Prérequis

| Outil | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Requis — [docker.com](https://www.docker.com/) | Requis — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **VS Code** | Requis — [code.visualstudio.com](https://code.visualstudio.com/) | Requis |
| **Extension Dev Containers** | Requis — installer depuis VS Code | Requis |
| **GitHub CLI** | Recommandé — `gh auth login` | Recommandé |
| **Python** | Pour les modèles hybrid/python | Pour les modèles hybrid/python |
| **Git** | Requis | Requis |

> **Astuce GitHub CLI :** authentifiez-vous une fois sur l'hôte avec `gh auth login`. Le container monte `~/.config/gh` depuis l'hôte — pas besoin de se ré-authentifier dans les Dev Containers.

---

## Structure du dépôt

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # Mise à jour automatique des dépendances (Actions + pre-commit)
├── c-cpp/
│   ├── pure/                   # Modèle C/C++ pur
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
│   ├── hybrid/                 # Modèle C/C++ + Python/Cython
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
│   └── platformio/             # Modèles embarqués
│       ├── .devcontainer/      # Devcontainer partagé (PlatformIO + Clang)
│       ├── .vscode/            # Config VS Code partagée
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       └── stm32f411/
├── python/
│   └── pure/                   # Modèle Python pur
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
├── meta-template/              # Base pour créer de nouveaux modèles
├── new-project.sh              # Script Linux / macOS
├── new-project-script.ps1      # Script Windows PowerShell
├── new-project-shell.bat       # Lanceur batch Windows
├── LICENSE
└── README.md
```

---

## Fonctionnalités Dev Container

Chaque container est construit sur **Arch Linux (dernière version)** et inclut :

- **Shell** : Zsh avec Oh My Zsh + Powerlevel10k
- **Éditeur** : Neovim
- **VCS** : Git, git-delta, GitHub CLI
- **Agents IA** : Claude Code, Qwen Code, Kilo Code CLI (depuis AUR) — tous disponibles comme outils CLI
- **Docker** : Docker + Docker Buildx + Lazydocker (pour faire tourner des containers dans des containers)
- **Auth GitHub** : `~/.config/gh` monté depuis l'hôte — pas besoin de se ré-authentifier

### Containers C/C++

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### Containers C/C++ hybrides

Tout ce que contient C/C++, plus :

- Python 3, pip, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (documentation)

### Containers Python

- Python 3, pip, virtualenv
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo
- pre-commit

### Containers PlatformIO

- PlatformIO Core + règles udev
- Clang, cppcheck (pour l'analyse de code)
- Python 3, pip
- pre-commit
- Accès aux périphériques USB (le container tourne avec `--privileged`)

---

## Extensions VS Code

Tous les modèles installent automatiquement les extensions à l'ouverture dans un Dev Container et les affichent comme recommandations sans Docker.

### Communes (tous les modèles)

| Catégorie | Extension | Rôle |
| --- | --- | --- |
| **IA** | Claude Code | Agent IA (CLI + VS Code) |
| | TONGYI Lingma | Assistant IA et complétion de code |
| | Kilo Code | Agent IA supportant 400+ modèles |
| **Git** | GitLens | Fonctions Git avancées (blame, historique) |
| | Git Graph | Historique visuel des commits |
| **Qualité** | Better Comments | Commentaires TODO/FIXME/NOTE colorés |
| | Code Spell Checker | Vérification orthographique dans le code |
| **Docker** | Docker | Gestion des containers |
| **Markdown** | Markdown All in One | Support Markdown complet |
| | Markdown Converter | Export PDF/HTML/Word |
| **Formats** | YAML (Red Hat) | Support YAML |
| | JSON (Meezilla) | Édition JSON améliorée |

### Modèles C/C++

- **C/C++ Tools** — IntelliSense et débogage
- **clangd** — Analyse et navigation avancées
- **Code Runner** — Exécution rapide du code

### Modèles Python

- **Python** + **Pylance** — Support de base et serveur de langage
- **debugpy** — Débogueur Python
- **Python Envs** — Gestion des environnements virtuels
- **autodocstring** — Génération automatique de docstrings
- **Django** + **Jinja** — Support des frameworks (Python pur)

### Modèles hybrides

Toutes les extensions C/C++ et Python combinées.

### Modèles PlatformIO

- **PlatformIO IDE** — Plateforme de développement embarqué
- **Wokwi Simulator** — Simulateur interactif Arduino/ESP32/STM32 directement dans VS Code
- **C/C++ Tools** — Support du code pour microcontrôleurs

---

## Qualité du code & CI/CD

### Hooks pre-commit

Les hooks s'exécutent automatiquement avant chaque commit. Ils sont installés au démarrage du Dev Container (`postCreateCommand`) — à la fois les hooks normaux et le hook de vérification du message de commit.

#### Projets C/C++
- **clang-format** — Formatage automatique du code (style LLVM)
- **clang-tidy** — Analyse statique pour les bugs et problèmes de style
- **cppcheck** — Fuites mémoire, vérifications null pointer, comportement indéfini
- **valgrind memcheck** — Détection des erreurs mémoire à l'exécution (hybrid + pure)

#### Projets Python
- **ruff** — Linting rapide + tri des imports (remplace flake8 + isort)
- **ruff-format** — Formatage du code (compatible black)
- **pylint** — Analyse sémantique profonde : code inaccessible, mauvais nombre d'arguments, attributs inexistants
- **mypy** — Vérification statique des types

#### Tous les projets
- **commitlint** — Vérification du format des messages de commit selon [Conventional Commits](https://www.conventionalcommits.org/)
- Validation YAML
- Détection des fichiers volumineux (> 1 Mo)
- Suppression des espaces en fin de ligne
- Correction de fin de fichier
- Détection des conflits de fusion

> Si un hook échoue, le commit est bloqué jusqu'à la correction du problème. Cela empêche le code défectueux d'entrer dans le dépôt.

### GitHub Actions

Chaque modèle inclut deux workflows : `ci.yml` (lancé à chaque push/PR) et `release.yml` (lancé sur le tag `v*`).

#### C/C++ Pure & Hybrid
- **Lint** : vérifications pre-commit (clang-format, clang-tidy, cppcheck, commitlint)
- **Build** : builds CMake Debug + Release avec presets
- **Test** : tests GoogleTest via ctest
- **Coverage** : gcov + lcov — rapport HTML uploadé comme artefact
- **Docs** : Doxygen (pure) ou Doxygen + Sphinx/furo (hybrid)
- **Pages** : publication automatique de la documentation sur GitHub Pages (branche `main` uniquement)
- **Release** : sur tag `v*` — build des binaires + Python wheel, création du GitHub Release

#### Python Pure
- **Lint** : vérifications pre-commit (ruff, pylint, mypy, commitlint)
- **Test** : pytest
- **Coverage** : pytest-cov — rapport XML + artefact
- **Docs** : Sphinx + furo, publication via ReadTheDocs
- **Release** : sur tag `v*` — build wheel + sdist, création du GitHub Release

#### PlatformIO
- **Lint** : vérifications pre-commit (clang-format, cppcheck, commitlint)
- **Build** : `pio run` — compilation du firmware
- **Test** : `pio test` (si le répertoire test existe)
- **Size** : `pio run --target size` — rapport de taille du firmware
- **Static analysis** : `pio check --fail-on-defect high`
- **Wokwi CI** : simulation du firmware dans le cloud — vérifie la sortie Serial sans matériel réel (nécessite `WOKWI_CLI_TOKEN` dans GitHub Secrets, 50 min/mois gratuit)
- **Release** : sur tag `v*` — upload des `.elf`/`.hex`/`.bin` dans GitHub Release

> **Wokwi CI et l'extension VS Code** utilisent le même `diagram.json` — le schéma dessiné sur [wokwi.com](https://wokwi.com). Plus de détails dans `@PROJECT_NAME@.md` du projet généré.
>
> **Note pour STM32F411** : Wokwi ne supporte pas directement BlackPill — `diagram.json` utilise `board-st-nucleo-f411re` (même MCU STM32F411, pinout différent). Adaptez le schéma à votre matériel réel.

Tous les workflows s'exécutent sur des **containers Arch Linux** pour la cohérence avec l'environnement de développement.

### Dependabot

À la racine du dépôt se trouve `.github/dependabot.yml` — il surveille automatiquement l'actualité des versions dans tous les modèles et propose des mises à jour via PR. Couvert :

- **GitHub Actions** — versions de actions/checkout, upload-artifact et autres
- **pre-commit hooks** — révisions de clang-format, ruff, mypy, pylint et autres

Les mises à jour sont vérifiées hebdomadairement — pas de suivi manuel des versions.

### Contexte IA pour les agents

Chaque projet généré contient un fichier `@PROJECT_NAME@.md` — source unique de vérité avec la description de l'architecture, la stack, les instructions de build et les règles pour les agents IA. `CLAUDE.md`, `QWEN.md` et `AGENTS.md` sont des liens symboliques vers ce fichier, donc Claude Code, Qwen Code et Kilo Code lisent automatiquement le même contexte.

---

## Documentation

### C/C++ Pure

La documentation est générée via **Doxygen** et publiée automatiquement sur **GitHub Pages** à chaque push sur `main`.

### C/C++ Hybrid & Python Pure

La documentation est construite via **Sphinx** avec le thème **furo** (support du mode sombre) et publiée via **ReadTheDocs**. Le modèle hybrid utilise également **Breathe** pour importer l'API C++ de Doxygen dans Sphinx.

Pour connecter ReadTheDocs :
1. Connecter le dépôt sur [readthedocs.org](https://readthedocs.org)
2. ReadTheDocs détectera automatiquement `.readthedocs.yaml` et commencera à construire à chaque push

---

## Licence

**Licence MIT** — Copyright © 2025–2026 Vais Vaisov

Libre d'utilisation, de modification et de distribution.

---

## Contribuer

Les contributions sont les bienvenues ! N'hésitez pas à ouvrir une issue ou à soumettre une Pull Request.

---

<div align="center">

*IT Project Templates — du zéro au code en quelques minutes*

</div>
