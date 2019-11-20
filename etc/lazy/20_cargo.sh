#!/usr/bin/bash
source ../install

init_cargo_pkgs() {
    cargo install cargo-update starship
}

logexec init_cargo_pkgs
