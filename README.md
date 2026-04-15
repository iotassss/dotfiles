# dotfiles

このリポジトリは、開発環境の設定ファイルを管理するためのものです。VS Code の設定だけでなく、シェルやその他のツールの設定も含まれています。以下の手順に従って設定を適用してください。

## 利用方法

### 1. リポジトリをクローン
まず、このリポジトリをローカル環境にクローンします。

```bash
git clone https://github.com/iotassss/dotfiles.git ~/dotfiles
```

### 2. 初期化スクリプトの実行
スクリプトを実行して、設定を適用します。このスクリプトは以下を行います。
```bash
# 既存の設定ファイルをバックアップ
# VS Code と Zsh の設定ファイルのシンボリックリンクを作成
sh ~/dotfiles/init.sh
# 反映
source ~/.zshrc

# (option) VS Code の拡張機能をインストールする場合
sh ~/dotfiles/install_vscode_extensions.sh
```

## 注意事項
- **機密情報**: このリポジトリには機密情報を含めないようにしてください。API キーやトークンなどは別途管理してください。
- **環境依存の設定**: 環境ごとに異なる設定が必要な場合は、リポジトリを分岐させるか、スクリプトで切り替えを行うことを検討してください。

## その他
拡張機能のリストを更新する場合は、以下のコマンドを実行してください。
```bash
code --list-extensions > ~/dotfiles/vscode/extensions.txt
```

## Neovim (v0.11+) を AppImage でインストールする追加手順（WSL / Linux）

```sh
# ~/.local/bin ディレクトリを作成（なければ作る）
mkdir -p ~/.local/bin

# 作業ディレクトリを移動
cd ~/.local/bin

# Neovim の最新版 AppImage をダウンロード
curl -LO https://github.com/neovim/neovim-releases/releases/download/v0.11.6/nvim-linux-x86_64.appimage

# 実行権限を付与
chmod u+x nvim-linux-x86_64.appimage

# ファイル名を "nvim" に変更（コマンドとして使いやすくする）
mv nvim-linux-x86_64.appimage nvim

# ~/.local/bin を PATH に追加（このディレクトリのコマンドを優先して使う）
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

# 設定を現在のシェルに反映
source ~/.bashrc

# gopls導入
go install golang.org/x/tools/gopls@latest
echo 'export PATH="$HOME/go/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
which gopls
gopls version
```

