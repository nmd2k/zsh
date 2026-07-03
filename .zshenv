# ~/.config/zsh/.zshenv
# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"

# ---------- GPG ----------
export GPG_TTY=$(tty)

# ---------- Pager ----------
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat -l man -p"
elif command -v batcat >/dev/null 2>&1; then
  export MANPAGER="batcat -l man -p"
fi

# color
export TERM="xterm-256color"

# ========================= Personal PATH ==========================
# # Local bin
# export PATH="$HOME/.local/bin:$PATH"
#
# # JAVA JDK
# export JAVA_HOME=/usr/lib/jvm/jdk-25.0.3+9
# export PATH=$JAVA_HOME/bin:$PATH
#
# # opencode
# export PATH="$HOME/.opencode/bin:$PATH"
