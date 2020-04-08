#!/bin/bash
echo "DEPRECATED"
exit 0

# main script
if ! type "n" >/dev/null; then
    curl -L https://git.io/n-install | bash
else
    log_info "It seems you've already installed n and npm. Exit."
fi
export PATH="${HOME}/n/bin:${PATH}"
cd ~ || exit
n lts
npm --version
npm install npm -g
npm update
npm doctor
npm dedupe
npm audit fix