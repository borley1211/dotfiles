#!/bin/bash
# install pyenv and plugins
if [ ! -d "$HOME/.pyenv" ]; then
    curl https://pyenv.run | bash
else
    echo "pyenv is already exists."
fi
export PATH="/home/borley/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# install pyenv-ccache
if [ ! -e "$(pyenv root)/plugins/pyenv-ccache" ]; then
    git clone https://github.com/yyuu/pyenv-ccache.git $(pyenv root)/plugins/pyenv-ccache
fi

# install pyenv-pip-migrate
if [ ! -e "$(pyenv root)/plugins/pyenv-pip-migrate" ]; then
    git clone git://github.com/pyenv/pyenv-pip-migrate.git $(pyenv root)/plugins/pyenv-pip-migrate
fi
