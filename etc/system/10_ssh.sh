#!/bin/bash
source ${DOTPATH:-~/Dotfiles}/etc/install

init_ssh() {
    apt-get install ssh openssh-server -y
    systemctl daemon-reload
    systemctl enable --now sshd.service
}

su <<EOSU
logexec init_ssh
EOSU
