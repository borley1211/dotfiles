#!/bin/bash
# for pyenv
DEPENDENCIES=("gcc" "libssl-dev" "libbz2-dev" "libreadline-dev" "libsqlite3-dev" "zlib1g-dev")

# for pyenv-ccache
DEPENDENCIES=("${DEPENDENCIES[@]}" "ccache")

sudo apt install "${DEPENDENCIES[@]}" -y