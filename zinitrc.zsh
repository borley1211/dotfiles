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

# trapd00r/zsh-syntax-highlighting-filetypes は zinit の関数スコープで
# typeset -a した配列が消え、self-insert のラップだけ残る。
# キー入力のたびに _zsh_highlight-zle-buffer が失敗するため読み込まない。
# zinit light trapd00r/zsh-syntax-highlighting-filetypes

zinit light jgogstad/zsh-mask

zinit ice pick"url/url-highlighter.zsh"; zinit light ascii-soup/zsh-url-highlighter

zinit cdclear -q > /dev/null

