#!bash
source "../install"
echo ""
logging "INFO" "** RUNNING $(basename $0) **"

# for pyenv
DEPENDENCIES=("gcc" "libssl-dev" "libbz2-dev" "libreadline-dev" "libsqlite3-dev" "zlib1g-dev")

# for pyenv-ccache
DEPENDENCIES=("${DEPENDENCIES}" "ccache")

if can_use_sudo; then
    sudo apt-get install "${DEPENDENCIES[@]}" -y
else
    apt-get install "${DEPENDENCIES[@]}" -y
fi

logging "SUCCESS" "** FINISHED **"
exit 0
