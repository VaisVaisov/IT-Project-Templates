# IT Project Templates

<div align="center">

![License](https://img.shields.io/badge/license-MIT-E91E63?style=for-the-badge&labelColor=0D1117)
![Stars](https://img.shields.io/github/stars/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=E91E63&logo=github&logoColor=white)
![Last Commit](https://img.shields.io/github/last-commit/VaisVaisov/IT-Project-Templates?style=for-the-badge&labelColor=0D1117&color=00BCD4&logo=git&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-00BCD4?style=for-the-badge&labelColor=0D1117)

**VS Code Dev Containers 対応のすぐに使えるプロジェクトテンプレート**

*Arch Linux ベース · Clang ツールチェーン · AI コーディングエージェントプリインストール*

[テンプレート](#利用可能なテンプレート) • [クイックスタート](#クイックスタート) • [インストール](#インストール) • [Dev Containers](#dev-container-の機能) • [CI/CD](#コード品質--cicd)

**[🇬🇧 English](README.md) · [🇷🇺 Русский](README.ru.md) · [🇩🇪 Deutsch](README.de.md) · [🇫🇷 Français](README.fr.md) · [🇪🇸 Español](README.es.md) · [🇨🇳 中文](README.zh.md) · [🇯🇵 日本語](README.ja.md) · [🇵🇹 Português](README.pt.md) · [🇰🇷 한국어](README.ko.md) · [🇮🇹 Italiano](README.it.md)**

</div>

---

## これは何ですか？

数分でゼロからコーディングを始められるように設計されたプロジェクトテンプレートのコレクションです。各テンプレートには Arch Linux ベースの完全に設定された **VS Code Dev Container** が含まれており、ホスト OS に関係なくどのマシンでも同じ環境を提供します。

### 空のプロジェクトではなくこれを使う理由は？

- 🚀 **設定時間ゼロ**: VS Code で開き、「Reopen in Container」をクリックしてすぐにコーディング開始
- 🤖 **AI 対応**: すべてのコンテナに Claude Code、Qwen Code、Kilo Code CLI がプリインストール
- 🔒 **品質ゲート**: pre-commit フックがリポジトリに入る前に問題を検出
- ⚙️ **CI/CD 付き**: リンティング、ビルド、テスト、カバレッジ、ドキュメント、リリース用の GitHub Actions ワークフロー
- 📝 **Conventional Commits**: commitlint がコミットメッセージのフォーマットを検証
- 🌍 **クロスプラットフォーム**: 同じスクリプトが Linux、macOS、Windows で動作

---

## 利用可能なテンプレート

### C/C++ (`c-cpp/`)

| テンプレート | 説明 |
| --- | --- |
| `pure` | CMake、Ninja、GoogleTest、Doxygen を使った C/C++、lcov でカバレッジ |
| `hybrid` | C/C++ + Python/Cython — 1つのプロジェクトで両言語、Sphinx + ReadTheDocs |
| `platformio/` | Arduino、ESP32、STM32 向け組み込み開発 |

### Python (`python/`)

| テンプレート | 説明 |
| --- | --- |
| `pure` | pytest、ruff、pylint、mypy を使った Python、Sphinx + ReadTheDocs |

### PlatformIO デバイス (`c-cpp/platformio/`)

| デバイス | ボード |
| --- | --- |
| `arduino-nano` | ATmega328P |
| `arduino-pro-micro` | ATmega32U4 |
| `esp32-devkit` | ESP32 DevKit |
| `stm32f411` | STM32F411 BlackPill |

---

## クイックスタート

### Linux / macOS

```bash
# 好きな場所にクローン
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# PATH に追加（1回だけ）
echo 'export PATH="$HOME/IT-Project-Templates:$PATH"' >> ~/.zshrc  # または ~/.bashrc
source ~/.zshrc

# 新しいプロジェクトを作成
new-project --c-cpp --pure ~/Projects/my_cpp_app
new-project --python --pure ~/Projects/my_python_app
new-project --c-cpp --hybrid ~/Projects/my_hybrid_app
new-project --c-cpp --platformio --esp32-devkit ~/Projects/sensor_node
```

### Windows (PowerShell)

```powershell
# 好きな場所にクローン
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates

# 新しいプロジェクトを作成
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Pure C:\Projects\my_cpp_app
.\IT-Project-Templates\new-project-script.ps1 -Python -Pure C:\Projects\my_python_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -Hybrid C:\Projects\my_hybrid_app
.\IT-Project-Templates\new-project-script.ps1 -CCpp -PlatformIO -Esp32Devkit C:\Projects\sensor_node
```

またはバッチランチャーを使用 — ダブルクリックまたは cmd から実行:

```cmd
new-project-shell.bat -CCpp -Pure C:\Projects\my_cpp_app
```

### プロジェクト作成後

1. VS Code でプロジェクトフォルダを開く
2. **「Reopen in Container」** をクリック（または `Ctrl+Shift+P` → "Dev Containers: Reopen in Container"）
3. 初回起動時はコンテナが自動的にビルドされます
4. pre-commit フックが自動的にインストールされます — コーディング開始！

---

## 使用リファレンス

### Linux / macOS フラグ

```
new-project [言語] [タイプ] [デバイス] <パス>

言語:
  --c-cpp            C/C++ プロジェクト
  --python           Python プロジェクト

タイプ:
  --pure             純粋な C/C++ または Python
  --hybrid           ハイブリッド C/C++ + Python/Cython  (--c-cpp のみ)
  --platformio       組み込み開発                         (--c-cpp のみ)

PlatformIO デバイス:
  --arduino-nano
  --arduino-pro-micro
  --esp32-devkit
  --stm32f411
```

### Windows (PowerShell) フラグ

```
new-project-script.ps1 [言語] [タイプ] [デバイス] <パス>

言語:
  -CCpp              C/C++ プロジェクト
  -Python            Python プロジェクト

タイプ:
  -Pure              純粋な C/C++ または Python
  -Hybrid            ハイブリッド C/C++ + Python/Cython  (-CCpp のみ)
  -PlatformIO        組み込み開発                         (-CCpp のみ)

PlatformIO デバイス:
  -ArduinoNano
  -ArduinoProMicro
  -Esp32Devkit
  -Stm32f411
```

---

## インストール

### 1. リポジトリをクローン

```bash
# Linux / macOS
git clone https://github.com/VaisVaisov/IT-Project-Templates.git ~/IT-Project-Templates

# Windows (PowerShell)
git clone https://github.com/VaisVaisov/IT-Project-Templates.git $env:USERPROFILE\IT-Project-Templates
```

### 2. PATH に追加

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

**Windows — システム PATH（永続）:**
```powershell
[Environment]::SetEnvironmentVariable(
    "Path",
    "$env:Path;$env:USERPROFILE\IT-Project-Templates",
    "User"
)
```

> **注意 (Linux/macOS):** `new-project.sh` はクローン後すでに実行可能です。そうでない場合: `chmod +x new-project.sh`

### 3. 前提条件

| ツール | Linux / macOS | Windows |
| --- | --- | --- |
| **Docker** | 必須 — [docker.com](https://www.docker.com/) | 必須 — [Docker Desktop](https://www.docker.com/products/docker-desktop/) |
| **VS Code** | 必須 — [code.visualstudio.com](https://code.visualstudio.com/) | 必須 |
| **Dev Containers 拡張機能** | 必須 — VS Code からインストール | 必須 |
| **GitHub CLI** | 推奨 — `gh auth login` | 推奨 |
| **Python** | hybrid/python テンプレート用 | hybrid/python テンプレート用 |
| **Git** | 必須 | 必須 |

> **GitHub CLI ヒント:** ホストで `gh auth login` を1回実行するだけ。コンテナはホストの `~/.config/gh` をバインドマウントします — Dev Container 内での再認証は不要です。

---

## リポジトリ構造

```
IT-Project-Templates/
├── .github/
│   └── dependabot.yml          # 依存関係の自動更新（Actions + pre-commit）
├── c-cpp/
│   ├── pure/                   # 純粋 C/C++ テンプレート
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
│   ├── hybrid/                 # C/C++ + Python/Cython テンプレート
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
│   └── platformio/             # 組み込みテンプレート
│       ├── .devcontainer/      # 共有 devcontainer (PlatformIO + Clang)
│       ├── .vscode/            # 共有 VS Code 設定
│       ├── arduino-nano/
│       ├── arduino-pro-micro/
│       ├── esp32-devkit/
│       └── stm32f411/
├── python/
│   └── pure/                   # 純粋 Python テンプレート
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
├── meta-template/              # 新しいテンプレート作成の基盤
├── new-project.sh              # Linux / macOS スクリプト
├── new-project-script.ps1      # Windows PowerShell スクリプト
├── new-project-shell.bat       # Windows バッチランチャー
├── LICENSE
└── README.md
```

---

## Dev Container の機能

すべてのコンテナは **Arch Linux（最新）** ベースで構築され、以下を含みます:

- **シェル**: Oh My Zsh + Powerlevel10k を使った Zsh
- **エディタ**: Neovim
- **VCS**: Git、git-delta、GitHub CLI
- **AI エージェント**: Claude Code、Qwen Code、Kilo Code CLI（AUR から）— すべて CLI ツールとして利用可能
- **Docker**: Docker + Docker Buildx + Lazydocker（コンテナ内でコンテナを実行するため）
- **GitHub 認証**: ホストから `~/.config/gh` をバインドマウント — 再認証不要

### C/C++ コンテナ

- Clang、LLD、LLDB、compiler-rt
- CMake、Ninja
- GDB、valgrind
- cppcheck、lcov
- pre-commit

### C/C++ ハイブリッドコンテナ

C/C++ のすべてに加えて:

- Python 3、pip、virtualenv
- Cython、NumPy
- pytest、pytest-cov
- ruff、pylint、mypy
- Sphinx、furo、breathe（ドキュメント）

### Python コンテナ

- Python 3、pip、virtualenv
- pytest、pytest-cov
- ruff、pylint、mypy
- Sphinx、furo
- pre-commit

### PlatformIO コンテナ

- PlatformIO Core + udev ルール
- Clang、cppcheck（コード解析用）
- Python 3、pip
- pre-commit
- USB デバイスアクセス（コンテナは `--privileged` で実行）

---

## VS Code 拡張機能

すべてのテンプレートは Dev Container で開いたとき自動的に拡張機能をインストールし、Docker なしで開いたときは推奨として表示します。

### 共通（すべてのテンプレート）

| カテゴリ | 拡張機能 | 目的 |
| --- | --- | --- |
| **AI** | Claude Code | AI エージェント（CLI + VS Code） |
| | TONGYI Lingma | AI アシスタントとコード補完 |
| | Kilo Code | 400 以上のモデルをサポートする AI エージェント |
| **Git** | GitLens | 高度な Git 機能（blame、履歴） |
| | Git Graph | ビジュアルコミット履歴 |
| **品質** | Better Comments | カラフルな TODO/FIXME/NOTE コメント |
| | Code Spell Checker | コードとコメントのスペルチェック |
| **Docker** | Docker | コンテナ管理 |
| **Markdown** | Markdown All in One | 完全な Markdown サポート |
| | Markdown Converter | PDF/HTML/Word にエクスポート |
| **フォーマット** | YAML (Red Hat) | YAML サポート |
| | JSON (Meezilla) | 拡張 JSON 編集 |

### C/C++ テンプレート

- **C/C++ Tools** — IntelliSense とデバッグ
- **clangd** — 高度なコード解析とナビゲーション
- **Code Runner** — クイックコード実行

### Python テンプレート

- **Python** + **Pylance** — コアサポートと言語サーバー
- **debugpy** — Python デバッガー
- **Python Envs** — 仮想環境管理
- **autodocstring** — docstring の自動生成
- **Django** + **Jinja** — フレームワークサポート（純粋 Python）

### ハイブリッドテンプレート

C/C++ と Python のすべての拡張機能を組み合わせ。

### PlatformIO テンプレート

- **PlatformIO IDE** — 組み込み開発プラットフォーム
- **Wokwi Simulator** — VS Code 内で直接 Arduino/ESP32/STM32 をインタラクティブにシミュレート
- **C/C++ Tools** — マイクロコントローラーコードのサポート

---

## コード品質 & CI/CD

### pre-commit フック

フックはコミットごとに自動的に実行されます。Dev Container 起動時にインストールされます（`postCreateCommand`）— 通常のフックとコミットメッセージフックの両方。

#### C/C++ プロジェクト
- **clang-format** — 自動コードフォーマット（LLVM スタイル）
- **clang-tidy** — バグとスタイル問題の静的解析
- **cppcheck** — メモリリーク、null ポインタチェック、未定義動作
- **valgrind memcheck** — 実行時メモリエラー検出（hybrid + pure）

#### Python プロジェクト
- **ruff** — 高速リンティング + インポート並べ替え（flake8 + isort を置き換え）
- **ruff-format** — コードフォーマット（black 互換）
- **pylint** — 深い意味解析：到達不能コード、誤った引数数、存在しない属性へのアクセス
- **mypy** — 静的型チェック

#### すべてのプロジェクト
- **commitlint** — [Conventional Commits](https://www.conventionalcommits.org/) に従ったコミットメッセージフォーマットの検証
- YAML バリデーション
- 大きなファイルの検出（> 1 MB）
- 行末の空白削除
- ファイル末尾の修正
- マージ競合の検出

> フックが失敗すると、問題が修正されるまでコミットがブロックされます。これにより壊れたコードがリポジトリに入ることを防ぎます。

### GitHub Actions

各テンプレートは2つのワークフローを含みます：`ci.yml`（Push/PR 毎に実行）と `release.yml`（`v*` タグ時に実行）。

#### C/C++ Pure & Hybrid
- **Lint**: pre-commit チェック（clang-format、clang-tidy、cppcheck、commitlint）
- **Build**: プリセットを使った CMake Debug + Release ビルド
- **Test**: ctest を通じた GoogleTest テスト
- **Coverage**: gcov + lcov — HTML レポートをアーティファクトとしてアップロード
- **Docs**: Doxygen（pure）または Doxygen + Sphinx/furo（hybrid）
- **Pages**: `main` ブランチへの Push 時に GitHub Pages にドキュメントを自動公開
- **Release**: タグ `v*` 時 — バイナリ + Python Wheel をビルドし、GitHub Release を作成

#### Python Pure
- **Lint**: pre-commit チェック（ruff、pylint、mypy、commitlint）
- **Test**: pytest
- **Coverage**: pytest-cov — XML レポート + アーティファクト
- **Docs**: Sphinx + furo、ReadTheDocs 経由で公開
- **Release**: タグ `v*` 時 — wheel + sdist をビルドし、GitHub Release を作成

#### PlatformIO
- **Lint**: pre-commit チェック（clang-format、cppcheck、commitlint）
- **Build**: `pio run` — ファームウェアコンパイル
- **Test**: `pio test`（test ディレクトリがある場合）
- **Size**: `pio run --target size` — ファームウェアサイズレポート
- **Static analysis**: `pio check --fail-on-defect high`
- **Wokwi CI**: クラウドでのファームウェアシミュレーション — 実際のハードウェアなしで Serial 出力を検証（GitHub Secrets に `WOKWI_CLI_TOKEN` が必要、月50分無料）
- **Release**: タグ `v*` 時 — `.elf`/`.hex`/`.bin` を GitHub Release にアップロード

> **Wokwi CI と VS Code 拡張機能**は同じ `diagram.json` を使用します — [wokwi.com](https://wokwi.com) で描いた回路図。詳細は生成されたプロジェクトの `@PROJECT_NAME@.md` を参照。

すべてのワークフローは開発環境との一貫性のために **Arch Linux コンテナ**上で実行されます。

### Dependabot

リポジトリのルートに `.github/dependabot.yml` があります — すべてのテンプレートのバージョンが最新かどうかを自動的に監視し、PR でアップデートを提案します。対象：

- **GitHub Actions** — actions/checkout、upload-artifact などのバージョン
- **pre-commit フック** — clang-format、ruff、mypy、pylint などのリビジョン

更新は毎週チェックされます — バージョンの手動追跡は不要。

### AI エージェント向けコンテキスト

各生成されたプロジェクトには `@PROJECT_NAME@.md` ファイルが含まれます — アーキテクチャの説明、スタック、ビルド手順、AI エージェントのルールを含む単一の真実のソースです。`CLAUDE.md`、`QWEN.md`、`AGENTS.md` はこのファイルへのシンボリックリンクなので、Claude Code、Qwen Code、Kilo Code は自動的に同じコンテキストを読みます。

---

## ドキュメント

### C/C++ Pure

ドキュメントは **Doxygen** で生成され、`main` への Push 毎に **GitHub Pages** に自動公開されます。

### C/C++ Hybrid & Python Pure

ドキュメントは **Sphinx** と **furo** テーマ（ダークモード対応）でビルドされ、**ReadTheDocs** 経由で公開されます。Hybrid テンプレートは Doxygen からの C++ API を Sphinx にインポートするために **Breathe** も使用します。

ReadTheDocs の接続方法：
1. [readthedocs.org](https://readthedocs.org) でリポジトリを接続
2. ReadTheDocs は `.readthedocs.yaml` を自動検出し、Push 毎にビルドを開始します

---

## ライセンス

**MIT ライセンス** — Copyright © 2025–2026 Vais Vaisov

自由に使用、変更、配布できます。

---

## 貢献

コントリビューションを歓迎します！ Issue を開くか Pull Request を送ってください。

---

<div align="center">

*IT Project Templates — ゼロからコードまで、数分で*

</div>
