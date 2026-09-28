# Zinit config

typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

zinit wait lucid light-mode for \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

zinit light hlissner/zsh-autopair

zinit light lukechilds/zsh-better-npm-completion

zinit light mollifier/anyframe

export ENHANCD_COMMAND="ecd"; zinit load babarot/enhancd

zinit light ssh0/dot

#zinit light ress997/zsh-completions-anyenv

zinit load momo-lab/zsh-abbrev-alias

zinit light zsh-users/zsh-syntax-highlighting

zinit light trapd00r/zsh-syntax-highlighting-filetypes

zinit light jgogstad/passwordless-history

zinit ice pick"url/url-highlighter.zsh"; zinit light ascii-soup/zsh-url-highlighter

zinit cdclear -q > /dev/null

