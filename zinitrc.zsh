# Zinit config

typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit ice from"gh-r" as"program"; zinit load junegunn/fzf-bin

zinit light mollifier/anyframe

zinit ice as"plugin"; zinit light b4b4r07/enhancd

zinit ice wait"!0"; zinit load wting/autojump

zinit light ssh0/dot

zinit light ress997/zsh-completions-anyenv

zinit compinit

