#!bash
echo ""
echo "** RUNNING $(basename $0) **"

# install pyenv and plugins
if [ ! -d "$HOME/.pyenv" ]; then
    git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
else
    echo "pyenv is already exists."
fi
eval "$(pyenv init -)"

# install pyenv-ccache
#sudo apt -y install ccache
if [ ! -e "$(pyenv root)/plugins/pyenv-ccache" ]; then
    git clone https://github.com/yyuu/pyenv-ccache.git $(pyenv root)/plugins/pyenv-ccache
fi

# install pyenv-pip-migrate
if [ ! -e "$(pyenv root)/plugins/pyenv-pip-migrate" ]; then
    git clone git://github.com/pyenv/pyenv-pip-migrate.git $(pyenv root)/plugins/pyenv-pip-migrate
fi

# install pyenv-virtualenv
if [ ! -e "$(pyenv root)/plugins/pyenv-virtualenv" ]; then
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi

# install pyenv-update
if [ ! -e "$(pyenv root)/plugins/pyenv-update" ]; then
    git clone https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update
fi

# install dependencies for build python
#sudo apt -y install gcc make libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev

echo "** FINISHED **"
exit 0
