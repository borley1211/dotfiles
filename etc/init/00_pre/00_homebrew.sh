#!/bin/bash
# Homebrew 本体と Brewfile のパッケージ（mise で扱いにくいもの・GUI アプリ）を入れる
set -eu
if [ ! -x /opt/homebrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle --file="${DOTPATH:-$HOME/Dotfiles}/Brewfile"
