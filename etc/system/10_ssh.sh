#!/bin/bash
source ${DOTPATH}/etc/install

init_ssh() {
    if can_use_sudo; then
        sudo apt-get install ssh openssh-server -y
        sudo systemctl daemon-reload
        sudo systemctl enable --now sshd.service
    else
        apt-get install ssh openssh-server -y
        systemctl daemon-reload
        systemctl enable --now sshd.service
    fi
}

logexec init_ssh
