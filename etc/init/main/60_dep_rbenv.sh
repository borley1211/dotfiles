#!/bin/bash
source "${DOTPATH:-~/Dotfiles}/etc/install"

resolve_deps_for_rbenv() {
    sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev -y
}

logexec resolve_deps_for_rbenv
exit 0
