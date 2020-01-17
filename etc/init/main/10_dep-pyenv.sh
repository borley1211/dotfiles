#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

install_deps_for_pyenv() {
    # for pyenv
    DEPENDENCIES=("gcc" "libssl-dev" "libbz2-dev" "libreadline-dev" "libsqlite3-dev" "zlib1g-dev")

    # for pyenv-ccache
    DEPENDENCIES=("${DEPENDENCIES[@]}" "ccache")

    sudo apt-get install "${DEPENDENCIES[@]}" -y
}

logexec install_deps_for_pyenv
exit 0
