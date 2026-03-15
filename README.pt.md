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
- ⚙️ **CI/CD incluso**: workflows do GitHub Actions para linting, build, testes, coverage, documentação e releases
- 📝 **Conventional Commits**: commitlint verifica o formato das mensagens de commit
- 🌍 **Multiplataforma**: o mesmo script funciona em Linux, macOS e Windows (via WSL2)

---

## Templates disponíveis

### C/C++ (`c-cpp/`)

| Template | Descrição |
| --- | --- |
| `pure` | C/C++ com CMake, Ninja, GoogleTest, Doxygen, coverage via lcov |
| `hybrid` | C/C++ + Python/Cython — ambas as linguagens em um só projeto, Sphinx + ReadTheDocs |
| `platformio/` | Desenvolvimento embarcado: Arduino, ESP32, STM32 |

### Python (`python/`)

| Template | Descrição |
| --- | --- |
| `pure` | Python com pytest, ruff, pylint, mypy, Sphinx + ReadTheDocs |

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

### Windows (WSL2)

No Windows, todo o ecossistema funciona através do WSL2. Instale o WSL2 e use o mesmo script:

```bash
# Clonar no home do WSL2
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Adicionar ao PATH (uma única vez, no WSL2)
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # ou ~/.bashrc
source ~/.zshrc

# Criar um novo projeto (a partir do WSL2)
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Após criar o projeto

1. Abrir a pasta do projeto no VS Code
2. Clicar em **"Reopen in Container"** (ou `Ctrl+Shift+P` → "Dev Containers: Reopen in Container")
3. No primeiro lançamento, o container é construído automaticamente
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

---

## Instalação

### 1. Clonar o repositório

```bash
# Linux / macOS / Windows (WSL2)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates
```

### 2. Adicionar ao PATH

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

> **Nota:** `new-project.sh` já é executável após clonar. Se não for: `chmod +x new-project.sh`

### 3. Pré-requisitos

| Ferramenta | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | Obrigatório — [docker.com](https://www.docker.com/) | Obrigatório — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **WSL2** | — | Obrigatório — [Guia de instalação WSL2](https://learn.microsoft.com/pt-br/windows/wsl/install) + extensão **WSL** no VS Code |
| **VS Code** | Obrigatório — [code.visualstudio.com](https://code.visualstudio.com/) | Obrigatório |
| **Extensão Dev Containers** | Obrigatório — instalar pelo VS Code | Obrigatório (abrir projeto pelo WSL2) |
| **GitHub CLI** | Recomendado | Recomendado (para Windows — no WSL2) |
| **uv** | Para templates hybrid/python — [astral.sh/uv](https://astral.sh/uv) | Para templates hybrid/python — instalar no WSL2 |
| **Git** | Obrigatório | Obrigatório — instalar no WSL2 |

> **Dica GitHub CLI:** autentique-se uma vez no host (para Windows — no WSL2) com `gh auth login`. O container monta `~/.config/gh` do host — sem necessidade de re-autenticar dentro dos Dev Containers.

---

## Estrutura do repositório

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # Atualização automática de dependências (Actions + pre-commit)
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
│   └── platformio/             # Templates embarcados
│       ├── .devcontainer/      # Devcontainer compartilhado (PlatformIO + Clang)
│       ├── .vscode/            # Configuração VS Code compartilhada
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
├── meta-template/              # Base para criar novos templates
├── new-project.sh              # Script Linux / macOS / Windows (WSL2)
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
- GDB, valgrind
- cppcheck, lcov
- pre-commit

### Containers C/C++ híbridos

Tudo do C/C++, mais:

- Python 3, pip, uv, virtualenv
- Cython, NumPy
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo, breathe (documentação)

### Containers Python

- Python 3, pip, uv, virtualenv
- pytest, pytest-cov
- ruff, pylint, mypy
- Sphinx, furo
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
- **Wokwi Simulator** — Simulador interativo de Arduino/ESP32/STM32 diretamente no VS Code
- **C/C++ Tools** — Suporte a código para microcontroladores

---

## Qualidade de código & CI/CD

### Hooks pre-commit

Os hooks são executados automaticamente antes de cada commit e são instalados ao iniciar o Dev Container (`postCreateCommand`) — tanto os hooks normais quanto o hook de mensagem de commit.

#### Projetos C/C++
- **clang-format** — Formatação automática de código (estilo LLVM)
- **clang-tidy** — Análise estática para bugs e problemas de estilo
- **cppcheck** — Vazamentos de memória, verificações de null pointer, comportamento indefinido
- **valgrind memcheck** — Detecção de erros de memória em tempo de execução (hybrid + pure)

#### Projetos Python
- **ruff** — Linting rápido + ordenação de imports (substitui flake8 + isort)
- **ruff-format** — Formatação de código (compatível com black)
- **pylint** — Análise semântica profunda: código inacessível, número errado de argumentos, acesso a atributos inexistentes
- **mypy** — Verificação estática de tipos

#### Todos os projetos
- **commitlint** — Verificação do formato das mensagens de commit segundo [Conventional Commits](https://www.conventionalcommits.org/)
- **detect-secrets** — Bloqueia commits com segredos (chaves API, tokens, senhas)
- Validação YAML
- Detecção de arquivos grandes (> 1 MB)
- Remoção de espaços no final das linhas
- Correção de fim de arquivo
- Detecção de conflitos de merge

> Se um hook falhar, o commit é bloqueado até o problema ser corrigido. Isso impede que código quebrado entre no repositório.

### GitHub Actions

Cada template inclui dois workflows: `ci.yml` (executado a cada push/PR) e `release.yml` (executado no tag `v*`).

#### C/C++ Pure & Hybrid
- **Lint**: verificações pre-commit (clang-format, clang-tidy, cppcheck, commitlint)
- **Build**: builds CMake Debug + Release com presets
- **Test**: testes GoogleTest via ctest
- **Coverage**: gcov + lcov — relatório HTML + resumo no GitHub Actions UI + badge de cobertura no GitHub Pages
- **Matrix**: Python 3.10–3.13 (apenas hybrid)
- **Security**: Trivy — scan CVE (HIGH/CRITICAL, bloqueia merge)
- **Docs**: Doxygen (pure) ou Doxygen + Sphinx/furo (hybrid) → GitHub Pages no `main`
- **Release**: no tag `v*` — git-cliff gera CHANGELOG, constrói artefatos, cria GitHub Release

#### Python Pure
- **Lint**: verificações pre-commit (ruff, pylint, mypy, commitlint)
- **Test**: pytest + resumo de cobertura no GitHub Actions UI + comentário de cobertura no PR
- **Badge de cobertura**: publicado no GitHub Pages no push para `main`
- **Matrix**: Python 3.10–3.13
- **Security**: Trivy — scan CVE (HIGH/CRITICAL, bloqueia merge)
- **Docs**: Sphinx + furo → GitHub Pages (`main`) + ReadTheDocs (todos os branches/tags)
- **Release**: no tag `v*` — git-cliff gera CHANGELOG, constrói wheel + sdist, cria GitHub Release

#### PlatformIO
- **Lint**: verificações pre-commit (clang-format, cppcheck, commitlint)
- **Build**: `pio run` — compilação do firmware
- **Test**: `pio test` (se o diretório test existir)
- **Size**: `pio run --target size` — relatório de tamanho do firmware
- **Static analysis**: `pio check --fail-on-defect high`
- **Wokwi CI**: simulação de firmware na nuvem — verifica saída Serial sem hardware real (requer `WOKWI_CLI_TOKEN` no GitHub Secrets, 50 min/mês grátis)
- **Release**: no tag `v*` — faz upload de `.elf`/`.hex`/`.bin` no GitHub Release

> **Wokwi CI e a extensão VS Code** usam o mesmo `diagram.json` — o esquema desenhado no [wokwi.com](https://wokwi.com). Mais detalhes em `@PROJECT_NAME@.md` do projeto gerado.
>
> **Nota para STM32F411**: O Wokwi não suporta BlackPill diretamente — `diagram.json` usa `board-st-nucleo-f411re` (mesmo MCU STM32F411, pinout diferente). Ajuste o esquema ao hardware real.

Todos os workflows rodam em **containers Arch Linux** para consistência com o ambiente de desenvolvimento.

### Dependabot

Na raiz do repositório está `.github/dependabot.yml` — ele monitora automaticamente a atualidade das versões em todos os templates e propõe atualizações via PR. Cobre:

- **GitHub Actions** — versões de actions/checkout, upload-artifact e outros
- **pre-commit hooks** — revisões de clang-format, ruff, mypy, pylint e outros

As atualizações são verificadas semanalmente — sem rastreamento manual de versões.

### Contexto IA para agentes

Cada projeto gerado contém o arquivo `@PROJECT_NAME@.md` — fonte única de verdade com descrição da arquitetura, stack, instruções de build e regras para agentes IA. `CLAUDE.md`, `QWEN.md` e `AGENTS.md` são symlinks para esse arquivo, então Claude Code, Qwen Code e Kilo Code leem automaticamente o mesmo contexto.

---

## Documentação

### C/C++ Pure

A documentação é gerada via **Doxygen** e publicada automaticamente no **GitHub Pages** a cada push no `main`.

### C/C++ Hybrid & Python Pure

A documentação é construída via **Sphinx** com o tema **furo** (suporte ao modo escuro) e publicada em **dois lugares**:
- **GitHub Pages** — automaticamente a cada push no `main`
- **ReadTheDocs** — automaticamente a cada push (todos os branches/tags, com versionamento)

O template hybrid também usa **Breathe** para importar a API C++ do Doxygen para o Sphinx.

Para conectar o ReadTheDocs:
1. Conectar o repositório em [readthedocs.org](https://readthedocs.org)
2. O ReadTheDocs detectará automaticamente o `.readthedocs.yaml` e começará a construir a cada push

---

## Licença

**Licença MIT** — Copyright © 2025–2026 Vais Vaisov

Livre para usar, modificar e distribuir.

---

## Contribuindo

Contribuições são bem-vindas! Leia [CONTRIBUTING.md](.github/CONTRIBUTING.md) e sinta-se à vontade para abrir uma issue ou enviar um Pull Request.

---

<div align="center">

*IT Project Templates — do zero ao código em minutos*

</div>
