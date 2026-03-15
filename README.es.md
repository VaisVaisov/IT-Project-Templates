# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**Plantillas de proyectos listas para usar con VS Code Dev Containers**

*Base Arch Linux · Toolchain Clang · Agentes de IA preinstalados*

[Plantillas](#plantillas-disponibles) • [Inicio rápido](#inicio-rápido) • [Instalación](#instalación) • [Dev Containers](#características-del-dev-container) • [CI/CD](#calidad-del-código--cicd)

**[🇬🇧 English](README.md) · [🇷🇺 Русский](README.ru.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## ¿Qué es esto?

Una colección de plantillas de proyectos diseñadas para llevarte del cero al código en minutos. Cada plantilla incluye un **VS Code Dev Container** completamente configurado con Arch Linux — el mismo entorno en cada máquina, independientemente del sistema operativo host.

### ¿Por qué esto en vez de un proyecto en blanco?

- 🚀 **Sin tiempo de configuración**: abre en VS Code, haz clic en "Reopen in Container", empieza a programar
- 🤖 **Listo para IA**: Claude Code, Qwen Code y Kilo Code CLI preinstalados en cada container
- 🔒 **Control de calidad**: los hooks pre-commit detectan problemas antes de que lleguen al repositorio
- ⚙️ **CI/CD incluido**: workflows de GitHub Actions para linting, build, tests, coverage, documentación y releases
- 📝 **Conventional Commits**: commitlint verifica el formato de los mensajes de commit
- 🌍 **Multiplataforma**: el mismo script funciona en Linux, macOS y Windows (vía WSL2)

---

## Plantillas disponibles

### C/C++ (`c-cpp/`)

| Plantilla | Descripción |
| --- | --- |
| `pure` | C/C++ con CMake, Ninja, GoogleTest, Doxygen, coverage via lcov |
| `hybrid` | C/C++ + Python/Cython — ambos lenguajes en un solo proyecto, Sphinx + ReadTheDocs |
| `platformio/` | Desarrollo embebido: Arduino, ESP32, STM32 |

### Python (`python/`)

| Plantilla | Descripción |
| --- | --- |
| `pure` | Python con pytest, ruff, pylint, mypy, Sphinx + ReadTheDocs |

### Dispositivos PlatformIO (`c-cpp/platformio/`)

| Dispositivo | Placa |
| --- | --- |
| `arduino-nano` | ATmega328P |
| `arduino-pro-micro` | ATmega32U4 |
| `esp32-devkit` | ESP32 DevKit |
| `stm32f411` | STM32F411 BlackPill |

---

## Inicio rápido

### Linux / macOS

```bash
# Clona donde quieras
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Añadir al PATH (una sola vez)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # o ~/.bashrc
source ~/.zshrc

# Crear un nuevo proyecto
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (WSL2)

En Windows, todo el ecosistema funciona a través de WSL2. Instala WSL2 y usa el mismo script:

```bash
# Clonar en el home de WSL2
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Añadir al PATH (una sola vez, en WSL2)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # o ~/.bashrc
source ~/.zshrc

# Crear un nuevo proyecto (desde WSL2)
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Después de crear el proyecto

1. Abrir la carpeta del proyecto en VS Code
2. Hacer clic en **"Reopen in Container"** (o `Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. En el primer lanzamiento, el container se construye automáticamente
4. Los hooks pre-commit se instalan automáticamente — ¡listo para empezar!

---

## Referencia de uso

### Linux / macOS

```
new-project [idioma] [tipo] [dispositivo] <ruta>

Idioma:
  --c-cpp            Proyecto C/C++
  --python           Proyecto Python

Tipo:
  --pure             C/C++ o Python puro
  --hybrid           Híbrido C/C++ + Python/Cython  (solo --c-cpp)
  --platformio       Desarrollo embebido             (solo --c-cpp)

Dispositivos PlatformIO:
  --arduino-nano
  --arduino-pro-micro
  --esp32-devkit
  --stm32f411
```

---

## Instalación

### 1. Clonar el repositorio

```bash
# Linux / macOS / Windows (WSL2)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates
```

### 2. Añadir al PATH

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

> **Nota:** `new-project.sh` ya es ejecutable tras clonar. Si no: `chmod +x new-project.sh`

### 3. Requisitos previos

| Herramienta | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Requerido — [docker.com](https://www.docker.com/) | Requerido — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **WSL2** | — | Requerido — [Guía de instalación WSL2](https://learn.microsoft.com/es-es/windows/wsl/install) + extensión **WSL** en VS Code |
| **VS Code** | Requerido — [code.visualstudio.com](https://code.visualstudio.com/) | Requerido |
| **Extensión Dev Containers** | Requerido — instalar desde VS Code | Requerido (abrir proyecto desde WSL2) |
| **GitHub CLI** | Recomendado | Recomendado (para Windows — en WSL2) |
| **uv** | Para plantillas hybrid/python — [astral.sh/uv](https://astral.sh/uv) | Para plantillas hybrid/python — instalar en WSL2 |
| **Git** | Requerido | Requerido — instalar en WSL2 |

> **Consejo GitHub CLI:** autentícate una vez en el host (para Windows — en WSL2) con `gh auth login`. El container monta `~/.config/gh` desde el host — no es necesario volver a autenticarse dentro de los Dev Containers.

---

## Estructura del repositorio

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # Actualización automática de dependencias (Actions + pre-commit)
├── c-cpp/
│   ├── pure/                   # Plantilla C/C++ pura
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
│   ├── hybrid/                 # Plantilla C/C++ + Python/Cython
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
│   └── platformio/             # Plantillas embebidas
│       ├── .devcontainer/      # Devcontainer compartido (PlatformIO + Clang)
│       ├── .vscode/            # Configuración VS Code compartida
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       └── stm32f411/
├── python/
│   └── pure/                   # Plantilla Python pura
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
├── meta-template/              # Base para crear nuevas plantillas
├── new-project.sh              # Script Linux / macOS / Windows (WSL2)
├── LICENSE
└── README.md
```

---

## Características del Dev Container

Cada container está construido sobre **Arch Linux (última versión)** e incluye:

- **Shell**: Zsh con Oh My Zsh + Powerlevel10k
- **Editor**: Neovim
- **VCS**: Git, git-delta, GitHub CLI
- **Agentes IA**: Claude Code, Qwen Code, Kilo Code CLI (desde AUR) — todos disponibles como herramientas CLI
- **Docker**: Docker + Docker Buildx + Lazydocker (para ejecutar containers dentro de containers)
- **Auth GitHub**: `~/.config/gh` montado desde el host — sin necesidad de volver a autenticarse

### Containers C/C++

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### Containers C/C++ híbridos

Todo lo de C/C++, más:

- Python 3, pip, uv, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (documentación)

### Containers Python

- Python 3, pip, uv, virtualenv
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo
- pre-commit

### Containers PlatformIO

- PlatformIO Core + reglas udev
- Clang, cppcheck (para análisis de código)
- Python 3, pip
- pre-commit
- Acceso a dispositivos USB (el container corre con `--privileged`)

---

## Extensiones VS Code

Todas las plantillas instalan extensiones automáticamente al abrir en un Dev Container y las muestran como recomendaciones sin Docker.

### Comunes (todas las plantillas)

| Categoría | Extensión | Propósito |
| --- | --- | --- |
| **IA** | Claude Code | Agente IA (CLI + VS Code) |
| | TONGYI Lingma | Asistente IA y autocompletado |
| | Kilo Code | Agente IA con soporte 400+ modelos |
| **Git** | GitLens | Funciones Git avanzadas (blame, historial) |
| | Git Graph | Historial visual de commits |
| **Calidad** | Better Comments | Comentarios TODO/FIXME/NOTE coloridos |
| | Code Spell Checker | Corrección ortográfica en código |
| **Docker** | Docker | Gestión de containers |
| **Markdown** | Markdown All in One | Soporte Markdown completo |
| | Markdown Converter | Exportar a PDF/HTML/Word |
| **Formatos** | YAML (Red Hat) | Soporte YAML |
| | JSON (Meezilla) | Edición JSON mejorada |

### Plantillas C/C++

- **C/C++ Tools** — IntelliSense y depuración
- **clangd** — Análisis y navegación avanzados
- **Code Runner** — Ejecución rápida de código

### Plantillas Python

- **Python** + **Pylance** — Soporte principal y servidor de lenguaje
- **debugpy** — Depurador Python
- **Python Envs** — Gestión de entornos virtuales
- **autodocstring** — Generación automática de docstrings
- **Django** + **Jinja** — Soporte de frameworks (Python puro)

### Plantillas híbridas

Todas las extensiones de C/C++ y Python combinadas.

### Plantillas PlatformIO

- **PlatformIO IDE** — Plataforma de desarrollo embebido
- **Wokwi Simulator** — Simulador interactivo de Arduino/ESP32/STM32 directamente en VS Code
- **C/C++ Tools** — Soporte de código para microcontroladores

---

## Calidad del código & CI/CD

### Hooks pre-commit

Los hooks se ejecutan automáticamente antes de cada commit. Se instalan cuando arranca el Dev Container (`postCreateCommand`) — tanto los hooks normales como el hook de verificación del mensaje de commit.

#### Proyectos C/C++
- **clang-format** — Formateo automático (estilo LLVM)
- **clang-tidy** — Análisis estático para bugs y problemas de estilo
- **cppcheck** — Fugas de memoria, comprobaciones null pointer, comportamiento indefinido
- **valgrind memcheck** — Detección de errores de memoria en tiempo de ejecución (hybrid + pure)

#### Proyectos Python
- **ruff** — Linting rápido + ordenación de imports (reemplaza flake8 + isort)
- **ruff-format** — Formateo de código (compatible con black)
- **pylint** — Análisis semántico profundo: código inalcanzable, número incorrecto de argumentos, acceso a atributos inexistentes
- **mypy** — Verificación estática de tipos

#### Todos los proyectos
- **commitlint** — Verificación del formato de mensajes de commit según [Conventional Commits](https://www.conventionalcommits.org/)
- **detect-secrets** — Bloquea commits con secretos (claves API, tokens, contraseñas)
- Validación YAML
- Detección de archivos grandes (> 1 MB)
- Eliminación de espacios en blanco al final
- Corrección de fin de archivo
- Detección de conflictos de fusión

> Si un hook falla, el commit queda bloqueado hasta que se corrija el problema. Esto evita que código defectuoso entre al repositorio.

### GitHub Actions

Cada plantilla incluye dos workflows: `ci.yml` (se ejecuta en cada push/PR) y `release.yml` (se ejecuta en el tag `v*`).

#### C/C++ Pure & Hybrid
- **Lint**: verificaciones pre-commit (clang-format, clang-tidy, cppcheck, commitlint)
- **Build**: builds CMake Debug + Release con presets
- **Test**: tests GoogleTest via ctest
- **Coverage**: gcov + lcov — informe HTML + resumen en GitHub Actions UI + badge de cobertura en GitHub Pages
- **Matrix**: Python 3.10–3.13 (solo hybrid)
- **Security**: Trivy — escaneo CVE (HIGH/CRITICAL, bloquea el merge)
- **Docs**: Doxygen (pure) o Doxygen + Sphinx/furo (hybrid) → GitHub Pages en `main`
- **Release**: en tag `v*` — git-cliff genera CHANGELOG, construye artefactos, crea GitHub Release

#### Python Pure
- **Lint**: verificaciones pre-commit (ruff, pylint, mypy, commitlint)
- **Test**: pytest + resumen de cobertura en GitHub Actions UI + comentario de cobertura en PR
- **Badge de cobertura**: publicado en GitHub Pages en push a `main`
- **Matrix**: Python 3.10–3.13
- **Security**: Trivy — escaneo CVE (HIGH/CRITICAL, bloquea el merge)
- **Docs**: Sphinx + furo → GitHub Pages (`main`) + ReadTheDocs (todas las ramas/tags)
- **Release**: en tag `v*` — git-cliff genera CHANGELOG, construye wheel + sdist, crea GitHub Release

#### PlatformIO
- **Lint**: verificaciones pre-commit (clang-format, cppcheck, commitlint)
- **Build**: `pio run` — compilación del firmware
- **Test**: `pio test` (si existe el directorio test)
- **Size**: `pio run --target size` — informe de tamaño del firmware
- **Static analysis**: `pio check --fail-on-defect high`
- **Wokwi CI**: simulación del firmware en la nube — verifica la salida Serial sin hardware real (requiere `WOKWI_CLI_TOKEN` en GitHub Secrets, 50 min/mes gratis)
- **Release**: en tag `v*` — sube `.elf`/`.hex`/`.bin` al GitHub Release

> **Wokwi CI y la extensión VS Code** usan el mismo `diagram.json` — el esquema dibujado en [wokwi.com](https://wokwi.com). Más detalles en `@PROJECT_NAME@.md` del proyecto generado.
>
> **Nota para STM32F411**: Wokwi no soporta BlackPill directamente — `diagram.json` usa `board-st-nucleo-f411re` (mismo MCU STM32F411, diferente pinout). Ajuste el esquema al hardware real.

Todos los workflows se ejecutan en **containers Arch Linux** para total consistencia con el entorno de desarrollo.

### Dependabot

En la raíz del repositorio se encuentra `.github/dependabot.yml` — monitorea automáticamente la actualidad de las versiones en todas las plantillas y propone actualizaciones vía PR. Cubre:

- **GitHub Actions** — versiones de actions/checkout, upload-artifact y otros
- **pre-commit hooks** — revisiones de clang-format, ruff, mypy, pylint y otros

Las actualizaciones se comprueban semanalmente — sin seguimiento manual de versiones.

### Contexto IA para agentes

Cada proyecto generado contiene un archivo `@PROJECT_NAME@.md` — fuente única de verdad con la descripción de arquitectura, stack, instrucciones de build y reglas para agentes IA. `CLAUDE.md`, `QWEN.md` y `AGENTS.md` son symlinks a este archivo, por lo que Claude Code, Qwen Code y Kilo Code leen automáticamente el mismo contexto.

---

## Documentación

### C/C++ Pure

La documentación se genera via **Doxygen** y se publica automáticamente en **GitHub Pages** en cada push a `main`.

### C/C++ Hybrid & Python Pure

La documentación se construye via **Sphinx** con el tema **furo** (soporte de modo oscuro) y se publica en **dos lugares**:
- **GitHub Pages** — automáticamente en cada push a `main`
- **ReadTheDocs** — automáticamente en cada push (todas las ramas/tags, con versionado)

La plantilla hybrid usa adicionalmente **Breathe** para importar la API C++ de Doxygen en Sphinx.

Para conectar ReadTheDocs:
1. Conectar el repositorio en [readthedocs.org](https://readthedocs.org)
2. ReadTheDocs detectará automáticamente `.readthedocs.yaml` y comenzará a construir en cada push

---

## Licencia

**Licencia MIT** — Copyright © 2025–2026 Vais Vaisov

Libre de usar, modificar y distribuir.

---

## Contribuir

¡Las contribuciones son bienvenidas! Lee [CONTRIBUTING.md](.github/CONTRIBUTING.md) y no dudes en abrir un issue o enviar un Pull Request.

---

<div align="center">

*IT Project Templates — de cero al código en minutos*

</div>
