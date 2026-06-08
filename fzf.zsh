# =========================================================
# fzf
# =========================================================

export FZF_DEFAULT_COMMAND='fd --type f --type d --strip-cwd-prefix'

# Ctrl-T uses fd
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --hidden" 

# UI
export FZF_DEFAULT_OPTS='
  --height=60%
  --layout=reverse
  --border=rounded
  --prompt="> "
  --pointer="│ "
  --preview-window=right:65%:wrap:border-left
'

export _FZF_PREVIEW_CMD='bat --color=always --style=plain,numbers --line-range=:500 {}'
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

# Ctrl+F: file picker excluding hidden folder (not files)
_fzf_file_no_hidden() {
  local cmd result
  local eza_preview='eza --tree --level=2 --color=always --icons=always {}'

  cmd="${FZF_DEFAULT_COMMAND}"
  # result=$(eval "${cmd:--find . --type d}" | fzf --preview "$eza_preview") \
    # && LBUFFER+="$result"  # LBUFFER is the text left of the cursor
  result=$(fd --type d --max-depth 1 --strip-cwd-prefix | fzf ${_FZF_DEFAULT_OPTS} --preview "$eza_preview")
  
  if [ -n "$result" ]; then
    LBUFFER+="$result/"
  fi
  zle reset-prompt
}
zle -N _fzf_file_no_hidden

# _fzf_file_no_hidden() {
#   local result
#   local eza_preview='eza --tree --level=2 --color=always --icons=always {}'
#
#   # --type d forces folders only. Dropping --hidden ignores hidden items.
#   result=$(fd --type d --strip-cwd-prefix | fzf $FZF_DEFAULT_OPTS --preview "$eza_preview")
#
#   if [ -n "$result" ]; then
#     LBUFFER+="$result/"
#   fi
#   zle reset-prompt
# }
# zle -N _fzf_file_no_hidden
