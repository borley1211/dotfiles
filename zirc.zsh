# Zinit config

# - PRE
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
typeset -A ZI
ZI[BIN_DIR]="${HOME}/.zi/bin"
source "${ZI[BIN_DIR]}/zi.zsh"

# - HIGHLIGHTING
zi load zsh-users/zsh-syntax-highlighting
# syntax highlighting with dircolors
zi load trapd00r/zsh-syntax-highlighting-filetypes
# check url
zi light ascii-soup/zsh-url-highlighter
# generate color from $LS_COLORS
# zi light marlonrichert/zcolors

# - HISTORY
zi light jimhester/per-directory-history
#  mask secret for history
zi light jgogstad/passwordless-history

# - COMPLETIONS
# default completions
zi light zsh-users/zsh-autosuggestions
zi light zsh-users/zsh-completions
# for npm
zi light lukechilds/zsh-better-npm-completion
# for anyenv
#zi light ress997/zsh-completions-anyenv

# - SEARCH
# fzf
zi ice from"gh-r" as"program"
zi load junegunn/fzf
# fzf-history-search
zi ice lucid wait'0'
zi light joshskidmore/zsh-fzf-history-search
# anyframe - fuzzy history search
# zi light mollifier/anyframe

# - OTHERS
# interactive-cd
zi ice as"plugin"
zi light b4b4r07/enhancd
# dotofiles manager
zi light ssh0/dot
# 略語登録/展開
zi load momo-lab/zsh-abbrev-alias

# - RELOAD_COMPLETIONS
zi cdclear -q >/dev/null
zi compinit >/dev/null
