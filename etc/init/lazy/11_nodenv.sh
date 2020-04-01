#!/bin/bash
source "${DOTPATH}/etc/install"

function init_nodejs () {
    nodenv install nightly
    nodenv rehash
    nodenv global nightly
    cd ~
    npm install
}

logexec init_nodejs
