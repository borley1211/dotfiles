function reenv() {
    _paths=("/bin" "/usr/bin" "/usr/local/bin")
    _paths=(${_paths} "$HOME/bin" "$HOME/.local/bin")
    _paths=(${_paths} "$HOME/.cargo/bin")
    _paths=(${_paths} "$HOME/node_modules/.bin")
    _paths=(${_paths} "$HOME/go/bin")

    #[TIPS]
    # If you want to add /path/to/some_dir to `PATH` envvar,
    # you can do as below:
    ##  _paths=(${_paths} "/path/to/some_dir")
    # or:
    ##$ reenv "/path/to/some_dir"

    _new_path="$@"
    _paths=(${_paths} ${_new_path})

    for _p in ${_paths}; do
        if [ -d ${_p} ]; then
            export PATH="${PATH}:${_p}"
        fi
    done
}
reenv
alias reenv

#[n and npm]
export N_PREFIX=$HOME/.n
reenv "$N_PREFIX/bin"

##[Encoding]
export LANG=ja_JP.UTF-8
export LC_ALL=$LANG
export VTE_CJK_WIDTH=2

#[tmp]
export TMPDIR=/tmp

##[Python]
export PIP_DEFAULT_TIMEOUT=1200

if [ -d "${HOME}/.pyenv" ]; then
    export PYENV_ROOT="${HOME}/.pyenv"
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
    export PIPENV_PYTHON="${PYENV_ROOT}/shims/python"
fi

eval "$(pip completion --${SHELL})"

export PIPENV_VENV_IN_PROJECT=1
if [ python -m pipenv ] >/dev/null 2>&1; then
    eval "$(pipenv --completion)"
    export PIPENV_CACHE_DIR=$TMPDIR
    export PIPENV_TIMEOUT=1200
    export PIPENV_INSTALL_TIMEOUT=$PIPENV_TIMEOUT
    export PIPENV_SKIP_LOCK=1
fi

#[RustUp]
if [ -f "~/.rustup/env" ]; then
    source ~/.rustup/env
fi

#[NeoVim]
export EDITOR="nvim"
export VISUAL=$EDITOR
export NVIM_COC_LOGFILE="coc.log"

#[XDG envs]
export XDG_RUNTIME_DIR=$HOME
export XDG_CONFIG_DIR=${HOME}/.config

#[Powerline]
if [ -e powerline-daemon ]; then
    powerline-daemon -q

    while read p; do
        PYPKGDIR=(${PYPKGDIR:-} ${p})
    done < <(python -c 'import sys; print("\n".join(p for p in sys.path if "site-packages" in p))')

    PWLIN_INIT="powerline/bindings/zsh/powerline.zsh"

    for WKDIR in ${PYPKGDIR}; do
        if [ -f ${WKDIR} ]; then
            source ${WKDIR}/${PWLIN_INIT}
            break
        fi
    done
fi

##[LLVM]
export LLVM_CONFIG="$(ls -dr1 $(find /usr/bin -path '*llvm-config*') | head -n 1)"

##[Dotfiles]
export DOTPATH=~/Dotfiles
