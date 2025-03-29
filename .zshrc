# Set up aliases, functions, and other settings for zsh
export SHELL=/bin/zsh
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/z.yuta.ioka/.oh-my-zsh"
export PAGER="less"
export LESS="-R"
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export P9K_SSH="0"
export _P9K_SSH_TTY="/dev/ttys007"
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export MANPATH="/Users/z.yuta.ioka/.nvm/versions/node/v15.7.0/share/man:/opt/homebrew/share/man::"
export INFOPATH="/opt/homebrew/share/info:"
export RBENV_SHELL="zsh"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export JAVA_HOME="/opt/homebrew/Cellar/openjdk/20.0.1"
export NVM_DIR="/Users/z.yuta.ioka/.nvm"
export NVM_CD_FLAGS="-q"
export NVM_BIN="/Users/z.yuta.ioka/.nvm/versions/node/v15.7.0/bin"
export NVM_INC="/Users/z.yuta.ioka/.nvm/versions/node/v15.7.0/include/node"
export GOENV_ROOT="/Users/z.yuta.ioka/.goenv"
export GOPRIVATE="git.gree-dev.net/z-yuta-ioka/gamelib-server-go-sdk,github.com/gree-main/*"
# export GOPRIVATE=""
export TELEPORT_AUTH="gree-sso"
export TELEPORT_LOGIN="z-yuta-ioka"
export TELEPORT_PROXY="teleport.security.gree-dev.net:3080"

export CONDA_CHANGEPS1="false"

# goenv
export PATH="$HOME/.goenv/bin:$PATH"

# Pythonユーザースクリプト
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# Node.js (nvm)
# export PATH="$HOME/.nvm/versions/node/v15.7.0/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"

# flutter
export PATH="$HOME/development/flutter/bin:$PATH"

# OpenJDK
export PATH="/opt/homebrew/Cellar/openjdk/20.0.1/bin:/opt/homebrew/opt/openjdk/bin:$PATH"

# nvm sbin, php系, Homebrew系
export PATH="/opt/homebrew/opt/nvm/sbin:/opt/homebrew/opt/php@8.0/sbin:/opt/homebrew/opt/php@8.0/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# リダイレクトによる上書き禁止
setopt  noclobber

# これは環境変数には記載されていたけど、.zshrcには記載する必要はないかも
# _=/usr/bin/env

# Alias definitions
alias ll='ls -la'
alias gs='git status'
alias gp='git pull'
alias gd='git diff'

# Prompt customization (Powerlevel10k example, if installed)
if [[ -f ~/.p10k.zsh ]]; then
  source ~/.p10k.zsh
fi

# Enable command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Enable auto suggestions (requires zsh-autosuggestions)
if [[ -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Enable syntax highlighting (requires zsh-syntax-highlighting)
if [[ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Enable plugins
autoload -U compinit && compinit
autoload -U promptinit && promptinit

# Default editor
export EDITOR=vim

# Source any additional configurations
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi
