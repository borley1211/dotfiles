#!/bin/bash
# zsh プラグイン（sheldon は Homebrew 管理。.zshrc は Dotfiles 側で管理するので書き換えない）
set -eu
eval "$(/opt/homebrew/bin/brew shellenv)"
command -v sheldon >/dev/null || brew install sheldon
sheldon lock
