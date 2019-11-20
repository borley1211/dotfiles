#!/bin/bash
source ${DOTPATH}/etc/install

init_cargo_pkgs() {
    cargo install cargo-update starship
}

logexec init_cargo_pkgs
