# Zinit config

typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

zinit wait lucid light-mode for \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

zinit light hlissner/zsh-autopair

zinit light lukechilds/zsh-better-npm-completion

zinit ice from"gh-r" as"program"; zinit load junegunn/fzf

zinit ice atinit'export ENHANCD_COMMAND=ecd ENHANCD_FILTER=fzf'
zinit load babarot/enhancd

zinit light ssh0/dot

zinit cdclear -q > /dev/null ; zinit compinit > /dev/null

