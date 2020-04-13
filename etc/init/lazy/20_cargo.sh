#!/bin/bash
source ~/.cargo/env
sudo apt install pkg-config -y
cargo install cargo-update topgrade
cargo install starship && ( echo 'eval $( starship init zsh )' >> "$HOME/.zshrc" )
