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
- 🤖 **Listo para IA**: Claude Code y Qwen Code preinstalados en cada container
- 🔒 **Control de calidad**: los hooks pre-commit detectan problemas antes de que lleguen al repositorio
- ⚙️ **CI/CD incluido**: workflows de GitHub Actions para build, tests y documentación
- 🌍 **Multiplataforma**: el mismo script funciona en Linux, macOS y Windows

---

## Plantillas disponibles

### C/C++ (`c-cpp/`)

| Plantilla | Descripción |
| --- | --- |
| `pure` | C/C++ con CMake, Ninja, GoogleTest, Doxygen |
| `hybrid` | C/C++ + Python/Cython — ambos lenguajes en un solo proyecto |
| `platformio/` | Desarrollo embebido para Arduino, ESP32, STM32 |

### Python (`python/`)

| Plantilla | Descripción |
| --- | --- |
| `pure` | Python con pytest, black, isort, pylint, mypy, flake8 |

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

### Windows (PowerShell)

```powershell
# Clona donde quieras
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates

# Crear un nuevo proyecto
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Pure C:\Projects\my_cpp_app
.\IT-Project-Templates\new-project-script.ps1 -Python -Pure C:\Projects\my_python_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Hybrid C:\Projects\my_hybrid_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -PlatformIO -Esp32Devkit C:\Projects\sensor_node
```

O usa el lanzador batch — doble clic o ejecutar desde cmd:

```cmd
new-project-shell.bat -CCpp -Pure C:\Projects\my_cpp_app
```

### Después de crear el proyecto

1. Abrir la carpeta del proyecto en VS Code
2. Hacer clic en **"Reopen in Container"** (o `Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. En el primer lanzamiento, esperar a que se construya el container
4. Los hooks pre-commit se instalan automáticamente — ¡listo para empezar!

---

## Referencia de uso

### Flags Linux / macOS

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

### Flags Windows (PowerShell)

```
new-project-script.ps1 [idioma] [tipo] [dispositivo] <ruta>

Idioma:
  -CCpp              Proyecto C/C++
  -Python            Proyecto Python

Tipo:
  -Pure              C/C++ o Python puro
  -Hybrid            Híbrido C/C++ + Python/Cython  (solo -CCpp)
  -PlatformIO        Desarrollo embebido             (solo -CCpp)

Dispositivos PlatformIO:
  -ArduinoNano
  -ArduinoProMicro
  -Esp32Devkit
  -Stm32f411
```

---

## Instalación

### 1. Clonar el repositorio

```bash
# Linux / macOS
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Windows (PowerShell)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates
```

### 2. Añadir al PATH

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

**Windows — PATH del sistema (permanente):**
```powershell
[Environment]::SetEnvironmentVariable(
    "Path",
    "$env:Path;$env:USERPROFILE\IT-Project-Templates",
    "User"
)
```

> **Nota (Linux/macOS):** `new-project.sh` ya es ejecutable tras clonar. Si no: `chmod +x new-project.sh`

### 3. Requisitos previos

| Herramienta | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Requerido — [docker.com](https://www.docker.com/) | Requerido — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **VS Code** | Requerido — [code.visualstudio.com](https://code.visualstudio.com/) | Requerido |
| **Extensión Dev Containers** | Requerido — instalar desde VS Code | Requerido |
| **GitHub CLI** | Recomendado — `gh auth login` | Recomendado |
| **Python** | Para plantillas hybrid/python | Para plantillas hybrid/python |
| **Git** | Requerido | Requerido |

> **Consejo GitHub CLI:** autentícate una vez en el host con `gh auth login`. El container monta `~/.config/gh` desde el host — no es necesario volver a autenticarse dentro de los Dev Containers.

---

## Estructura del proyecto

```
IT-Project-Templates/
├── .devcontainer/              # Container base (Arch + Zsh + Agentes IA)
├── c-cpp/
│   ├── pure/                   # Plantilla C/C++ pura
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB
│   │   ├── .vscode/
│   │   ├── .github/workflows/
│   │   └── ...
│   ├── hybrid/                 # Plantilla C/C++ + Python/Cython
│   │   ├── .devcontainer/      # Clang + Python + Cython
│   │   ├── .vscode/
│   │   ├── .github/workflows/
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
│       ├── .devcontainer/      # Python + pytest + linters
│       ├── .vscode/
│       ├── .github/workflows/
│       └── ...
├── meta-template/              # Base para crear nuevas plantillas
├── new-project.sh              # Script Linux / macOS
├── new-project-script.ps1      # Script Windows PowerShell
├── new-project-shell.bat       # Lanzador batch Windows
├── LICENSE
└── README.md
```

---

## Características del Dev Container

Cada container está construido sobre **Arch Linux (última versión)** e incluye:

- **Shell**: Zsh con Oh My Zsh + Powerlevel10k
- **Editor**: Neovim
- **VCS**: Git, git-delta, GitHub CLI
- **Agentes IA**: Claude Code, Qwen Code (desde AUR)
- **Docker**: Docker + Docker Buildx + Lazydocker (para ejecutar containers dentro de containers)
- **Auth GitHub**: `~/.config/gh` montado desde el host — sin necesidad de volver a autenticarse

### Containers C/C++

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB
- cppcheck (análisis estático)
- pre-commit

### Containers C/C++ híbridos

Todo lo de C/C++, más:

- Python 3, pip, virtualenv
- Cython, NumPy
- pytest, black, isort, pylint, mypy
- Sphinx (documentación)

### Containers Python

- Python 3, pip, virtualenv
- pytest, black, isort, pylint, mypy, flake8
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
- **Wokwi Simulator** — Simulador Arduino/ESP32
- **C/C++ Tools** — Soporte de código para microcontroladores

---

## Calidad del código & CI/CD

### Hooks pre-commit

Los hooks se ejecutan automáticamente antes de cada commit. Se instalan cuando arranca el Dev Container (`postCreateCommand`).

#### Proyectos C/C++
- **clang-format** — Formateo automático (estilo LLVM, límite 100 caracteres)
- **clang-tidy** — Análisis estático para bugs y problemas de estilo
- **cppcheck** — Fugas de memoria, comprobaciones null pointer, comportamiento indefinido

#### Proyectos Python
- **black** — Formateo de código (compatible con PEP 8)
- **isort** — Ordenación de imports
- **flake8** — Linting de sintaxis y estilo
- **mypy** — Verificación estática de tipos
- **pylint** — Análisis de calidad del código

#### Todos los proyectos
- Validación YAML
- Detección de archivos grandes (> 1 MB)
- Eliminación de espacios en blanco al final
- Corrección de fin de archivo
- Detección de conflictos de fusión

> Si un hook falla, el commit queda bloqueado hasta que se corrija el problema. Esto evita que código defectuoso entre al repositorio.

### GitHub Actions

Cada plantilla incluye un workflow CI en `.github/workflows/ci.yml`.

#### C/C++ Pure & Hybrid
- Build con CMake + Ninja
- Ejecutar suites GoogleTest
- Generar documentación Doxygen
- Publicar docs automáticamente en GitHub Pages (solo rama main)

#### Python Pure
- Ejecutar suite pytest
- Verificaciones de calidad (black, isort, flake8, mypy)
- Informes de cobertura de tests

#### PlatformIO
- Build del firmware para el dispositivo objetivo
- Verificar límites de tamaño del firmware

Todos los workflows se ejecutan en **containers Arch Linux** para mantener consistencia con el entorno de desarrollo.

---

## Licencia

**Licencia MIT** — Copyright © 2025–2026 Vais Vaisov

Libre de usar, modificar y distribuir.

---

## Contribuir

¡Las contribuciones son bienvenidas! No dudes en abrir un issue o enviar un Pull Request.

---

<div align="center">

*IT Project Templates — de cero al código en minutos*

</div>
