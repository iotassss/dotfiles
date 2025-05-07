# Plugins
plugins=(
    git
)

# PATH settings
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$GOPATH/bin/air:$PATH"
export PATH="/usr/local/bin/aws:$PATH"
export PATH="$HOME/chromedriver-mac-arm64:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Load nvm bash_completion

# Pyenv
eval "$(pyenv init -)"

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Bun
export BUN_INSTALL="$HOME/.bun"

# Go environment
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# Terraform autocompletion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Aliases
alias ll='ls -la'
