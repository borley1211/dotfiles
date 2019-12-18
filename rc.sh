function pathappend() {
    pathremove $1
    export PATH="$PATH:$1"
}
function pathprepend() {
    pathremove $1
    export PATH="$1:$PATH"
}
function pathremove() { export PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//i'); }

function pathmgr() {
    subcmd=$1
    args=${@:2}

    if ( ($# < 1) ) ; then
        echo "  Usage : $ pathmgr COMMAND[a(append), p(prepend), r(remove), s(show)] PATH[, ...]"
    else
        case $subcmd in
            a | append)
                for p in ${args[@]}; do
                    pathappend $p
                done
            ;;
            p | prepend)
                for p in ${args[@]}; do
                    pathprepend $p
                done
            ;;
            r | remove)
                for p in ${args[@]}; do
                    pathremove $p
                done
                ;;
            s | show)
                echo $PATH
                ;;
            *)
                echo "COMMAND: a(append), p(prepend), r(remove), s(show)"
                return 1
                ;;
        esac
    fi
    return 0
}

# - Local Binaries
pathappend ~/.local/bin

# - n and npm
export N_PREFIX="${HOME}/n"
export PATH="$N_PREFIX/bin:${PATH}"

# - Encoding
export LANG=ja_JP.UTF-8

# - Python
export PIP_DEFAULT_TIMEOUT=1200

if [ -e "${HOME}/.pyenv" ]; then
    export PYENV_ROOT="${HOME}/.pyenv"
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PIPENV_PYTHON="${PYENV_ROOT}/shims/python"
fi

eval $(python -m pip completion --$(basename ${SHELL:-zsh}))

export PIPENV_VENV_IN_PROJECT=1
if python -m pipenv >/dev/null 2>&1; then
    eval "$(pipenv --completion)"
    export PIPENV_CACHE_DIR=$TMPDIR
    export PIPENV_TIMEOUT=1200
    export PIPENV_INSTALL_TIMEOUT=$PIPENV_TIMEOUT
    #export PIPENV_SKIP_LOCK=1
fi

# - RustUp
[ -f "${HOME}/.cargo/env" ] && . ~/.cargo/env

# - NeoVim
export EDITOR="nvim"
export VISUAL=${EDITOR}
export NVIM_COC_LOGFILE="coc.log"

# - Powerline
if [ -e powerline-daemon ]; then
    powerline-daemon -q

    while read -r p; do
        PYPKGDIR=("${PYPKGDIR:-}" "$p")
    done < <(python -c 'import sys; print("\n".join(p for p in sys.path if "site-packages" in p))')

    PWLIN_INIT="powerline/bindings/zsh/powerline.zsh"

    for WKDIR in $PYPKGDIR; do
        if [ -f "$WKDIR" ]; then
            source ${WKDIR}/${PWLIN_INIT}
            break
        fi
    done
fi

# - LLVM
export LLVM_CONFIG="$(ls -dr1 $(find /usr/bin -path '*llvm-config*') | head -n 1)"

# - Dotfiles
export DOTPATH="${HOME}/Dotfiles"
alias dotutil="make -C ${DOTPATH}"

# - goenv
if [ -e "${HOME}/.goenv" ]; then
    export GOENV_ROOT="$HOME/.goenv"
    export PATH="$GOENV_ROOT/bin:$PATH"
    eval "$(goenv init -)"
    export PATH="$GOROOT/bin:$PATH"
    export PATH="$PATH:$GOPATH/bin"
fi

# - fzf
[ -f "${HOME}/.fzf.${SHELL}" ] && . ~/.fzf.${SHELL}
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# - Qt
#export QT_QPA_PLATFORMTHEME=qt5ct

# - rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
[ -d "${HOME}/.rbenv" ] && eval "$(rbenv init -)"

# - WSL
if (uname -r | grep -iq 'microsoft'); then
    LOCAL_IP=$(cat </etc/resolv.conf | grep nameserver | awk '{print $2}')
    export DISPLAY="$LOCAL_IP:0.0"
    export LIBGL_ALWAYS_INDIRECT=1
    export XDG_SESSION_TYPE="x11"
    export DOCKER_HOST="tcp://$LOCAL_IP:2375"
    export HTCACHECLEAN_PATH="$TMPDIR/http"
    #export PULSE_SERVER="$LOCAL_IP:9697"

    #[Ignore NPM in 'WIN_HOME']
    pathmgr remove $NODE_ROOT 
    pathmgr remove $(dirname "$NODE_ROOT")

    # Services (init.d)
    SERVICES=(dbus cron x11-common apache-htcacheclean)
    for name in $SERVICES; do
        if ! (service $name status); then
            sudo service $name start
        fi
    done

    # zfs-fuse
    if [[ -o login ]]; then
        sudo service zfs-fuse start
    fi
fi

# - dot (dotfiles manager)
export DOT_REPO="https://github.com/borley1211/dotfiles"
export DOT_DIR="$DOTPATH"

# - anyenv
if [ -e "$HOME/.anyenv" ]; then
    pathprepend "$HOME/.anyenv/bin"
    eval "$(anyenv init -)"
fi

##[WSL]
if [ uname -r | grep -i 'microsoft' ]; then
    LOCAL_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
    export DISPLAY="$LOCAL_IP":0
fi
