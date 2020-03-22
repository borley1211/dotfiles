source ${DOTPATH:-~/Dotfiles}/etc/install

init_ssh() {
    sudo apt-get install ssh openssh-server -y
    sudo systemctl daemon-reload
    sudo systemctl enable --now sshd.service
}

logexec init_ssh
