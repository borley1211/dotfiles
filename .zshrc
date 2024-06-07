# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
#!/bin/zsh

# load_my_config
source "${DOTPATH:-${HOME}/Dotfiles}/rc.sh"
source "${DOTPATH:-${HOME}/Dotfiles}/setenv.sh"
source "${HOME}/.zshrc.local"
source "${HOME}/.zaliases"
source "$DOTPATH/zirc.zsh"


# Homebrew
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# Homebrew: Python
# export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

# Starship
eval "$(starship init zsh)"

# zi
if [[ ! -f "${HOME}/.zi/bin/zi.zsh" ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "${HOME}/.zi" && command chmod go-rwX "${HOME}/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "${HOME}/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "${HOME}/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://wiki.zshell.dev/ecosystem/category/-annexes
zicompinit # <- https://wiki.zshell.dev/docs/guides/commands

# broot - cli file manager
source "${HOME}/.config/broot/launcher/bash/br"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
