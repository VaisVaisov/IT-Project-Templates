# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**Templates de projeto prontos para uso com VS Code Dev Containers**

*Base Arch Linux · Toolchain Clang · Agentes de IA pré-instalados*

[Templates](#templates-disponíveis) • [Início rápido](#início-rápido) • [Instalação](#instalação) • [Dev Containers](#funcionalidades-dev-container) • [CI/CD](#qualidade-de-código--cicd)

**[🇬🇧 English](README.md) · [🇷🇺 Русский](README.ru.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## O que é isso?

Uma coleção de templates de projeto desenvolvidos para te levar do zero ao código em minutos. Cada template inclui um **VS Code Dev Container** totalmente configurado com Arch Linux — o mesmo ambiente em qualquer máquina, independentemente do sistema operacional do host.

### Por que usar isso em vez de um projeto vazio?

- 🚀 **Zero tempo de configuração**: abra no VS Code, clique em "Reopen in Container" e comece a codar
- 🤖 **Pronto para IA**: Claude Code, Qwen Code e Kilo Code CLI pré-instalados em cada container
- 🔒 **Controle de qualidade**: hooks pre-commit detectam problemas antes de chegarem ao repositório
- ⚙️ **CI/CD incluso**: workflows do GitHub Actions para build, testes e documentação
- 🌍 **Multiplataforma**: o mesmo script funciona em Linux, macOS e Windows

---

## Templates disponíveis

### C/C++ (`c-cpp/`)

| Template | Descrição |
| --- | --- |
| `pure` | C/C++ com CMake, Ninja, GoogleTest, Doxygen |
| `hybrid` | C/C++ + Python/Cython — ambas as linguagens em um só projeto |
| `platformio/` | Desenvolvimento embarcado para Arduino, ESP32, STM32 |

### Python (`python/`)

| Template | Descrição |
| --- | --- |
| `pure` | Python com pytest, black, isort, pylint, mypy, flake8 |

### Dispositivos PlatformIO (`c-cpp/platformio/`)

| Dispositivo | Placa |
| --- | --- |
| `arduino-nano` | ATmega328P |
| `arduino-pro-micro` | ATmega32U4 |
| `esp32-devkit` | ESP32 DevKit |
| `stm32f411` | STM32F411 BlackPill |

---

## Início rápido

### Linux / macOS

```bash
# Clonar em qualquer lugar
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Adicionar ao PATH (uma única vez)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # ou ~/.bashrc
source ~/.zshrc

# Criar um novo projeto
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (PowerShell)

```powershell
# Clonar em qualquer lugar
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates

# Criar um novo projeto
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Pure C:\Projects\my_cpp_app
.\IT-Project-Templates\new-project-script.ps1 -Python -Pure C:\Projects\my_python_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Hybrid C:\Projects\my_hybrid_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -PlatformIO -Esp32Devkit C:\Projects\sensor_node
```

Ou use o lançador batch — clique duplo ou execute pelo cmd:

```cmd
new-project-shell.bat -CCpp -Pure C:\Projects\my_cpp_app
```

### Após criar o projeto

1. Abrir a pasta do projeto no VS Code
2. Clicar em **"Reopen in Container"** (ou `Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. No primeiro lançamento, aguardar o container ser construído
4. Os hooks pre-commit são instalados automaticamente — bora codar!

---

## Referência de uso

### Flags Linux / macOS

```
new-project [linguagem] [tipo] [dispositivo] <caminho>

Linguagem:
  --c-cpp            Projeto C/C++
  --python           Projeto Python

Tipo:
  --pure             C/C++ ou Python puro
  --hybrid           Híbrido C/C++ + Python/Cython  (apenas --c-cpp)
  --platformio       Desenvolvimento embarcado        (apenas --c-cpp)

Dispositivos PlatformIO:
  --arduino-nano
  --arduino-pro-micro
  --esp32-devkit
  --stm32f411
```

### Flags Windows (PowerShell)

```
new-project-script.ps1 [linguagem] [tipo] [dispositivo] <caminho>

Linguagem:
  -CCpp              Projeto C/C++
  -Python            Projeto Python

Tipo:
  -Pure              C/C++ ou Python puro
  -Hybrid            Híbrido C/C++ + Python/Cython  (apenas -CCpp)
  -PlatformIO        Desenvolvimento embarcado        (apenas -CCpp)

Dispositivos PlatformIO:
  -ArduinoNano
  -ArduinoProMicro
  -Esp32Devkit
  -Stm32f411
```

---

## Instalação

### 1. Clonar o repositório

```bash
# Linux / macOS
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Windows (PowerShell)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates
```

### 2. Adicionar ao PATH

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

**Windows — PATH do sistema (permanente):**
```powershell
[Environment]::SetEnvironmentVariable(
    "Path",
    "$env:Path;$env:USERPROFILE\IT-Project-Templates",
    "User"
)
```

> **Nota (Linux/macOS):** `new-project.sh` já é executável após clonar. Se não for: `chmod +x new-project.sh`

### 3. Pré-requisitos

| Ferramenta | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Obrigatório — [docker.com](https://www.docker.com/) | Obrigatório — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **VS Code** | Obrigatório — [code.visualstudio.com](https://code.visualstudio.com/) | Obrigatório |
| **Extensão Dev Containers** | Obrigatório — instalar pelo VS Code | Obrigatório |
| **GitHub CLI** | Recomendado — `gh auth login` | Recomendado |
| **Python** | Para templates hybrid/python | Para templates hybrid/python |
| **Git** | Obrigatório | Obrigatório |

> **Dica GitHub CLI:** autentique-se uma vez no host com `gh auth login`. O container monta `~/.config/gh` do host — sem necessidade de re-autenticar dentro dos Dev Containers.

---

## Estrutura do projeto

```
IT-Project-Templates/
├── .devcontainer/              # Container base (Arch + Zsh + Agentes IA)
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
│   └── platformio/             # Templates embarcados
│       ├── .devcontainer/      # Devcontainer compartilhado (PlatformIO + Clang)
│       ├── .vscode/            # Configuração VS Code compartilhada
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       └── stm32f411/
├── python/
│   └── pure/                   # Template Python puro
│       ├── .devcontainer/      # Python + pytest + linters
│       ├── .vscode/
│       ├── .github/workflows/
│       └── ...
├── meta-template/              # Base para criar novos templates
├── new-project.sh              # Script Linux / macOS
├── new-project-script.ps1      # Script Windows PowerShell
├── new-project-shell.bat       # Lançador batch Windows
├── LICENSE
└── README.md
```

---

## Funcionalidades Dev Container

Cada container é construído sobre **Arch Linux (mais recente)** e inclui:

- **Shell**: Zsh com Oh My Zsh + Powerlevel10k
- **Editor**: Neovim
- **VCS**: Git, git-delta, GitHub CLI
- **Agentes IA**: Claude Code, Qwen Code, Kilo Code CLI (do AUR) — todos disponíveis como ferramentas CLI
- **Docker**: Docker + Docker Buildx + Lazydocker (para executar containers dentro de containers)
- **Auth GitHub**: `~/.config/gh` montado do host — sem necessidade de re-autenticar

### Containers C/C++

- Clang, LLD, LLDB, compiler-rt
- CMake, Ninja
- GDB
- cppcheck (análise estática)
- pre-commit

### Containers C/C++ híbridos

Tudo do C/C++, mais:

- Python 3, pip, virtualenv
- Cython, NumPy
- pytest, black, isort, pylint, mypy
- Sphinx (documentação)

### Containers Python

- Python 3, pip, virtualenv
- pytest, black, isort, pylint, mypy, flake8
- pre-commit

### Containers PlatformIO

- PlatformIO Core + regras udev
- Clang, cppcheck (para análise de código)
- Python 3, pip
- pre-commit
- Acesso a dispositivos USB (container roda com `--privileged`)

---

## Extensões VS Code

Todos os templates instalam extensões automaticamente ao abrir em um Dev Container e as exibem como recomendações sem Docker.

### Comuns (todos os templates)

| Categoria | Extensão | Propósito |
| --- | --- | --- |
| **IA** | Claude Code | Agente IA (CLI + VS Code) |
| | TONGYI Lingma | Assistente IA e autocompletar código |
| | Kilo Code | Agente IA com suporte a 400+ modelos |
| **Git** | GitLens | Funções avançadas do Git (blame, histórico) |
| | Git Graph | Histórico visual de commits |
| **Qualidade** | Better Comments | Comentários TODO/FIXME/NOTE coloridos |
| | Code Spell Checker | Verificação ortográfica em código e comentários |
| **Docker** | Docker | Gerenciamento de containers |
| **Markdown** | Markdown All in One | Suporte completo a Markdown |
| | Markdown Converter | Exportar para PDF/HTML/Word |
| **Formatos** | YAML (Red Hat) | Suporte a YAML |
| | JSON (Meezilla) | Edição JSON aprimorada |

### Templates C/C++

- **C/C++ Tools** — IntelliSense e depuração
- **clangd** — Análise de código e navegação avançadas
- **Code Runner** — Execução rápida de código

### Templates Python

- **Python** + **Pylance** — Suporte base e servidor de linguagem
- **debugpy** — Depurador Python
- **Python Envs** — Gerenciamento de ambientes virtuais
- **autodocstring** — Geração automática de docstrings
- **Django** + **Jinja** — Suporte a frameworks (Python puro)

### Templates híbridos

Todas as extensões de C/C++ e Python combinadas.

### Templates PlatformIO

- **PlatformIO IDE** — Plataforma de desenvolvimento embarcado
- **Wokwi Simulator** — Simulador Arduino/ESP32
- **C/C++ Tools** — Suporte a código para microcontroladores

---

## Qualidade de código & CI/CD

### Hooks pre-commit

Os hooks são executados automaticamente antes de cada commit e são instalados ao iniciar o Dev Container (`postCreateCommand`).

#### Projetos C/C++
- **clang-format** — Formatação automática de código (estilo LLVM, limite de 100 caracteres)
- **clang-tidy** — Análise estática para bugs e problemas de estilo
- **cppcheck** — Vazamentos de memória, verificações de null pointer, comportamento indefinido

#### Projetos Python
- **black** — Formatação de código (conforme PEP 8)
- **isort** — Ordenação de imports
- **flake8** — Linting de sintaxe e estilo
- **mypy** — Verificação estática de tipos
- **pylint** — Análise de qualidade do código

#### Todos os projetos
- Validação YAML
- Detecção de arquivos grandes (> 1 MB)
- Remoção de espaços no final das linhas
- Correção de fim de arquivo
- Detecção de conflitos de merge

> Se um hook falhar, o commit é bloqueado até o problema ser corrigido. Isso impede que código quebrado entre no repositório.

### GitHub Actions

Cada template inclui um workflow CI em `.github/workflows/ci.yml`.

#### C/C++ Pure & Hybrid
- Build com CMake + Ninja
- Executar suites GoogleTest
- Gerar documentação Doxygen
- Publicar docs automaticamente no GitHub Pages (apenas branch main)

#### Python Pure
- Executar suite pytest
- Verificações de qualidade de código (black, isort, flake8, mypy)
- Relatórios de cobertura de testes

#### PlatformIO
- Compilar firmware para o dispositivo alvo
- Verificar limites de tamanho do firmware

Todos os workflows rodam em **containers Arch Linux** para consistência com o ambiente de desenvolvimento.

---

## Licença

**Licença MIT** — Copyright © 2025–2026 Vais Vaisov

Livre para usar, modificar e distribuir.

---

## Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma issue ou enviar um Pull Request.

---

<div align="center">

*IT Project Templates — do zero ao código em minutos*

</div>
