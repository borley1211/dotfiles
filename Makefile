##--Define Variables--##

# SUFFIX_OF_SCRIPTS
ifeq ($(OS), Windows_NT)
SUFFIX	:= ps1
else
SUFFIX	:= sh
endif

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
CANDIDATES	:= $(wildcard .??* .config/??* .??* .config/??* rc .config/??*/??* .??* )
CONFIGDIRS	:= $(filter-out %rc %.toml %.ini %.cfg %.dirs, $(wildcard .config/??* .config/??*/??*.d))
CANDIDATES	:= $(CANDIDATES)$(foreach DIR, $(CONFIGDIRS), $(wildcard $(DIR)/??* )) package.json $(wildcard .jupyter/??*.??* ) Pipfile
EXCLUSIONS	:= .DS_Store .git .gitmodules .gitignore .travis.yml .config .vscode .Xresources-regolith $(CONFIGDIRS)
DOTFILES	:= $(sort $(filter-out $(EXCLUSIONS), $(CANDIDATES)))

# SUBMODULES
SUBMODULES	= .cache/dein $(wildcard .themes/??* .icons/??*)

#--Define Functions--#

# DEFINE FUNCTIONS
# - ON WINDOWS
ifeq ($(OS), Windows_NT)

define set_config_home
$(subst .config/, AppData/Local/, $1)
endef

define mkdir_safety
cmd /C "setlocal enableextensions & md $(subst /,\,$1) & endlocal"

endef

#uutils ln - sfv $1 $2
define deploy_file
cmd /C mklink $(subst /, \, $2)$(subst /, \, $1)

endef

define deploy_dir
cmd /C mklink $(subst /, \, $2)$(subst /, \, $1)

endef

define run
powershell - NoLogo $1

endef

define rm_recursive
cmd /C "del $(subst /,\,$1)"

endef

define deploy_on_win
cmd /C mklink $(subst /, \, $2)$(subst /, \, $1)

endef

define clean_on_win
cmd /C "del $(subst /,\,$1)"

endef

else
# - ON LINUX

define set_config_home
$1
endef

define mkdir_safety
mkdir -p $1

endef

define deploy_file
ln -sfv $1 $2

endef

define deploy_file
ln -sfvn $1 $2

endef

define run
./etc/util/logexec $1

endef

define rm_recursive
rm -vrf $1

endef

define deploy_on_win

endef

define clean_on_win

endef

endif

# - ON EACH OS
define _list
echo $1

endef

##--Setup all tasks--##

DEPLOY	= $(foreach val, $(CONFIGDIRS), \
	$(call mkdir_safety, $(HOME)/$(call set_config_home, $(val))))\
	$(foreach val, $(DOTFILES), \
	$(call deploy_file, $(realpath $(val)), $(HOME)/$(call set_config_home, $(val))))\
	$(call deploy_on_win, $(realpath .config/starship.toml), $(HOME)/.config/starship.toml)\
	$(call deploy_on_win, $(realpath .config/topgrade.toml), $(HOME)/AppData/Roaming/topgrade.toml)\
	$(call deploy_on_win, $(realpath .config/efm-langserver/config.yaml), $(HOME)/.config/efm-langserver/config.yaml)

DEPLOY-MODULE	= $(foreach val, $(SUBMODULES), \
	$(call deploy_dir, $(realpath $(val)), $(HOME)/$(val)))

INIT_SYS	:= $(foreach val, $(SYSINITSCRIPTS), $(call run, $(abspath $(val))))
INIT_PRE	:= $(foreach val, $(PREINITSCRIPTS), $(call run, $(abspath $(val))))
INIT_LAZY	:= $(foreach val, $(LAZYINITSCRIPTS), $(call run, $(abspath $(val))))

CLEAN	= $(foreach val, $(DOTFILES), \
	$(call rm_recursive, $(HOME)/$(call set_config_home, $(val))))\
	$(call clean_on_win, $(HOME)/.config/starship.toml)\
	$(call clean_on_win, $(HOME)/AppData/Roaming/topgrade.toml)

UPDATE	:= $(foreach val, $(UPDATES), $(call run, $(abspath $(val))))


##--MAIN--##

.DEFAULT_GOAL	:= help

all:

credit:## Show credit
	@echo 'Copyright (c) 2013-2015 BABAROT, 2019- BORLEY All Rights Reserved.'
	@echo ''

list:## Show dot files in this repo
	@$(foreach val, "--DOT FILES--"$(DOTFILES)"--CONFIG DIRECTORIES--"$(CONFIGDIRS), $(call _list, $(val)))

deploy-file:## Create symlink to home directory (FILES)
	@$(DEPLOY)

deploy-submodule:## Create symlink to home directory (SUBMODULES)
	@$(DEPLOY-MODULE)

deploy:credit deploy-file deploy-submodule ## Create symlink to home directory

init-pre:## Setup environment settings (PRE)
	@$(INIT_PRE)

init-lazy:## Setup environment settings (LAZY)
	@$(INIT_LAZY)

init-system:## Setup environment settings (System - Wide)
	@$(INIT_SYS)

init:init-pre init-lazy ## Setup HEAD and LAZY environment settings

test:## Test dotfiles and init scripts (now DEPRECATED)
	@#DOTPATH = $(DOTPATH)bash $(DOTPATH)/etc/test/test.sh
	@echo "test is inactive temporarily"

update:## Fetch changes for this repo
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

install:update deploy init ## Run make update, deploy, init

clean:## Remove the dot files
	@echo '==> Remove dotfiles in your home directory...'
	@$(CLEAN)

purge:clean ## Run 'clean' and remove self
	$(call rm_recursive, $(DOTPATH))

help:credit ## Self - documented Makefile
	@grep - E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)\ | sort \ | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
