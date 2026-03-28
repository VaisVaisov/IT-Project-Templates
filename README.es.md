# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**Plantillas de proyectos listas para usar con VS Code Dev Containers**

*Arch Linux · Cadena de herramientas Clang · Agentes de IA preinstalados*

[Plantillas](#plantillas-disponibles) • [Inicio rápido](#inicio-rápido) • [Instalación](#instalación) • [Dev Containers](#funciones-dev-container) • [CI/CD](#calidad-del-código--cicd) • [PlatformIO](#plantillas-platformio) • [Funciones](#funciones--uso)

**[🇷🇺 Русский](README.ru.md) · [🇬🇧 English](README.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## ¿Qué es esto?

Una colección de plantillas de proyectos que te permiten empezar a desarrollar en minutos. Cada plantilla incluye un **VS Code Dev Container** completamente configurado basado en Arch Linux — el mismo entorno en cualquier máquina, independientemente del sistema operativo anfitrión.

### ¿Por qué usarlo?

- 🚀 **Sin configuración**: abrir en VS Code, hacer clic en "Reopen in Container" — empezar a programar inmediatamente
- 🤖 **Listo para IA**: Claude Code, Qwen Code y Kilo Code preinstalados en cada contenedor
- 🔒 **Puertas de calidad**: los hooks pre-commit detectan problemas antes de que lleguen al repositorio
- ⚙️ **CI/CD incluido**: GitHub Actions para linting, builds, tests, cobertura, docs y releases
- 📝 **Conventional Commits**: commitlint impone el formato de los mensajes de commit
- 🌍 **Multiplataforma**: un script funciona en Linux, macOS y Windows (a través de WSL2)

---

## Plantillas disponibles

### C/C++ (`c-cpp/`)

| Plantilla | Descripción |
| --- | --- |
| `pure` | C/C++ con CMake, Ninja, GoogleTest, Google Benchmark, Doxygen, cobertura lcov |
| `hybrid` | C/C++ + Python/Cython — ambos lenguajes en un proyecto, Sphinx + ReadTheDocs |
| `platformio/` | Desarrollo embebido (Arduino, ESP32, ESP8266, Pico, STM32) |

### Python (`python/`)

| Plantilla | Descripción |
| --- | --- |
| `pure` | Python con pytest, ruff, pylint, mypy, Sphinx + ReadTheDocs |

### Dispositivos PlatformIO (`c-cpp/platformio/`)

| Directorio | Placa | Arquitectura | Wokwi CI |
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

> \* STM32F411: Wokwi usa `board-st-nucleo-f411re` (mismo MCU, pinout diferente) — ver sección [PlatformIO](#plantillas-platformio). ESP8266: Wokwi no soportado — solo build.

---

## Inicio rápido

### Linux / macOS

```bash
# Clonar donde quieras
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Agregar al PATH (una sola vez)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # o ~/.bashrc
source ~/.zshrc

# Crear un nuevo proyecto
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (WSL2)

En Windows, todo el ecosistema funciona a través de WSL2. Instalar WSL2 y usar el mismo script:

```bash
# Clonar en el home de WSL2
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Agregar al PATH (una vez, en WSL2)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # o ~/.bashrc
source ~/.zshrc

# Crear un nuevo proyecto (desde WSL2)
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Después de crear un proyecto

1. Abrir la carpeta del proyecto en VS Code
2. Hacer clic en **"Reopen in Container"** (o `Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. El contenedor se construye automáticamente en el primer inicio
4. Los hooks pre-commit se instalan solos — ¡listo para programar!

---

## Referencia de uso

```
new-project [--help] <lenguaje> <tipo> [dispositivo] <ruta>

Lenguaje:
  --c-cpp            Proyecto C/C++
  --python           Proyecto Python

Tipo:
  --pure             C/C++ o Python puro
  --hybrid           Híbrido C/C++ + Python/Cython  (solo --c-cpp)
  --platformio       Desarrollo embebido              (solo --c-cpp)

Dispositivos PlatformIO (Arduino):
  --arduino-nano          Arduino Nano (ATmega328P)
  --arduino-pro-micro     Arduino Pro Micro (ATmega32U4, USB HID)

Dispositivos PlatformIO (ESP32):
  --esp32-devkit          ESP32 DevKit V1 (Xtensa LX6, WiFi + BT)
  --esp32-s2-saola        ESP32-S2 Saola (Xtensa LX7, USB OTG)
  --esp32-s3-devkitc      ESP32-S3 DevKitC (Xtensa LX7, AI+IoT)
  --esp32-c3-devkitm      ESP32-C3 DevKitM (RISC-V, WiFi + BT)
  --esp32-c6-devkitc      ESP32-C6 DevKitC (RISC-V, WiFi 6 + Zigbee)
  --esp32-h2-devkitm      ESP32-H2 DevKitM (RISC-V, Zigbee + Thread)

Dispositivos PlatformIO (otros):
  --esp8266-wemos-d1-mini Wemos D1 Mini (ESP8266, WiFi) — solo build, sin Wokwi
  --rpi-pico              Raspberry Pi Pico (RP2040, dual-core ARM Cortex-M0+)
  --stm32f411-blackpill   STM32F411 Black Pill (Cortex-M4, 100 MHz)
  --stm32f103-bluepill    STM32F103 Blue Pill (Cortex-M3, 72 MHz)

Opciones:
  --help, -h         Mostrar esta ayuda y salir
```

---

## Instalación

### 1. Clonar el repositorio

```bash
# Linux / macOS / Windows (WSL2)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates
```

### 2. Agregar al PATH

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

> **Nota:** `new-project.sh` ya es ejecutable después de clonar. Si no: `chmod +x new-project.sh`

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

> **Consejo GitHub CLI:** autenticarse una vez en el host (para Windows — en WSL2) con `gh auth login`. El contenedor monta `~/.config/gh` desde el host — no se necesita re-autenticación dentro del Dev Container.

---

## Estructura del proyecto

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # Actualizaciones automáticas de dependencias (Actions + pre-commit)
├── c-cpp/
│   ├── pure/                   # Plantilla C/C++ pura
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB + lcov + valgrind
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Ejemplos Google Benchmark
│   │   ├── tools/profiler/     # Scripts Valgrind + perf
│   │   └── ...
│   ├── hybrid/                 # Plantilla C/C++ + Python/Cython
│   │   ├── .devcontainer/      # Clang + Python + Cython + ruff + pylint
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Ejemplos Google Benchmark
│   │   ├── tools/profiler/     # Valgrind + perf + perfiladores Python
│   │   └── ...
│   └── platformio/             # Plantillas embebidas
│       ├── .devcontainer/      # Devcontainer compartido (PlatformIO + Clang)
│       ├── .vscode/            # Configuración VS Code compartida
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       ├── esp32-s2-saola/
│       ├── esp32-s3-devkitc/
│       ├── esp32-c3-devkitm/
│       ├── esp32-c6-devkitc/
│       ├── esp32-h2-devkitm/
│       ├── esp8266-wemos-d1-mini/
│       ├── rpi-pico/
│       ├── stm32f411-blackpill/
│       └── stm32f103-bluepill/
├── python/
│   └── pure/                   # Plantilla Python pura
│       ├── .devcontainer/      # Python + ruff + pylint + mypy
│       ├── .github/
│       │   ├── workflows/      # ci.yml + release.yml
│       │   └── ISSUE_TEMPLATE/
│       ├── .vscode/
│       ├── tools/profiler/     # Perfiladores Python
│       └── ...
├── meta-template/              # Base para crear nuevas plantillas
├── new-project.sh              # Script para Linux / macOS / Windows (WSL2)
├── LICENSE
└── README.md
```

---

## Funciones Dev Container

Cada contenedor está construido sobre **Arch Linux (latest)** e incluye:

- **Shell**: Zsh con Oh My Zsh + Powerlevel10k
- **Editor**: Neovim
- **VCS**: Git, git-delta, GitHub CLI
- **Agentes IA**: Claude Code, Qwen Code, Kilo Code CLI (desde AUR) — todos disponibles como herramientas CLI
- **Docker**: Docker + Docker Buildx + Lazydocker (para ejecutar contenedores dentro de contenedores)
- **Auth GitHub**: `~/.config/gh` montado desde el host — sin re-autenticación necesaria

### Contenedores C/C++

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### Contenedores Hybrid (C/C++ + Python)

Todo lo de C/C++, más:

- Python 3, pip, uv, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (documentación)
- py-spy, memory-profiler (profiling Python)

### Contenedores Python

- Python 3, pip, uv, virtualenv
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo
- pre-commit

### Contenedores PlatformIO

- PlatformIO Core + reglas udev
- Clang, cppcheck (análisis estático)
- Python 3, pip
- pre-commit
- Acceso a dispositivos USB (contenedor ejecutado con `--privileged`)

---

## Extensiones VS Code

Todas las plantillas instalan extensiones automáticamente al abrir en un Dev Container y las muestran como recomendaciones sin Docker.

### Comunes (todas las plantillas)

| Categoría | Extensión | Propósito |
| --- | --- | --- |
| **IA** | Claude Code | Agente IA (CLI + VS Code) |
| | TONGYI Lingma | Asistente IA y autocompletado |
| | Kilo Code | Agente IA con soporte para 400+ modelos |
| **Git** | GitLens | Funciones Git avanzadas (blame, historial) |
| | Git Graph | Grafo visual de commits |
| **Calidad** | Better Comments | Comentarios TODO/FIXME/NOTE con color |
| | Code Spell Checker | Corrector ortográfico en código y comentarios |
| **Docker** | Docker | Gestión de contenedores |
| **Markdown** | Markdown All in One | Soporte Markdown completo |
| | Markdown Converter | Exportar a PDF/HTML/Word |
| **Formatos** | YAML (Red Hat) | Soporte YAML |
| | JSON (Meezilla) | Edición JSON avanzada |

### Plantillas C/C++

- **C/C++ Tools** — IntelliSense y depuración
- **clangd** — Análisis de código avanzado y navegación
- **Code Runner** — Ejecución rápida de código

### Plantillas Python

- **Python** + **Pylance** — Soporte básico y servidor de lenguaje
- **debugpy** — Depurador Python
- **Python Envs** — Gestión de entornos virtuales
- **autodocstring** — Auto-generación de docstrings
- **Django** + **Jinja** — Soporte de frameworks (Python puro)

### Plantillas Hybrid

Todas las extensiones de C/C++ y Python combinadas.

### Plantillas PlatformIO

- **PlatformIO IDE** — Plataforma de desarrollo embebido
- **Wokwi Simulator** — Simulador interactivo Arduino/ESP32/STM32 directamente en VS Code
- **C/C++ Tools** — Soporte de código para microcontroladores

---

## Calidad del código & CI/CD

### Hooks pre-commit

Los hooks se ejecutan automáticamente antes de cada commit. Se instalan al iniciar el Dev Container (`postCreateCommand`).

#### Proyectos C/C++
- **clang-format** — Formateo automático de código (estilo LLVM)
- **clang-tidy** — Análisis estático para bugs y problemas de estilo
- **cppcheck** — Fugas de memoria, puntero null, comportamiento indefinido
- **valgrind memcheck** — Detección de errores de memoria en tiempo de ejecución (hybrid + pure)

#### Proyectos Python
- **ruff** — Linting rápido + ordenación de imports (reemplaza flake8 + isort)
- **ruff-format** — Formateo de código (compatible con black)
- **pylint** — Análisis semántico profundo: código inalcanzable, argumentos incorrectos, atributos faltantes
- **mypy** — Verificación estática de tipos

#### Todos los proyectos
- **commitlint** — Impone el formato [Conventional Commits](https://www.conventionalcommits.org/)
- **detect-secrets** — Bloquea commits con secrets (claves API, tokens, contraseñas)
- Validación YAML
- Detección de archivos grandes (> 1 MB)
- Eliminación de espacios al final de línea
- Corrector de fin de archivo
- Detección de conflictos de fusión

> Si un hook falla, el commit se bloquea hasta que se resuelva el problema. Esto evita que código roto entre al repositorio.

### GitHub Actions

Cada plantilla incluye dos workflows: `ci.yml` (en cada push/PR) y `release.yml` (en tags `v*`).

#### C/C++ Pure & Hybrid
- **Lint**: verificaciones pre-commit (clang-format, clang-tidy, cppcheck, commitlint)
- **Build**: presets CMake Debug + Release
- **Test**: suites GoogleTest via ctest
- **Benchmark**: ejecuta binarios Google Benchmark (si existen en `benchmarks/`)
- **Coverage**: gcov + lcov — informe HTML + resumen en GitHub Actions UI + badge en GitHub Pages
- **Sanitize ASan**: AddressSanitizer + UBSan + LeakSanitizer — errores de memoria y UB
- **Sanitize MSan**: MemorySanitizer (Clang) — lecturas de memoria no inicializada
- **Sanitize TSan**: ThreadSanitizer — data races en código multihilo
- **Valgrind**: `ctest -T memcheck` — análisis detallado de memoria en toda la suite de tests
- **Matrix**: Python 3.10–3.13 (solo hybrid)
- **Security**: Trivy — escaneo CVE (HIGH/CRITICAL, bloquea merge)
- **Docs**: Doxygen (pure) o Doxygen + Sphinx/furo (hybrid) → GitHub Pages en `main`
- **Release**: en tag `v*` — git-cliff genera CHANGELOG, construye artefactos, crea GitHub Release

#### Python Pure
- **Lint**: verificaciones pre-commit (ruff, pylint, mypy, commitlint)
- **Test**: pytest + resumen de cobertura en GitHub Actions UI + comentario en PR
- **Badge de cobertura**: publicado en GitHub Pages en `main`
- **Matrix**: Python 3.10–3.13
- **Security**: Trivy — escaneo CVE (HIGH/CRITICAL, bloquea merge)
- **Docs**: Sphinx + furo → GitHub Pages (`main`) + ReadTheDocs (todas las ramas/tags)
- **Release**: en tag `v*` — git-cliff genera CHANGELOG, construye wheel + sdist, crea GitHub Release

Todos los workflows se ejecutan en **contenedores Arch Linux** para total consistencia con el entorno de desarrollo.

### Dependabot

Un `.github/dependabot.yml` en la raíz de este repositorio mantiene todas las plantillas actualizadas automáticamente. Cubre:

- Versiones de **GitHub Actions** (actions/checkout, upload-artifact, etc.)
- Revisiones de **hooks pre-commit** (clang-format, ruff, mypy, pylint, etc.)

Las actualizaciones se comprueban semanalmente — sin seguimiento manual de versiones.

### Contexto para agentes IA

Cada proyecto generado contiene un archivo `@PROJECT_NAME@.md` — fuente única de verdad con la arquitectura del proyecto, stack tecnológico, instrucciones de build y reglas para agentes IA. `CLAUDE.md`, `QWEN.md` y `AGENTS.md` son enlaces simbólicos a este archivo, por lo que Claude Code, Qwen Code y Kilo Code leen el mismo contexto automáticamente.

---

## Plantillas PlatformIO

### Placas soportadas

| Directorio | Placa | Arquitectura | Wokwi CI |
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

> \* STM32F411: Wokwi no soporta BlackPill directamente — `diagram.json` usa `board-st-nucleo-f411re` (mismo MCU STM32F411, pinout diferente). ESP8266: Wokwi no soportado — solo build.

### Wokwi: Simulación sin hardware

Wokwi permite ejecutar firmware en el navegador o VS Code sin hardware físico.

**Configuración VS Code:**
1. Instalar la extensión **Wokwi Simulator**
2. Activar la licencia (gratuita para proyectos personales) via `Ctrl+Shift+P` → "Wokwi: Request Free License"
3. Abrir `diagram.json` en la raíz del proyecto — el esquema se abre en el editor Wokwi
4. Presionar ▶ para iniciar la simulación

**Configuración Wokwi CI (GitHub Actions):**
1. Obtener un token en [wokwi.com/ci](https://wokwi.com/ci)
2. Agregar a GitHub Secrets: `Settings` → `Secrets and variables` → `Actions` → `New repository secret` → `WOKWI_CLI_TOKEN`
3. La CI ejecutará automáticamente la simulación y verificará la salida Serial

**Esquema `diagram.json`:**
Dibujar el circuito en [wokwi.com](https://wokwi.com), descargar `diagram.json` y reemplazar el archivo en el proyecto. Wokwi CI y la extensión VS Code comparten el mismo archivo.

### Comandos básicos

```bash
pio run                        # Compilar firmware
pio run -t upload              # Compilar y flashear al dispositivo
pio device monitor             # Abrir Serial Monitor
pio device monitor --baud 115200
pio test                       # Ejecutar tests unitarios en el dispositivo
pio run --target size          # Informe de tamaño del firmware
pio check                      # Análisis estático
```

### Selección de framework

Todas las plantillas usan `framework = arduino` por defecto. Cambiar en `platformio.ini`:

```ini
[env:esp32dev]
platform = espressif32
board    = esp32dev
framework = arduino      ; por defecto — rico ecosistema de bibliotecas

; Alternativas (descomentar según necesidad):
; framework = espidf     ; ESP-IDF — control total, SDK nativo Espressif
; framework = arduino    ; puede combinarse con componentes ESP-IDF
```

| Framework | Plataforma | Cuándo usar |
| --- | --- | --- |
| `arduino` | Todos | Máximo de bibliotecas listas, inicio rápido |
| `espidf` | ESP32 | Control total, stack Bluetooth/WiFi, FreeRTOS |
| `arduino` (con ESP-IDF) | ESP32 | Bibliotecas Arduino + componentes ESP-IDF |
| `pico-sdk` | Raspberry Pi Pico | Acceso directo al SDK RP2040 |
| `arduino` | Pico | Compatibilidad con el ecosistema Arduino |

### Flasheo del firmware

El protocolo de carga se define en `platformio.ini`:

```ini
; upload_protocol = esptool     ; ESP32/ESP8266 — USB UART (por defecto)
; upload_protocol = espota      ; ESP32/ESP8266 — OTA (over the air)
; upload_protocol = esp-prog    ; ESP32 — depurador JTAG
; upload_protocol = stlink      ; STM32 — programador ST-Link
; upload_protocol = picotool    ; Raspberry Pi Pico — USB (mantener BOOTSEL)
; upload_protocol = arduino     ; Arduino AVR — via bootloader
; upload_protocol = usbasp      ; Arduino AVR — programador USBasp
```

### CI/CD

- **Lint**: verificaciones pre-commit (clang-format, cppcheck, commitlint)
- **Build**: `pio run` — compilación del firmware
- **Test**: `pio test` (si existe directorio test)
- **Size**: `pio run --target size` — informe de tamaño del firmware
- **Static analysis**: `pio check --fail-on-defect high`
- **Wokwi CI**: simulación del firmware en la nube (excepto ESP8266) — configuración en la sección [Wokwi](#wokwi-simulación-sin-hardware) arriba
- **Release**: en tag `v*` — sube `.elf`/`.hex`/`.bin` a GitHub Release

Los workflows se ejecutan en **contenedores Arch Linux** para total consistencia con el entorno de desarrollo.

---

## Funciones & Uso

### Tests

#### C/C++ (GoogleTest)

```bash
# Compilar y ejecutar todos los tests
cmake --preset linux-debug && cmake --build --preset linux-debug
cd cmake-build-linux-debug && ctest --output-on-failure

# Ejecutar un test específico
ctest -R MyTest --output-on-failure

# Salida detallada
ctest -V
```

Los tests están en `test/`. Cada `*_test.cpp` es recogido automáticamente por CMake.

#### Python (pytest)

```bash
# Ejecutar todos los tests
python -m pytest -v

# Archivo o test específico
python -m pytest tests/test_module.py::test_function -v

# Traceback corto en caso de fallo
python -m pytest -v --tb=short
```

---

### Cobertura de código

#### C++ — lcov

```bash
# Compilar con cobertura
cmake --preset linux-coverage && cmake --build --preset linux-coverage

# Ejecutar tests y generar informe
cd cmake-build-linux-coverage
ctest --output-on-failure
lcov --capture --directory . --output-file coverage.info
lcov --remove coverage.info '/usr/*' '*/libraries/*' '*/test/*' --output-file coverage.info
genhtml coverage.info --output-directory coverage-html

# Abrir informe en el navegador
xdg-open coverage-html/index.html
```

El informe HTML muestra cobertura por archivo, función y línea. Verde = cubierto, rojo = no cubierto.

#### Python — pytest-cov

```bash
# Cobertura con salida en terminal
python -m pytest --cov --cov-report=term

# Informe HTML
python -m pytest --cov --cov-report=html
xdg-open htmlcov/index.html

# Mostrar líneas no cubiertas
python -m pytest --cov --cov-report=term-missing
```

#### Badges y comentarios en PR

Después de un push a `main`, GitHub Actions publica automáticamente un badge de cobertura en GitHub Pages. En cada PR aparece un comentario con el porcentaje de cobertura actual.

---

### Google Benchmark

Google Benchmark mide el rendimiento de funciones individuales con precisión de nanosegundos.

```bash
# Compilar en Release (obligatorio — Debug distorsiona los resultados)
cmake --preset linux-release && cmake --build --preset linux-release

# Ejecutar todos los benchmarks
./cmake-build-linux-release/bench_example  # o el nombre de tu binario

# Filtrar por nombre
./cmake-build-linux-release/bench_example --benchmark_filter=BM_MyFunction

# Salida JSON para análisis posterior
./cmake-build-linux-release/bench_example --benchmark_out=results.json --benchmark_out_format=json

# Comparar dos ejecuciones
benchmark_compare results_before.json results_after.json
```

Ejemplo de salida:
```
Benchmark                Time        CPU      Iterations
--------------------------------------------------------
BM_VectorPushBack       45.2 ns    45.1 ns    15000000
BM_MapInsert           120.5 ns   120.3 ns     5800000
```

Los benchmarks están en `benchmarks/`. Agregar nuevos siguiendo el modelo `bench_example.cpp`.

---

### Sanitizers

Los sanitizers son herramientas basadas en el compilador que detectan errores en tiempo de ejecución: desbordamientos de buffer, data races, fugas de memoria y comportamiento indefinido.

#### ASan + UBSan + LSan — errores de memoria y UB

```bash
cmake --preset linux-asan && cmake --build --preset linux-asan
cd cmake-build-linux-asan && ctest --output-on-failure
```

Qué detecta:
- **ASan** (AddressSanitizer) — acceso fuera de límites, use-after-free, double-free
- **UBSan** (UndefinedBehaviorSanitizer) — desbordamiento de enteros, desplazamiento negativo, desreferencia de puntero null
- **LSan** (LeakSanitizer) — fugas de memoria

#### MSan — memoria no inicializada

```bash
cmake --preset linux-msan && cmake --build --preset linux-msan
cd cmake-build-linux-msan && ctest --output-on-failure
```

Detecta lecturas de memoria no inicializada. **Solo Clang.**

#### TSan — data races

```bash
cmake --preset linux-tsan && cmake --build --preset linux-tsan
cd cmake-build-linux-tsan && ctest --output-on-failure
```

Detecta data races en código multihilo.

> Los sanitizers no se pueden combinar entre sí — cada uno se ejecuta por separado. En CI se ejecutan como jobs paralelos.

---

### Valgrind

Valgrind funciona sin recompilación — analiza un binario Debug ya compilado.

#### Memcheck — errores de memoria

```bash
# Todos los tests via ctest (modo CI y pre-commit)
tools/profiler/run-memcheck.sh

# Binario específico
tools/profiler/run-memcheck.sh my_binary
```

Detecta: acceso fuera de límites, use-after-free, fugas de memoria, llamadas al sistema inválidas.

#### Helgrind — data races

```bash
# Todos los tests
tools/profiler/run-helgrind.sh

# Binario específico
tools/profiler/run-helgrind.sh my_binary
```

Similar a TSan, pero sin recompilación. Más lento, pero funciona en cualquier binario.

#### DRD — data races (alternativa)

```bash
tools/profiler/run-drd.sh          # todos los tests
tools/profiler/run-drd.sh my_binary
```

Menos preciso que Helgrind, pero más rápido.

> **Cuándo usar qué:** Sanitizers — más rápidos, cómodos durante el desarrollo. Valgrind — para verificación final o cuando la recompilación no es posible.

---

### Profiling C++

#### Callgrind — grafo de llamadas y tiempo CPU

```bash
tools/profiler/run-callgrind.sh my_binary
# Resultado: profiles/callgrind.out
```

Visualizar: subir `callgrind.out` a [speedscope.app](https://speedscope.app) — flamegraph interactivo en el navegador.

Muestra: qué funciones consumen más CPU, grafo de llamadas, conteo de instrucciones.

#### Cachegrind — cache misses

```bash
tools/profiler/run-cachegrind.sh my_binary
# Resultado: profiles/cachegrind.out
```

Muestra: conteo de cache misses L1/L2/L3, errores de predicción de ramas. Ayuda a optimizar patrones de acceso a memoria.

#### Massif — uso del heap

```bash
tools/profiler/run-massif.sh my_binary
# Resultado: profiles/massif.out (con informe de texto en stdout)
```

Muestra: crecimiento y decrecimiento del heap en el tiempo, picos de alocaciones.

#### perf — profiling del sistema

```bash
tools/profiler/run-perf.sh my_binary
```

Sampling profiler rápido de Linux. Muestra puntos calientes con overhead mínimo.

---

### Profiling Python (hybrid + python/pure)

#### cProfile — estadísticas de llamadas a funciones

```bash
tools/profiler/profile-python.sh
# Resultado: profiles/profile.prof — visualizar: snakeviz profiles/profile.prof
```

Muestra: número de llamadas por función, tiempo total y promedio. Visualización interactiva con snakeviz en el navegador.

#### tracemalloc — uso de memoria

```bash
tools/profiler/profile-memory.sh
# Resultado: profiles/memory_stats.txt
```

Muestra: top-10 de alocaciones de memoria por línea.

#### py-spy — sampling profiler sin cambios en el código

```bash
tools/profiler/profile-spy.sh
# Resultado: profiles/pyspy.svg — abrir en el navegador
```

Funciona sin cambios en el código, overhead mínimo. Flamegraph SVG: abrir en el navegador, hacer clic en bloques para hacer zoom.

---

### Documentación

#### C/C++ Pure — Doxygen

```bash
# Generar documentación
doxygen Doxyfile

# Abrir en el navegador
xdg-open docs/html/index.html
```

Documentar el código con comentarios:
```cpp
/// @brief Calcula la suma de dos números
/// @param a primer operando
/// @param b segundo operando
/// @return suma de a y b
int add(int a, int b);
```

#### Hybrid & Python Pure — Sphinx

```bash
# Construir documentación
cd docs && make html

# Abrir en el navegador
xdg-open docs/_build/html/index.html
```

La plantilla hybrid usa **Breathe** para importar la API C++ desde Doxygen en Sphinx — la documentación C++ y Python se construye en un sitio unificado con el tema **furo** (soporte de modo oscuro).

#### Publicación

- **GitHub Pages** — todas las plantillas: automáticamente en cada push a `main`
- **ReadTheDocs** — solo Hybrid y Python Pure: automáticamente en cada push (todas las ramas y tags, con versionado)

Para configurar ReadTheDocs (Hybrid / Python Pure):
1. Conectar el repositorio en [readthedocs.org](https://readthedocs.org)
2. ReadTheDocs detectará `.readthedocs.yaml` automáticamente y construirá en cada push

---

## Licencia

**MIT License** — Copyright © 2025–2026 Vais Vaisov

Libre de usar, modificar y distribuir.

---

## Contribuir

¡Las contribuciones son bienvenidas! Leer [CONTRIBUTING.md](.github/CONTRIBUTING.md) y no dudes en abrir un issue o un Pull Request.

---

<div align="center">

*IT Project Templates — de cero al código en minutos*

</div>
