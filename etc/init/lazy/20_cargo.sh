#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

init_cargo_pkgs() {
    cargo install cargo-update starship topgrade
}

logexec init_cargo_pkgs
exit 0
