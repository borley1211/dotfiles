##--Define Variables--##

# SUFFIX_OF_SCRIPTS
SUFFIX	:= sh

# SCRIPTS
## paths
PREINITDIR	:= etc/init/pre
SYSINITDIR	:= etc/init/system
LAZYINITDIR	:= etc/init/lazy
## get items
SYSINITSCRIPTS	:= $(sort $(wildcard $(SYSINITDIR)/??*.$(SUFFIX)))
PREINITSCRIPTS	:= $(sort $(wildcard $(PREINITDIR)/??*.$(SUFFIX)))
LAZYINITSCRIPTS	:= $(sort $(wildcard $(LAZYINITDIR)/??*.$(SUFFIX)))

# DOTFILES
DOTPATH	:= $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES	:= $(wildcard .??* .config/??*.??* .config/??*rc .config/??*/??*.??* )
CONFIGDIRS	:= $(filter-out %rc %.toml %.ini %.cfg %.dirs, $(wildcard .config/??* .config/??*/??*.d))
CANDIDATES	:= $(CANDIDATES) $(foreach DIR,$(CONFIGDIRS),$(wildcard $(DIR)/??*)) package.json $(wildcard .jupyter/??*.??* ) Pipfile
EXCLUSIONS	:= .DS_Store .git .gitmodules .gitignore .travis.yml .config .vscode .Xresources-regolith $(CONFIGDIRS) .themes .icons .venv
DOTFILES	:= $(sort $(filter-out $(EXCLUSIONS),$(CANDIDATES)))

# SUBMODULES
SUBMODULES	= .cache/dein $(wildcard .themes/??* .icons/??*)

# for WIN
WIN_HOME	:= /mnt/c/Users/kmise

#--Define Functions--#

# DEFINE FUNCTIONS
define mkdir_safety
mkdir -p $1

endef

define deploy_file
ln -sfv $1 $2

endef

define deploy_dir
ln -sfvn $1 $2

endef

define run
./etc/util/logexec $1

endef

define rm_recursive
rm -vrf $1

endef

# - ON EACH OS
define _list
echo $1

endef

##--Setup all tasks--##

DEPLOY	= $(foreach val, $(CONFIGDIRS), \
	$(call mkdir_safety,$(HOME)/$(val)))\
	$(foreach val,$(DOTFILES), \
	$(call deploy_file,$(realpath $(val)),$(HOME)/$(val)))

DEPLOY-MODULE	= $(foreach val, $(SUBMODULES), \
	$(call deploy_dir, $(realpath $(val)), $(HOME)/$(val)))

DEPLOY_WIN	= $(foreach val, $(CONFIGDIRS), \
	$(call mkdir_safety,$(WIN_HOME)/$(val)))\
	$(foreach val,$(DOTFILES), \
	$(call deploy_file,$(realpath $(WIN_HOME)/Dotfiles/$(val)),$(WIN_HOME)/$(val)))

INIT_SYS	:= $(foreach val, $(SYSINITSCRIPTS),$(call run, $(abspath $(val))))
INIT_PRE	:= $(foreach val, $(PREINITSCRIPTS),$(call run, $(abspath $(val))))
INIT_LAZY	:= $(foreach val, $(LAZYINITSCRIPTS),$(call run, $(abspath $(val))))

CLEAN	= $(foreach val, $(DOTFILES), \
	$(call rm_recursive,$(HOME)/$(val)))

UPDATE	:= $(foreach val,$(UPDATES),$(call run,$(abspath $(val))))


##--MAIN--##

.DEFAULT_GOAL	:= help

all:

credit:## Show credit
	@echo 'Copyright (c) 2013-2015 BABAROT, 2019- BORLEY All Rights Reserved.'
	@echo ''

list:## Show dot files in this repo
	@$(foreach val, "--DOT FILES--"$(DOTFILES)"--CONFIG DIRECTORIES--"$(CONFIGDIRS), $(call _list,$(val)))

deploy-file:## Create symlink to home directory (FILES)
	@$(DEPLOY)

deploy-submodule:## Create symlink to home directory (SUBMODULES)
	@$(DEPLOY-MODULE)

deploy:credit deploy-file deploy-submodule ## Create symlink to home directory

deploy-win:## Create symlink to WIN_HOME directory
	@$(DEPLOY_WIN)

init-pre:## Setup environment settings (PRE)
	@$(INIT_PRE)

init-lazy:## Setup environment settings (LAZY)
	@$(INIT_LAZY)

init-system:## Setup environment settings (System-Wide)
	@$(INIT_SYS)

init-fake:## Test for init
	@$(call run,./etc/util/do_nothing)

init:init-pre init-lazy ## Setup HEAD and LAZY environment settings

test:## Test dotfiles and init scripts (now DEPRECATED)
	@#DOTPATH = $(DOTPATH)bash $(DOTPATH)/etc/test/test.sh
	@echo "test is inactive temporarily"

update:## Fetch changes for this repo
	git pull origin master
	git submodule init
	git submodule update --remote
	git submodule foreach git pull origin master

install:update deploy init ## Run make update, deploy, init

clean:## Remove the dot files
	@echo '==> Remove dotfiles in your home directory...'
	@$(CLEAN)

purge:clean ## Run 'clean' and remove self
	$(call rm_recursive, $(DOTPATH))

help:credit ## Self - documented Makefile
	@grep - E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)\ | sort \ | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
