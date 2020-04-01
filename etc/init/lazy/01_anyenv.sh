#!/bin/bash
source "${DOTPATH:-~/Dotfiles}/etc/install"

function init_anyenv() {
    git clone https://github.com/anyenv/anyenv ~/.anyenv
    export PATH="$HOME/.anyenv/bin:$PATH"
    anyenv init
    anyenv install --init

    mkdir -p $(anyenv root)/plugins
    git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

    anyenv install goenv
    anyenv install rbenv
    anyenv install nodenv
}

logexec init_anyenv
