#!/bin/zsh
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# load_my_config
source "${DOTPATH:-${HOME}/Dotfiles}/rc.sh"
source "${DOTPATH:-${HOME}/Dotfiles}/setenv.sh"
source "${HOME}/.zshrc.local"
source "${HOME}/.zaliases"
# source "$DOTPATH/zirc.zsh"


# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
# Homebrew: Python
# export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

# Starship
eval "$(starship init zsh)"

# zi
# if [[ ! -f "${HOME}/.zi/bin/zi.zsh" ]]; then
#   print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
#   command mkdir -p "${HOME}/.zi" && command chmod go-rwX "${HOME}/.zi"
#   command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "${HOME}/.zi/bin" && \
#     print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
#     print -P "%F{160}▓▒░ The clone has failed.%f%b"
# fi
# source "${HOME}/.zi/bin/zi.zsh"
# autoload -Uz _zi
# (( ${+_comps} )) && _comps[zi]=_zi
# # examples here -> https://wiki.zshell.dev/ecosystem/category/-annexes
# zi compinit # <- https://wiki.zshell.dev/docs/guides/commands

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
[ ! -d "$ZINIT_HOME"/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# shellcheck disable=SC1091
source "${ZINIT_HOME}/zinit.zsh"
## load my config
source "${DOTPATH}/zinitrc.zsh"

# sheldon - zsh pkg manager
eval "$(sheldon source)"

# # broot - cli file manager
# source "${HOME}/.config/broot/launcher/bash/br"

# zsh post block (completion)
autoload -Uz compinit
compinit

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

