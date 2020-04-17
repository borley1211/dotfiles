#!/bin/bash
# shellcheck disable=SC1090,SC2016
source ~/.cargo/env
sudo apt install pkg-config -y

cargo install cargo-update topgrade

cargo install starship && ( echo 'eval $( starship init zsh )' >> "$HOME/.zshrc" )

cargo install procs exa

sudo apt install libclang1 -y
cargo install bat
