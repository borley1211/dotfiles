#!bash
. ../install

if can_use_sudo; then
    sudo apt-get install zsh chsh -y
else
    apt-get install zsh chsh -y
fi

exit 0
