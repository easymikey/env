# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Theme
ZSH_THEME="robbyrussell"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

plugins=(
    git
    vi-mode
)

# Disable error in console
ZSH_DISABLE_COMPFIX=true

# Path to zsh
source $ZSH/oh-my-zsh.sh

########################
########################

# System aliases
alias c='clear'
alias grep='grep --color=auto'
alias cp='cp -r'
alias rm='rm -r'
alias mkdir='mkdir -p'
# Utilities
alias vim='nvim'
alias vi='nvim'
alias g='git'
alias pn='pnpm'

# Add user path to fuction `fpath`
fpath=(~/.zsh $fpath)

# Downloading the autocomplete compilation
autoload -Uz compinit
compinit -u

# Enable True Color support for Neovim
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Update all
update_all() {
    echo -e "\e[1;32mStarting parallel update...\e[0m"

    # Rust update in the background process
    rustup update &

    # Deno update in the background process
    deno upgrade &

    # Brew update in the background process
    brew update && brew upgrade && brew cleanup &

    # Waiting for all background process to complete
    wait

    echo -e "\e[1;32mAll updates completed!\e[0m"
}

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# pnpm
export PNPM_HOME="/Users/easymikey/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
