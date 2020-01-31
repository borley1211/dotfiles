#!${SHELL}
function pathadd() {
    _new_path="$*"

	if [ 0 -eq $# ]; then
        echo "  Usage : $ reenv <PATH_TO_ADD> [, ...]"
	else
	    for _p in ${_new_path}; do
	        if [ -d "${_p}" ]; then
	            export PATH="${PATH}:${_p}"
	        fi
	    done
	fi
}
alias pathadd=pathadd

#[Local Binaries]
pathadd ~/.local/bin

#[n and npm]
export N_PREFIX="${HOME}/n"
export PATH="$N_PREFIX/bin:${PATH}"

##[Encoding]
export LANG=ja_JP.UTF-8
export LC_ALL=${LANG}
export VTE_CJK_WIDTH=2

#[tmp]
export TMPDIR=/tmp

##[Python]
export PIP_DEFAULT_TIMEOUT=1200

if [ -e "${HOME}/.pyenv" ]; then
    export PYENV_ROOT="${HOME}/.pyenv"
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PIPENV_PYTHON="${PYENV_ROOT}/shims/python"
fi

eval "$(python -m pip completion --$(basename ${SHELL}))"

export PIPENV_VENV_IN_PROJECT=1
if python -m pipenv >/dev/null 2>&1; then
    eval "$(pipenv --completion)"
    export PIPENV_CACHE_DIR=$TMPDIR
    export PIPENV_TIMEOUT=1200
    export PIPENV_INSTALL_TIMEOUT=$PIPENV_TIMEOUT
    export PIPENV_SKIP_LOCK=1
fi

#[RustUp]
[ -f "${HOME}/.cargo/env" ] && . ~/.cargo/env

#[NeoVim]
export EDITOR="nvim"
export VISUAL=${EDITOR}
export NVIM_COC_LOGFILE="coc.log"

#[XDG envs]
export XDG_RUNTIME_DIR=${HOME}
export XDG_CONFIG_DIR=${HOME}/.config

#[Powerline]
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

##[LLVM]
export LLVM_CONFIG="$(ls -dr1 $(find /usr/bin -path '*llvm-config*') | head -n 1)"

##[Dotfiles]
export DOTPATH="${HOME}/Dotfiles"
alias dotutil="make -C ${DOTPATH}"

##[goenv]
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

##[fzf]
[ -f "${HOME}/.fzf.${SHELL}" ] && . ~/.fzf.${SHELL}
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

##[Qt]
export QT_QPA_PLATFORMTHEME=qt5ct

##[rbenv]
export PATH="$HOME/.rbenv/bin:$PATH"
[ -d "${HOME}/.rbenv" ] && eval "$(rbenv init -)"

##[WSL]
if ( uname -r | grep -iq 'microsoft' ) ; then
    LOCAL_IP=$(cat < /etc/resolv.conf | grep nameserver | awk '{print $2}')
    export DISPLAY="$LOCAL_IP:0.0"
    export XDG_SESSION_TYPE="x11"
    export DOCKER_HOST="tcp://$LOCAL_IP:2375"

    if [[ -o login ]]; then
        sudo service dbus start ; sudo service x11-common start
    fi
fi
