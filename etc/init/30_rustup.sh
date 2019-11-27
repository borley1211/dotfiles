#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

install_rustup() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    exec ${SHELL}

    COMPLETIONSPATH="~/.local/share/bash-completion/completions"
    mkdir -p ${COMPLETIONSPATH}
    rustup completions bash >${COMPLETIONSPATH}/rustup
    rustup completions cargo bash >${COMPLETIONSPATH}/cargo

    mkdir -p ~/.zfunc
    rustup completions zsh >~/.zfunc/_rustup
    rustup completions cargo zsh >~/.zfunc/_cargo
}

logexec install_rustup
exit 0
