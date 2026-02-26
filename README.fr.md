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
- 🤖 **Prêt pour l'IA** : Claude Code et Qwen Code préinstallés dans chaque container
- 🔒 **Contrôle qualité** : les hooks pre-commit interceptent les problèmes avant qu'ils n'atteignent le dépôt
- ⚙️ **CI/CD inclus** : workflows GitHub Actions pour les builds, tests et documentation
- 🌍 **Multiplateforme** : le même script fonctionne sur Linux, macOS et Windows

---

## Modèles disponibles

### C/C++ (`c-cpp/`)

| Modèle | Description |
| --- | --- |
| `pure` | C/C++ avec CMake, Ninja, GoogleTest, Doxygen |
| `hybrid` | C/C++ + Python/Cython — les deux langages dans un seul projet |
| `platformio/` | Développement embarqué pour Arduino, ESP32, STM32 |

### Python (`python/`)

| Modèle | Description |
| --- | --- |
| `pure` | Python avec pytest, black, isort, pylint, mypy, flake8 |

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
3. Lors du premier lancement, attendre que le container soit construit
4. Les hooks pre-commit s'installent automatiquement — vous êtes prêt !

---

## Référence des commandes

### Flags Linux / macOS

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

### Flags Windows (PowerShell)

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

## Structure du projet

```
IT-Project-Templates/
├── .devcontainer/              # Container de base (Arch + Zsh + Agents IA)
├── c-cpp/
│   ├── pure/                   # Modèle C/C++ pur
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB
│   │   ├── .vscode/
│   │   ├── .github/workflows/
│   │   └── ...
│   ├── hybrid/                 # Modèle C/C++ + Python/Cython
│   │   ├── .devcontainer/      # Clang + Python + Cython
│   │   ├── .vscode/
│   │   ├── .github/workflows/
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
│       ├── .devcontainer/      # Python + pytest + linters
│       ├── .vscode/
│       ├── .github/workflows/
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
- **Agents IA** : Claude Code, Qwen Code (depuis AUR)
- **Docker** : Docker + Docker Buildx + Lazydocker (pour faire tourner des containers dans des containers)
- **Auth GitHub** : `~/.config/gh` monté depuis l'hôte — pas besoin de se ré-authentifier

### Containers C/C++

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB
- cppcheck (analyse statique)
- pre-commit

### Containers C/C++ hybrides

Tout ce que contient C/C++, plus :

- Python 3, pip, virtualenv
- Cython, NumPy
- pytest, black, isort, pylint, mypy
- Sphinx (documentation)

### Containers Python

- Python 3, pip, virtualenv
- pytest, black, isort, pylint, mypy, flake8
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
- **Wokwi Simulator** — Simulateur Arduino/ESP32
- **C/C++ Tools** — Support du code pour microcontrôleurs

---

## Qualité du code & CI/CD

### Hooks pre-commit

Les hooks s'exécutent automatiquement avant chaque commit. Ils sont installés au démarrage du Dev Container (`postCreateCommand`).

#### Projets C/C++
- **clang-format** — Formatage automatique (style LLVM, limite 100 caractères)
- **clang-tidy** — Analyse statique pour les bugs et problèmes de style
- **cppcheck** — Fuites mémoire, vérifications null pointer, comportement indéfini

#### Projets Python
- **black** — Formatage du code (conforme PEP 8)
- **isort** — Tri des imports
- **flake8** — Linting syntaxe et style
- **mypy** — Vérification statique des types
- **pylint** — Analyse de la qualité du code

#### Tous les projets
- Validation YAML
- Détection des fichiers volumineux (> 1 Mo)
- Suppression des espaces en fin de ligne
- Correction de fin de fichier
- Détection des conflits de fusion

> Si un hook échoue, le commit est bloqué jusqu'à la correction du problème. Cela empêche le code défectueux d'entrer dans le dépôt.

### GitHub Actions

Chaque modèle inclut un workflow CI dans `.github/workflows/ci.yml`.

#### C/C++ Pure & Hybrid
- Build avec CMake + Ninja
- Exécution des suites GoogleTest
- Génération de la documentation Doxygen
- Publication automatique des docs sur GitHub Pages (branche main uniquement)

#### Python Pure
- Exécution de la suite pytest
- Vérifications qualité du code (black, isort, flake8, mypy)
- Rapports de couverture de tests

#### PlatformIO
- Build du firmware pour l'appareil cible
- Vérification des limites de taille du firmware

Tous les workflows s'exécutent sur des **containers Arch Linux** pour la cohérence avec l'environnement de développement.

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
