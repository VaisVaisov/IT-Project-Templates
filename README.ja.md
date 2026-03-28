# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**VS Code Dev Containers 対応のすぐに使えるプロジェクトテンプレート**

*Arch Linux · Clang ツールチェーン · AI コーディングエージェントプリインストール済み*

[テンプレート](#利用可能なテンプレート) • [クイックスタート](#クイックスタート) • [インストール](#インストール) • [Dev Containers](#dev-container-機能) • [CI/CD](#コード品質--cicd) • [PlatformIO](#platformio-テンプレート) • [機能](#機能と使い方)

**[🇷🇺 Русский](README.ru.md) · [🇬🇧 English](README.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## これは何？

数分で開発を始められるプロジェクトテンプレートのコレクションです。各テンプレートは Arch Linux ベースの完全に設定済みの **VS Code Dev Container** を同梱しています — ホスト OS に関わらず、どのマシンでも同じ環境が手に入ります。

### なぜ使うのか？

- 🚀 **ゼロセットアップ**：VS Code で開いて「Reopen in Container」をクリック — すぐにコーディング開始
- 🤖 **AI 対応**：Claude Code、Qwen Code、Kilo Code がすべてのコンテナにプリインストール
- 🔒 **品質ゲート**：pre-commit フックがリポジトリに到達する前に問題を検出
- ⚙️ **CI/CD 内蔵**：GitHub Actions でリント、ビルド、テスト、カバレッジ、ドキュメント、リリースに対応
- 📝 **Conventional Commits**：commitlint がコミットメッセージのフォーマットを強制
- 🌍 **クロスプラットフォーム**：Linux、macOS、Windows（WSL2 経由）で動作する単一スクリプト

---

## 利用可能なテンプレート

### C/C++ (`c-cpp/`)

| テンプレート | 説明 |
| --- | --- |
| `pure` | C/C++（CMake、Ninja、GoogleTest、Google Benchmark、Doxygen、lcov カバレッジ） |
| `hybrid` | C/C++ + Python/Cython — 1つのプロジェクトに両言語、Sphinx + ReadTheDocs |
| `platformio/` | 組み込み開発（Arduino、ESP32、ESP8266、Pico、STM32） |

### Python (`python/`)

| テンプレート | 説明 |
| --- | --- |
| `pure` | Python（pytest、ruff、pylint、mypy、Sphinx + ReadTheDocs） |

### PlatformIO デバイス (`c-cpp/platformio/`)

| ディレクトリ | ボード | アーキテクチャ | Wokwi CI |
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

> \* STM32F411：Wokwi は BlackPill を直接サポートしていないため `board-st-nucleo-f411re`（同じ MCU、異なるピン配置）を使用 — [PlatformIO](#platformio-テンプレート) セクション参照。ESP8266：Wokwi 非対応 — ビルドのみ。

---

## クイックスタート

### Linux / macOS

```bash
# どこにでもクローン
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# PATH に追加（一度だけ）
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # または ~/.bashrc
source ~/.zshrc

# 新しいプロジェクトを作成
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (WSL2)

Windows では、エコシステム全体が WSL2 を通じて動作します。WSL2 をインストールして同じスクリプトを使用：

```bash
# WSL2 ホームにクローン
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# PATH に追加（WSL2 内で一度だけ）
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # または ~/.bashrc
source ~/.zshrc

# 新しいプロジェクトを作成（WSL2 から）
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### プロジェクト作成後

1. VS Code でプロジェクトフォルダを開く
2. **「Reopen in Container」** をクリック（または `Ctrl+Shift+P` → 「Dev Containers: Reopen in Container」）
3. 初回起動時にコンテナが自動的にビルドされる
4. pre-commit フックが自動インストール — コーディング開始！

---

## 使用リファレンス

```
new-project [--help] <言語> <タイプ> [デバイス] <パス>

言語：
  --c-cpp            C/C++ プロジェクト
  --python           Python プロジェクト

タイプ：
  --pure             純粋な C/C++ または Python
  --hybrid           ハイブリッド C/C++ + Python/Cython  （--c-cpp のみ）
  --platformio       組み込み開発                         （--c-cpp のみ）

PlatformIO デバイス（Arduino）：
  --arduino-nano          Arduino Nano (ATmega328P)
  --arduino-pro-micro     Arduino Pro Micro (ATmega32U4, USB HID)

PlatformIO デバイス（ESP32）：
  --esp32-devkit          ESP32 DevKit V1 (Xtensa LX6, WiFi + BT)
  --esp32-s2-saola        ESP32-S2 Saola (Xtensa LX7, USB OTG)
  --esp32-s3-devkitc      ESP32-S3 DevKitC (Xtensa LX7, AI+IoT)
  --esp32-c3-devkitm      ESP32-C3 DevKitM (RISC-V, WiFi + BT)
  --esp32-c6-devkitc      ESP32-C6 DevKitC (RISC-V, WiFi 6 + Zigbee)
  --esp32-h2-devkitm      ESP32-H2 DevKitM (RISC-V, Zigbee + Thread)

PlatformIO デバイス（その他）：
  --esp8266-wemos-d1-mini Wemos D1 Mini (ESP8266, WiFi) — ビルドのみ、Wokwi なし
  --rpi-pico              Raspberry Pi Pico (RP2040, デュアルコア ARM Cortex-M0+)
  --stm32f411-blackpill   STM32F411 Black Pill (Cortex-M4, 100 MHz)
  --stm32f103-bluepill    STM32F103 Blue Pill (Cortex-M3, 72 MHz)

オプション：
  --help, -h         ヘルプを表示して終了
```

---

## インストール

### 1. リポジトリをクローン

```bash
# Linux / macOS / Windows (WSL2)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates
```

### 2. PATH に追加

**Bash：**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**Zsh：**
```bash
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

> **注意：** クローン後 `new-project.sh` はすでに実行可能です。そうでない場合：`chmod +x new-project.sh`

### 3. 前提条件

| ツール | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | 必須 — [docker.com](https://www.docker.com/) | 必須 — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **WSL2** | — | 必須 — [WSL2 インストールガイド](https://learn.microsoft.com/ja-jp/windows/wsl/install) + VS Code の **WSL** 拡張機能 |
| **VS Code** | 必須 — [code.visualstudio.com](https://code.visualstudio.com/) | 必須 |
| **Dev Containers 拡張機能** | 必須 — VS Code からインストール | 必須（WSL2 からプロジェクトを開く） |
| **GitHub CLI** | 推奨 | 推奨（Windows の場合は WSL2 内で） |
| **uv** | hybrid/python テンプレート用 — [astral.sh/uv](https://astral.sh/uv) | hybrid/python テンプレート用 — WSL2 内にインストール |
| **Git** | 必須 | 必須 — WSL2 内にインストール |

> **GitHub CLI のヒント：** ホスト上（Windows の場合は WSL2 内）で `gh auth login` を一度実行。コンテナはホストの `~/.config/gh` をマウントするため、Dev Container 内で再認証は不要です。

---

## プロジェクト構造

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # 依存関係の自動更新（Actions + pre-commit）
├── c-cpp/
│   ├── pure/                   # 純粋な C/C++ テンプレート
│   │   ├── .devcontainer/      # Clang + CMake + Ninja + GDB + lcov + valgrind
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Google Benchmark サンプル
│   │   ├── tools/profiler/     # Valgrind + perf スクリプト
│   │   └── ...
│   ├── hybrid/                 # C/C++ + Python/Cython テンプレート
│   │   ├── .devcontainer/      # Clang + Python + Cython + ruff + pylint
│   │   ├── .github/
│   │   │   ├── workflows/      # ci.yml + release.yml
│   │   │   └── ISSUE_TEMPLATE/
│   │   ├── .vscode/
│   │   ├── benchmarks/         # Google Benchmark サンプル
│   │   ├── tools/profiler/     # Valgrind + perf + Python プロファイラ
│   │   └── ...
│   └── platformio/             # 組み込みテンプレート
│       ├── .devcontainer/      # 共有 devcontainer（PlatformIO + Clang）
│       ├── .vscode/            # 共有 VS Code 設定
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
│   └── pure/                   # 純粋な Python テンプレート
│       ├── .devcontainer/      # Python + ruff + pylint + mypy
│       ├── .github/
│       │   ├── workflows/      # ci.yml + release.yml
│       │   └── ISSUE_TEMPLATE/
│       ├── .vscode/
│       ├── tools/profiler/     # Python プロファイラ
│       └── ...
├── meta-template/              # 新しいテンプレートを作成するためのベース
├── new-project.sh              # Linux / macOS / Windows (WSL2) スクリプト
├── LICENSE
└── README.md
```

---

## Dev Container 機能

すべてのコンテナは **Arch Linux (latest)** 上に構築され、以下を含みます：

- **シェル**：Zsh + Oh My Zsh + Powerlevel10k
- **エディタ**：Neovim
- **VCS**：Git、git-delta、GitHub CLI
- **AI エージェント**：Claude Code、Qwen Code、Kilo Code CLI（AUR から）— すべて CLI ツールとして利用可能
- **Docker**：Docker + Docker Buildx + Lazydocker（コンテナ内でコンテナを実行）
- **GitHub 認証**：ホストの `~/.config/gh` をマウント — 再認証不要

### C/C++ コンテナ

- Clang、LLD、LLDB、compiler-rt
- CMake、Ninja
- GDB、valgrind
- cppcheck、lcov
- pre-commit

### Hybrid コンテナ（C/C++ + Python）

C/C++ のすべてに加えて：

- Python 3、pip、uv、virtualenv
- Cython、NumPy
- pytest、pytest-cov
- ruff、pylint、mypy
- Sphinx、furo、breathe（ドキュメント）
- py-spy、memory-profiler（Python プロファイリング）

### Python コンテナ

- Python 3、pip、uv、virtualenv
- pytest、pytest-cov
- ruff、pylint、mypy
- Sphinx、furo
- pre-commit

### PlatformIO コンテナ

- PlatformIO Core + udev ルール
- Clang、cppcheck（静的解析）
- Python 3、pip
- pre-commit
- USB デバイスアクセス（コンテナは `--privileged` で実行）

---

## VS Code 拡張機能

すべてのテンプレートは Dev Container で開いたときに拡張機能を自動インストールし、Docker なしで開いたときは推奨として表示します。

### 共通（すべてのテンプレート）

| カテゴリ | 拡張機能 | 目的 |
| --- | --- | --- |
| **AI** | Claude Code | AI エージェント（CLI + VS Code） |
| | TONGYI Lingma | AI アシスタントとコード補完 |
| | Kilo Code | 400+ モデル対応の AI エージェント |
| **Git** | GitLens | 高度な Git 機能（blame、履歴） |
| | Git Graph | ビジュアルコミットグラフ |
| **コード品質** | Better Comments | カラフルな TODO/FIXME/NOTE コメント |
| | Code Spell Checker | コードとコメントのスペルチェック |
| **Docker** | Docker | コンテナ管理 |
| **Markdown** | Markdown All in One | 完全な Markdown サポート |
| | Markdown Converter | PDF/HTML/Word へのエクスポート |
| **フォーマット** | YAML (Red Hat) | YAML サポート |
| | JSON (Meezilla) | 拡張 JSON 編集 |

### C/C++ テンプレート

- **C/C++ Tools** — IntelliSense とデバッグ
- **clangd** — 高度なコード解析とナビゲーション
- **Code Runner** — クイックコード実行

### Python テンプレート

- **Python** + **Pylance** — コアサポートと言語サーバー
- **debugpy** — Python デバッガ
- **Python Envs** — 仮想環境管理
- **autodocstring** — docstring 自動生成
- **Django** + **Jinja** — フレームワークサポート（Pure Python）

### Hybrid テンプレート

C/C++ と Python のすべての拡張機能を組み合わせたもの。

### PlatformIO テンプレート

- **PlatformIO IDE** — 組み込み開発プラットフォーム
- **Wokwi Simulator** — VS Code 内で直接使える Arduino/ESP32/STM32 インタラクティブシミュレータ
- **C/C++ Tools** — マイコンコードサポート

---

## コード品質 & CI/CD

### Pre-commit フック

フックはコミット前に自動実行されます。Dev Container 起動時にインストールされます（`postCreateCommand`）。

#### C/C++ プロジェクト
- **clang-format** — 自動コードフォーマット（LLVM スタイル）
- **clang-tidy** — バグとスタイル問題の静的解析
- **cppcheck** — メモリリーク、ヌルポインタ、未定義動作
- **valgrind memcheck** — 実行時メモリエラー検出（hybrid + pure）

#### Python プロジェクト
- **ruff** — 高速リンティング + import ソート（flake8 + isort の代替）
- **ruff-format** — コードフォーマット（black 互換）
- **pylint** — 深い意味解析：到達不能コード、引数数の誤り、存在しない属性
- **mypy** — 静的型チェック

#### すべてのプロジェクト
- **commitlint** — [Conventional Commits](https://www.conventionalcommits.org/) フォーマットを強制
- **detect-secrets** — シークレットを含むコミットをブロック（API キー、トークン、パスワード）
- YAML 検証
- 大きなファイルの検出（> 1 MB）
- 末尾の空白を削除
- ファイル末尾の修正
- マージコンフリクトの検出

> フックが失敗すると、問題が解決されるまでコミットがブロックされます。これにより壊れたコードがリポジトリに入るのを防ぎます。

### GitHub Actions

各テンプレートには2つのワークフローがあります：`ci.yml`（push/PR ごと）と `release.yml`（`v*` タグ時）。

#### C/C++ Pure & Hybrid
- **Lint**：pre-commit チェック（clang-format、clang-tidy、cppcheck、commitlint）
- **Build**：CMake Debug + Release プリセット
- **Test**：ctest 経由の GoogleTest スイート
- **Benchmark**：Google Benchmark バイナリの実行（`benchmarks/` に存在する場合）
- **Coverage**：gcov + lcov — HTML レポート + GitHub Actions UI サマリー + GitHub Pages カバレッジバッジ
- **Sanitize ASan**：AddressSanitizer + UBSan + LeakSanitizer — メモリエラーと UB 検出
- **Sanitize MSan**：MemorySanitizer（Clang）— 未初期化メモリの読み取り
- **Sanitize TSan**：ThreadSanitizer — マルチスレッドコードのデータ競合
- **Valgrind**：`ctest -T memcheck` — テストスイート全体の詳細メモリ解析
- **Matrix**：Python 3.10–3.13（hybrid のみ）
- **Security**：Trivy — CVE スキャン（HIGH/CRITICAL、マージをブロック）
- **Docs**：Doxygen（pure）または Doxygen + Sphinx/furo（hybrid）→ `main` へのプッシュ時に GitHub Pages へ
- **Release**：`v*` タグ時 — git-cliff が CHANGELOG を生成、アーティファクトをビルド、GitHub Release を作成

#### Python Pure
- **Lint**：pre-commit チェック（ruff、pylint、mypy、commitlint）
- **Test**：pytest + GitHub Actions UI カバレッジサマリー + PR カバレッジコメント
- **カバレッジバッジ**：`main` へのプッシュ時に GitHub Pages へ公開
- **Matrix**：Python 3.10–3.13
- **Security**：Trivy — CVE スキャン（HIGH/CRITICAL、マージをブロック）
- **Docs**：Sphinx + furo → GitHub Pages（`main`）+ ReadTheDocs（すべてのブランチ/タグ）
- **Release**：`v*` タグ時 — git-cliff が CHANGELOG を生成、wheel + sdist をビルド、GitHub Release を作成

すべてのワークフローは開発環境との完全な一貫性のために **Arch Linux コンテナ**で実行されます。

### Dependabot

このリポジトリのルートにある `.github/dependabot.yml` がすべてのテンプレートを自動的に最新の状態に保ちます。カバー範囲：

- **GitHub Actions** バージョン（actions/checkout、upload-artifact など）
- **pre-commit フック**リビジョン（clang-format、ruff、mypy、pylint など）

更新は毎週チェックされます — 手動でのバージョン追跡は不要。

### AI エージェントコンテキスト

生成されたプロジェクトには `@PROJECT_NAME@.md` ファイルが含まれます — プロジェクトのアーキテクチャ、技術スタック、ビルド手順、AI エージェントのルールを記述した唯一の信頼できる情報源です。`CLAUDE.md`、`QWEN.md`、`AGENTS.md` はこのファイルへのシンボリックリンクであるため、Claude Code、Qwen Code、Kilo Code はすべて同じコンテキストを自動的に読み込みます。

---

## PlatformIO テンプレート

### 対応ボード

| ディレクトリ | ボード | アーキテクチャ | Wokwi CI |
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

> \* STM32F411：Wokwi は BlackPill を直接サポートしていません — `diagram.json` は `board-st-nucleo-f411re`（同じ STM32F411 MCU、異なるピン配置）を使用。ESP8266：Wokwi 非対応 — ビルドのみ。

### Wokwi：ハードウェア不要のシミュレーション

Wokwi を使うと、実機なしでブラウザや VS Code 内でファームウェアを実行できます。

**VS Code 設定：**
1. **Wokwi Simulator** 拡張機能をインストール
2. `Ctrl+Shift+P` → 「Wokwi: Request Free License」でライセンスを有効化（個人プロジェクトは無料）
3. プロジェクトルートの `diagram.json` を開く — 回路図が Wokwi エディタで開く
4. ▶ を押してシミュレーションを開始

**Wokwi CI 設定（GitHub Actions）：**
1. [wokwi.com/ci](https://wokwi.com/ci) でトークンを取得
2. GitHub Secrets に追加：`Settings` → `Secrets and variables` → `Actions` → `New repository secret` → `WOKWI_CLI_TOKEN`
3. CI が自動的にシミュレーションを実行してシリアル出力を検証

**`diagram.json` 回路図：**
[wokwi.com](https://wokwi.com) で回路を描いて `diagram.json` をダウンロードし、プロジェクト内のファイルを置き換えます。Wokwi CI と VS Code 拡張機能は同じファイルを共有します。

### 基本コマンド

```bash
pio run                        # ファームウェアをビルド
pio run -t upload              # ビルドしてデバイスに書き込み
pio device monitor             # シリアルモニタを開く
pio device monitor --baud 115200
pio test                       # デバイス上でユニットテストを実行
pio run --target size          # ファームウェアサイズレポート
pio check                      # 静的解析
```

### フレームワーク選択

すべてのテンプレートはデフォルトで `framework = arduino` を使用します。`platformio.ini` で変更：

```ini
[env:esp32dev]
platform = espressif32
board    = esp32dev
framework = arduino      ; デフォルト — 豊富なライブラリエコシステム

; 代替（必要に応じてコメントアウトを解除）：
; framework = espidf     ; ESP-IDF — 完全制御、ネイティブ Espressif SDK
; framework = arduino    ; ESP-IDF コンポーネントと組み合わせ可能
```

| フレームワーク | プラットフォーム | 使用場面 |
| --- | --- | --- |
| `arduino` | すべて | 最大限の既製ライブラリ、素早いスタート |
| `espidf` | ESP32 | 完全制御、Bluetooth/WiFi スタック、FreeRTOS |
| `arduino`（ESP-IDF 付き） | ESP32 | Arduino ライブラリ + ESP-IDF コンポーネント |
| `pico-sdk` | Raspberry Pi Pico | RP2040 SDK への直接アクセス |
| `arduino` | Pico | Arduino エコシステムとの互換性 |

### ファームウェアの書き込み

アップロードプロトコルは `platformio.ini` で設定：

```ini
; upload_protocol = esptool     ; ESP32/ESP8266 — USB UART（デフォルト）
; upload_protocol = espota      ; ESP32/ESP8266 — OTA（無線）
; upload_protocol = esp-prog    ; ESP32 — JTAG デバッガ
; upload_protocol = stlink      ; STM32 — ST-Link プログラマ
; upload_protocol = picotool    ; Raspberry Pi Pico — USB（BOOTSEL を押しながら）
; upload_protocol = arduino     ; Arduino AVR — ブートローダ経由
; upload_protocol = usbasp      ; Arduino AVR — USBasp プログラマ
```

### CI/CD

- **Lint**：pre-commit チェック（clang-format、cppcheck、commitlint）
- **Build**：`pio run` — ファームウェアコンパイル
- **Test**：`pio test`（test ディレクトリが存在する場合）
- **Size**：`pio run --target size` — ファームウェアサイズレポート
- **Static analysis**：`pio check --fail-on-defect high`
- **Wokwi CI**：クラウドでのファームウェアシミュレーション（ESP8266 を除く）— 設定は上の [Wokwi](#wokwiハードウェア不要のシミュレーション) セクション参照
- **Release**：`v*` タグ時 — `.elf`/`.hex`/`.bin` を GitHub Release にアップロード

ワークフローは開発環境との完全な一貫性のために **Arch Linux コンテナ**で実行されます。

---

## 機能と使い方

### テスト

#### C/C++（GoogleTest）

```bash
# すべてのテストをビルドして実行
cmake --preset linux-debug && cmake --build --preset linux-debug
cd cmake-build-linux-debug && ctest --output-on-failure

# 特定のテストを実行
ctest -R MyTest --output-on-failure

# 詳細出力
ctest -V
```

テストは `test/` にあります。各 `*_test.cpp` は CMake に自動的に認識されます。

#### Python（pytest）

```bash
# すべてのテストを実行
python -m pytest -v

# 特定のファイルまたはテスト
python -m pytest tests/test_module.py::test_function -v

# 失敗時に短いトレースバック
python -m pytest -v --tb=short
```

---

### コードカバレッジ

#### C++ — lcov

```bash
# カバレッジ付きでビルド
cmake --preset linux-coverage && cmake --build --preset linux-coverage

# テストを実行してレポートを生成
cd cmake-build-linux-coverage
ctest --output-on-failure
lcov --capture --directory . --output-file coverage.info
lcov --remove coverage.info '/usr/*' '*/libraries/*' '*/test/*' --output-file coverage.info
genhtml coverage.info --output-directory coverage-html

# ブラウザでレポートを開く
xdg-open coverage-html/index.html
```

HTML レポートはファイル、関数、行ごとのカバレッジを表示します。緑 = カバー済み、赤 = 未カバー。

#### Python — pytest-cov

```bash
# ターミナル出力でカバレッジ
python -m pytest --cov --cov-report=term

# HTML レポート
python -m pytest --cov --cov-report=html
xdg-open htmlcov/index.html

# カバーされていない行を表示
python -m pytest --cov --cov-report=term-missing
```

#### バッジと PR コメント

`main` へのプッシュ後、GitHub Actions が自動的にカバレッジバッジを GitHub Pages に公開します。各 PR には現在のカバレッジ率のコメントが表示されます。

---

### Google Benchmark

Google Benchmark はナノ秒精度で個別関数のパフォーマンスを測定します。

```bash
# Release でビルド（必須 — Debug は結果を歪める）
cmake --preset linux-release && cmake --build --preset linux-release

# すべてのベンチマークを実行
./cmake-build-linux-release/bench_example  # またはバイナリ名

# 名前でフィルタ
./cmake-build-linux-release/bench_example --benchmark_filter=BM_MyFunction

# 後の分析のために JSON 出力
./cmake-build-linux-release/bench_example --benchmark_out=results.json --benchmark_out_format=json

# 2回の実行を比較
benchmark_compare results_before.json results_after.json
```

出力例：
```
Benchmark                Time        CPU      Iterations
--------------------------------------------------------
BM_VectorPushBack       45.2 ns    45.1 ns    15000000
BM_MapInsert           120.5 ns   120.3 ns     5800000
```

ベンチマークは `benchmarks/` にあります。`bench_example.cpp` を参考に新しいものを追加してください。

---

### サニタイザ

サニタイザはコンパイラベースのツールで、実行時エラーを検出します：バッファオーバーフロー、データ競合、メモリリーク、未定義動作。

#### ASan + UBSan + LSan — メモリエラーと UB

```bash
cmake --preset linux-asan && cmake --build --preset linux-asan
cd cmake-build-linux-asan && ctest --output-on-failure
```

検出内容：
- **ASan**（AddressSanitizer）— 範囲外アクセス、use-after-free、double-free
- **UBSan**（UndefinedBehaviorSanitizer）— 整数オーバーフロー、負のシフト、ヌルポインタ参照外し
- **LSan**（LeakSanitizer）— メモリリーク

#### MSan — 未初期化メモリ

```bash
cmake --preset linux-msan && cmake --build --preset linux-msan
cd cmake-build-linux-msan && ctest --output-on-failure
```

未初期化メモリの読み取りを検出します。**Clang のみ。**

#### TSan — データ競合

```bash
cmake --preset linux-tsan && cmake --build --preset linux-tsan
cd cmake-build-linux-tsan && ctest --output-on-failure
```

マルチスレッドコードのデータ競合を検出します。

> サニタイザは互いに組み合わせることができません — それぞれ個別に実行します。CI では並列ジョブとして実行されます。

---

### Valgrind

Valgrind は再コンパイル不要 — すでにビルドされた Debug バイナリを解析します。

#### Memcheck — メモリエラー

```bash
# ctest 経由ですべてのテスト（CI と pre-commit モード）
tools/profiler/run-memcheck.sh

# 特定のバイナリ
tools/profiler/run-memcheck.sh my_binary
```

検出：範囲外アクセス、use-after-free、メモリリーク、無効なシステムコール。

#### Helgrind — データ競合

```bash
# すべてのテスト
tools/profiler/run-helgrind.sh

# 特定のバイナリ
tools/profiler/run-helgrind.sh my_binary
```

TSan と似ていますが再コンパイル不要。低速ですが任意のバイナリで動作します。

#### DRD — データ競合（代替）

```bash
tools/profiler/run-drd.sh          # すべてのテスト
tools/profiler/run-drd.sh my_binary
```

Helgrind より精度は低いですが高速です。

> **使い分け：** サニタイザ — 高速で開発中に便利。Valgrind — 最終確認や再コンパイルできない場合に。

---

### C++ プロファイリング

#### Callgrind — コールグラフと CPU 時間

```bash
tools/profiler/run-callgrind.sh my_binary
# 出力：profiles/callgrind.out
```

可視化：`callgrind.out` を [speedscope.app](https://speedscope.app) にアップロード — ブラウザでインタラクティブなフレームグラフ。

表示内容：最も CPU を消費する関数、コールグラフ、命令数。

#### Cachegrind — キャッシュミス

```bash
tools/profiler/run-cachegrind.sh my_binary
# 出力：profiles/cachegrind.out
```

表示内容：L1/L2/L3 キャッシュミス数、分岐予測ミス。メモリアクセスパターンの最適化に役立ちます。

#### Massif — ヒープ使用量

```bash
tools/profiler/run-massif.sh my_binary
# 出力：profiles/massif.out（テキストレポートを stdout に出力）
```

表示内容：時間経過によるヒープの増減、アロケーションのピーク。

#### perf — システムプロファイリング

```bash
tools/profiler/run-perf.sh my_binary
```

高速な Linux サンプリングプロファイラ。最小限のオーバーヘッドでホットスポットを表示します。

---

### Python プロファイリング（hybrid + python/pure）

#### cProfile — 関数呼び出し統計

```bash
tools/profiler/profile-python.sh
# 出力：profiles/profile.prof — 可視化：snakeviz profiles/profile.prof
```

表示内容：関数ごとの呼び出し回数、合計時間と平均時間。snakeviz でブラウザ内のインタラクティブグラフで可視化。

#### tracemalloc — メモリ使用量

```bash
tools/profiler/profile-memory.sh
# 出力：profiles/memory_stats.txt
```

表示内容：行ごとのメモリ割り当てトップ 10。

#### py-spy — コード変更不要のサンプリングプロファイラ

```bash
tools/profiler/profile-spy.sh
# 出力：profiles/pyspy.svg — ブラウザで開く
```

コード変更なしで動作し、オーバーヘッドが最小限。SVG フレームグラフ：ブラウザで開いてブロックをクリックしてズーム。

---

### ドキュメント

#### C/C++ Pure — Doxygen

```bash
# ドキュメントを生成
doxygen Doxyfile

# ブラウザで開く
xdg-open docs/html/index.html
```

コメントでコードを文書化：
```cpp
/// @brief 2つの数の和を計算する
/// @param a 第1オペランド
/// @param b 第2オペランド
/// @return a と b の和
int add(int a, int b);
```

#### Hybrid & Python Pure — Sphinx

```bash
# ドキュメントをビルド
cd docs && make html

# ブラウザで開く
xdg-open docs/_build/html/index.html
```

Hybrid テンプレートは **Breathe** を使用して Doxygen から C++ API を Sphinx にインポート — C++ と Python のドキュメントが **furo** テーマ（ダークモード対応）の統合サイトとして構築されます。

#### 公開

- **GitHub Pages** — すべてのテンプレート：`main` へのプッシュ時に自動公開
- **ReadTheDocs** — Hybrid と Python Pure のみ：プッシュ時に自動公開（すべてのブランチとタグ、バージョン管理付き）

ReadTheDocs の設定（Hybrid / Python Pure）：
1. [readthedocs.org](https://readthedocs.org) でリポジトリを接続
2. ReadTheDocs が `.readthedocs.yaml` を自動検出してプッシュごとにビルド

---

## ライセンス

**MIT License** — Copyright © 2025–2026 Vais Vaisov

自由に使用、変更、配布できます。

---

## コントリビューション

コントリビューションを歓迎します！[CONTRIBUTING.md](.github/CONTRIBUTING.md) を読んで、気軽に issue や Pull Request を開いてください。

---

<div align="center">

*IT Project Templates — ゼロからコーディングまで数分で*

</div>
