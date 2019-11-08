#!/bin/bash

# install pyenv and plugins
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# install pyenv-ccache
sudo apt -y install ccache
git clone https://github.com/yyuu/pyenv-ccache.git $(pyenv root)/plugins/pyenv-ccache

# install pyenv-pip-migrate
git clone git://github.com/pyenv/pyenv-pip-migrate.git $(pyenv root)/plugins/pyenv-pip-migrate

# install dependencies for build python
sudo apt -y install gcc make libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev
