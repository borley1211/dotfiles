#!bash
source "../install"
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

# install dependencies for build python
#sudo apt -y install 

echo "** FINISHED **"
exit 0
