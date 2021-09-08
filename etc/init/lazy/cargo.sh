#!/bin/bash
# shellcheck disable=SC1090,SC2016

# echo "DEPRECATED"
# exit 0

# MAIN
#
source ~/.cargo/env
sudo apt install pkg-config -y

cargo install cargo-update topgrade sccache

cargo install starship && ( echo 'eval $( starship init zsh )' >> "$HOME/.zshrc" )

cargo install procs exa

sudo apt install libclang1 -y
cargo install bat
