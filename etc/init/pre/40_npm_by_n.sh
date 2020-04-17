#!/bin/bash
#echo "DEPRECATED"
#exit 0

# main script
sudo apt install npm nodejs -y
if ! type "n" >/dev/null; then
    sudo npm install n -g && sudo apt purge npm nodejs -y
else
    log_info "It seems you've already installed n and npm. Exit."
fi
export PATH="${HOME}/n/bin:${PATH}"
cd ~ || exit
N_PREFIX="$HOME/n" n lts
npm --version
npm install npm -g
npm update
npm doctor
npm dedupe
npm audit fix
