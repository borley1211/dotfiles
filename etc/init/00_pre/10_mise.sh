#!/bin/bash
# CLI ツール・言語ランタイムは mise（~/.config/mise/config.toml）で一括導入する
# 前提: make deploy 済みで config.toml がリンクされていること
set -eu
eval "$(/opt/homebrew/bin/brew shellenv)"
command -v mise >/dev/null || brew install mise
mise trust "${HOME}/.config/mise/config.toml"
mise install
