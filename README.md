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
