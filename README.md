# dotfiles

このリポジトリは、VS Code の設定やその他の開発環境の設定ファイルを管理するためのものです。以下の手順に従って設定を適用してください。

## 利用方法

### 1. リポジトリをクローン
まず、このリポジトリをローカル環境にクローンします。

```bash
git clone https://github.com/iotassss/dotfiles.git ~/dotfiles
```

### 2. 既存の設定ファイルをバックアップ
既存の settings.json や keybindings.json がある場合は、バックアップを取ります。
```bash
mv ~/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/settings.json.bak
mv ~/Library/Application\ Support/Code/User/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json.bak
```

### 3. シンボリックリンクを作成
VS Code の設定ファイルを適用するために、以下のコマンドでシンボリックリンクを作成します。
```bash
ln -s ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```

### 4. 拡張機能のインストール
リポジトリに含まれる拡張機能リストを使用して、必要な拡張機能を一括インストールします。
```bash
xargs -n 1 code --install-extension < ~/dotfiles/vscode/extensions.txt
```

### 5. 設定の確認
VS Code を再起動し、設定が正しく適用されていることを確認してください。

## 注意事項
- **機密情報**: このリポジトリには機密情報を含めないようにしてください。API キーやトークンなどは別途管理してください。
- **環境依存の設定**: 環境ごとに異なる設定が必要な場合は、リポジトリを分岐させるか、スクリプトで切り替えを行うことを検討してください。

## その他
拡張機能のリストを更新する場合は、以下のコマンドを実行してください。
```bash
code --list-extensions > ~/dotfiles/vscode/extensions.txt
```
