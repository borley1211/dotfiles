# Zinit config


typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"


zinit light zsh-users/zsh-autosuggestions

zinit light zsh-users/zsh-completions

zinit light zdharma/fast-syntax-highlighting

zinit light zdharma/history-search-multi-word


zinit light lukechilds/zsh-better-npm-completion

zinit ice from"gh-r" as"program"; zinit load junegunn/fzf

zinit light mollifier/anyframe

zinit ice as"plugin"; zinit light b4b4r07/enhancd

zinit ice wait"!0"; zinit load wting/autojump

zinit light ssh0/dot

#zinit light ress997/zsh-completions-anyenv

zinit load momo-lab/zsh-abbrev-alias

zinit cdclear -q > /dev/null ; zinit compinit > /dev/null

