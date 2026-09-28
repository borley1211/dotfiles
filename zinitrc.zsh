# Zinit config

typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

zinit wait lucid light-mode for \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

zinit light hlissner/zsh-autopair

zinit light lukechilds/zsh-better-npm-completion

zinit ice atinit'export ENHANCD_COMMAND=ecd ENHANCD_FILTER=fzf'
zinit load babarot/enhancd

zinit light ssh0/dot

zinit light zsh-users/zsh-syntax-highlighting

zinit light trapd00r/zsh-syntax-highlighting-filetypes

zinit light jgogstad/zsh-mask

zinit ice pick"url/url-highlighter.zsh"; zinit light ascii-soup/zsh-url-highlighter

zinit cdclear -q > /dev/null

