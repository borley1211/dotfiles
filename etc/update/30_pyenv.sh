#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

update_pyenv() {
    PYVERSION_GLOBAL=$(pyenv version-name)
    pyenv update
    pyenv migrate $PYVERSION_GLOBAL $PYVERSION_GLOBAL
}

logexec update_pyenv
exit 0
