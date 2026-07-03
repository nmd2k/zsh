# ~/.config/zsh/prompt.zsh

# Prevent Python virtualenv from polluting the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

FUNCNEST=100

eval "$(starship init zsh)"

# export ZSH="/bin/zsh"
# ZSH_THEME = "af-magic"
# source $ZSH/oh-my-zsh.sh

# neofetch
fastfetch
