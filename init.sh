#!/bin/bash

# dotfiles 初期化スクリプト
# このスクリプトは、dotfiles の設定を適用するためのものです。

# リポジトリのパス
DOTFILES_DIR="$HOME/dotfiles"

# バックアップ関数
backup_file() {
  if [ -f "$1" ]; then
    mv "$1" "$1.bak"
    echo "バックアップ: $1 -> $1.bak"
  fi
}

# シンボリックリンク作成関数
create_symlink() {
  ln -sf "$1" "$2"
  echo "シンボリックリンク作成: $1 -> $2"
}

# VS Code 設定の適用
echo "VS Code の設定を適用中..."
backup_file "$HOME/Library/Application Support/Code/User/settings.json"
backup_file "$HOME/Library/Application Support/Code/User/keybindings.json"
create_symlink "$DOTFILES_DIR/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
create_symlink "$DOTFILES_DIR/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"

# Zsh 設定の適用
echo "Zsh の設定を適用中..."
backup_file "$HOME/.zshrc"
backup_file "$HOME/.zprofile"
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"

# VS Code 拡張機能のインストール
echo "VS Code 拡張機能をインストール中..."
$DOTFILES_DIR/vscode/install_vscode_extensions.sh

# 完了メッセージ
echo "dotfiles の初期化が完了しました！"
