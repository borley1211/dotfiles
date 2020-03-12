#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

init_cargo_pkgs() {
    source ~/.cargo/env
    cargo install cargo-update starship topgrade
}

logexec init_cargo_pkgs
exit 0
