#!/bin/bash

# VS Code 拡張機能のインストールスクリプト
# extensions.txt に記載された拡張機能をインストールします

EXTENSIONS_FILE="$HOME/dotfiles/vscode/extensions.txt"

if [ -f "$EXTENSIONS_FILE" ]; then
  echo "拡張機能リストを読み込み中: $EXTENSIONS_FILE"
  while IFS= read -r extension || [ -n "$extension" ]; do
    if [ -n "$extension" ]; then
      echo "インストール中: $extension"
      code --install-extension "$extension"
    fi
  done < "$EXTENSIONS_FILE"
else
  echo "拡張機能リストが見つかりません: $EXTENSIONS_FILE"
  exit 1
fi

echo "VS Code 拡張機能のインストールが完了しました！"
