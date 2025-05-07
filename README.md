# dotfiles

このリポジトリは、開発環境の設定ファイルを管理するためのものです。VS Code の設定だけでなく、シェルやその他のツールの設定も含まれています。以下の手順に従って設定を適用してください。

## 利用方法

### 1. リポジトリをクローン
まず、このリポジトリをローカル環境にクローンします。

```bash
git clone https://github.com/iotassss/dotfiles.git ~/dotfiles
```

### 2. 既存の設定ファイルをバックアップ
既存の設定ファイルがある場合は、バックアップを取ります。

#### VS Code の設定ファイル
```bash
mv ~/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/settings.json.bak
mv ~/Library/Application\ Support/Code/User/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json.bak
```

#### Zsh 設定ファイル
```bash
mv ~/.zshrc ~/.zshrc.bak
mv ~/.zprofile ~/.zprofile.bak
```

### 3. シンボリックリンクを作成
リポジトリ内の設定ファイルを適用するために、以下のコマンドでシンボリックリンクを作成します。

#### VS Code の設定ファイル
```bash
ln -s ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```

#### Zsh 設定ファイル
```bash
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/zprofile ~/.zprofile
```

### 4. 設定を反映
設定を反映するために、以下の手順を実行します。

#### VS Code の設定
VS Code を再起動し、設定が正しく適用されていることを確認してください。

#### Zsh の設定
ターミナルを再起動するか、以下のコマンドを実行します。
```bash
source ~/.zshrc
```

### 5. 拡張機能のインストール
リポジトリに含まれる拡張機能リストを使用して、必要な拡張機能を一括インストールします。
```bash
xargs -n 1 code --install-extension < ~/dotfiles/vscode/extensions.txt
```

## 注意事項
- **機密情報**: このリポジトリには機密情報を含めないようにしてください。API キーやトークンなどは別途管理してください。
- **環境依存の設定**: 環境ごとに異なる設定が必要な場合は、リポジトリを分岐させるか、スクリプトで切り替えを行うことを検討してください。

## その他
拡張機能のリストを更新する場合は、以下のコマンドを実行してください。
```bash
code --list-extensions > ~/dotfiles/vscode/extensions.txt
```
