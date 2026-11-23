#!/bin/zsh

# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"


# Load Shell Config
source "${DOTPATH:-${HOME}/Dotfiles}/rc.sh"
source "${DOTPATH:-${HOME}/Dotfiles}/setenv.sh"
source "${HOME}/.zshrc.local"
source "${HOME}/.zaliases"


# Load Tools

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

# mise
# * starship など各種ツールの前に配置すること
eval "$(mise activate zsh)"

# Starship
eval "$(starship init zsh)"

# sheldon. compinit は plugins.toml の inline（zsh-completions の直後、1 回だけ）。
# --quiet はロック確認のログをプロンプトの上に出さない。毎起動 source する。
eval "$(sheldon --quiet source)"

# # broot - cli file manager
# source "${HOME}/.config/broot/launcher/bash/br"


export PATH="$PATH:$HOME/.local/bin"


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

source /Users/borley1211/.config/broot/launcher/bash/br
