# Powerful but minimal zsh configuration
# Author: Radley E. Sidwell-Lewis
# GitHub: https://www.github.com/radleylewis/zsh
#
# Uses:
#   Plugins:      fast-syntax-highlighting, zsh-autosuggestions,
#                 zsh-history-substring-search, zsh-vi-mode
#   Prompt:       starship
#   Navigation:   zoxide, fzf, fd
#   CLI tools:    eza, bat, nvim, ripgrep
#   Node:         nvm

# Debug zsh startup time
# zmodload zsh/zprof

# =========================================================
# History
# =========================================================

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# =========================================================
# ZSH Theme 
# =========================================================
ZSH_THEME="af-magic"


# =========================================================
# Shell behaviour
# =========================================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT  # sort file10 after file9, not after file1

# =========================================================
# Smart directory navigation & lf
# =========================================================

# LF_ICONS=$(cat ~/.config/lf/icons | tr '\n' ':')
# export LF_ICONS

# Initialize zoxide
eval "$(zoxide init zsh)"

# =========================================================
# Completion
# =========================================================

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# if [[ ! ~/.zcompdump.zwc -nt ~/.zcompdump ]]; then
#     zcompile ~/.zcompdump
# fi

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase input matches upper and lower

# Oh my Zsh theme
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"

# macOS / Homebrew (Intel)
if [[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ]]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# Arch
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# Ubuntu
if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

# =========================================================
# Modular Config Files
# =========================================================

# fzf configuration
source "$ZDOTDIR/fzf.zsh"

# Aliases
source "$ZDOTDIR/aliases.zsh"

# Custom keybindings
source "$ZDOTDIR/bindings.zsh"

# Plugins and plugin manager
source "$ZDOTDIR/plugins.zsh"

# Prompt/theme
source "$ZDOTDIR/prompt.zsh"

# fzf
source <(fzf --zsh)

# Rustc/Cargo
source "$HOME/.cargo/env"

# =========================================================
# Custom
# =========================================================

# Create a lazy load function for NVM
lazy_load_nvm() {
    # Unset the placeholder functions so they don't loop
    unset -f nvm node npm npx yarn
    
    # Define where NVM lives if not already set
    export NVM_DIR="$HOME/.nvm"
    
    # Load NVM and its completions natively now
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

# Create placeholder functions that intercept the first call
nvm()  { lazy_load_nvm; nvm "$@"; }
node() { lazy_load_nvm; node "$@"; }
npm()  { lazy_load_nvm; npm "$@"; }
npx()  { lazy_load_nvm; npx "$@"; }
yarn() { lazy_load_nvm; yarn "$@"; }

# JAVA JDK
export JAVA_HOME=/usr/lib/jvm/jdk-25.0.3+9
export PATH=$JAVA_HOME/bin:$PATH


# ========================= Conda ==========================
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/manhdungnguy/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/manhdungnguy/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/manhdungnguy/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/manhdungnguy/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Debug zsh startup time
# zprof
