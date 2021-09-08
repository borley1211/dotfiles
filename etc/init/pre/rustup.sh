#!/bin/bash
# echo "DEPRECATED"
# exit 0

# MAIN
#
cd ~/
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env

COMPLETIONSPATH="${HOME}/.local/share/bash-completion/completions"
mkdir -p "${COMPLETIONSPATH}"
rustup completions bash >${COMPLETIONSPATH}/rustup
rustup completions bash cargo >${COMPLETIONSPATH}/cargo

mkdir -p ~/.zfunc
rustup completions zsh >~/.zfunc/_rustup
rustup completions zsh cargo >~/.zfunc/_cargo