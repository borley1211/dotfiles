#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

update_rustup_and_cargo_pkgs() {
    rustup update
    cargo install-update --all
}

logexec update_rustup_and_cargo_pkgs
exit 0
