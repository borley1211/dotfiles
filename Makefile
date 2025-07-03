##--Define Variables--##

# SUFFIX_OF_SCRIPTS
SUFFIX	:= sh

# SCRIPTS
## paths
PREINITDIR	:= etc/init/00_pre
LAZYINITDIR	:= etc/init/10_lazy
## get items
PREINITSCRIPTS	:= $(sort $(wildcard $(PREINITDIR)/??*.$(SUFFIX)))
LAZYINITSCRIPTS	:= $(sort $(wildcard $(LAZYINITDIR)/??*.$(SUFFIX)))

# DOTFILES
DOTPATH	:= $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

# Recursively find all files under .config, and combine with other specified files.
# This ensures all nested configuration files are included.
# It excludes directories starting with '_' from the search.
CANDIDATES := $(wildcard .??*) \
              $(shell find .config -path '*/_*' -prune -o -type f -print) \
              package.json \
              Pipfile \
              aqua.yaml \
              $(wildcard .jupyter/??*.??*)

# Define files and directories to exclude from symlinking.
EXCLUSIONS	:= .DS_Store .git .gitmodules .gitignore .travis.yml .config .vscode .Xresources-regolith .themes .icons .venv .gemini .jj
# Filter the candidates to get the final list of files to symlink.
DOTFILES	:= $(sort $(filter-out $(EXCLUSIONS),$(CANDIDATES)))
# Additionally, filter out any .DS_Store files that might be in subdirectories.
DOTFILES	:= $(filter-out %/.DS_Store, $(DOTFILES))

# From the list of files, determine the unique parent directories that need to be created in the HOME directory.
# This ensures that `ln` command will not fail due to missing directories.
CONFIGDIRS	:= $(sort $(patsubst %/,%,$(dir $(DOTFILES))))
CONFIGDIRS	:= $(filter-out ./,$(CONFIGDIRS))

# SUBMODULES
SUBMODULES	= $(wildcard .themes/??* .icons/??*)

# for WIN
WIN_HOME	:= /mnt/c/Users/kmise
EXCLUSIONS_WIN	:= $(wildcard .config/??*.??* .config/??*/??* .config/??*/??*/??* .??*) %rc
DOTFILES_WIN	:= $(sort $(filter-out $(EXCLUSIONS_WIN),$(DOTFILES)))
DOTFILES_WIN_ONCONFIG	:= $(wildcard .config/??*.toml)

#--Define Functions--#

# DEFINE FUNCTIONS
# - ON LINUX
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

# - ON WINDOWS
define set_config_home_win
$(subst .config,AppData/Local,$1)
endef

# - ON EACH_OS
define _list
echo "$1"

endef

##--Setup all tasks--##

DEPLOY	= $(foreach val, $(CONFIGDIRS), \
	$(call mkdir_safety,$(HOME)/$(val)))\
	$(foreach val,$(DOTFILES), \
	$(call deploy_file,$(realpath $(val)),$(HOME)/$(val)))

DEPLOY-MODULE	= $(foreach val, $(SUBMODULES), \
	$(call deploy_dir, $(realpath $(val)), $(HOME)/$(val)))

DEPLOY_WIN	= cd $(WIN_HOME)/Dotfiles\
	$(foreach val, $(CONFIGDIRS), \
	$(call mkdir_safety,$(WIN_HOME)/$(val)) \
	$(call mkdir_safety,$(WIN_HOME)/$(call set_config_home_win,$(val))))\
	$(foreach val,$(DOTFILES_WIN), \
	$(call deploy_file,$(val),../$(call set_config_home_win,$(val))))\
	$(foreach val,$(DOTFILES_WIN_ONCONFIG), \
	$(call deploy_file,$(val),../$(val)))\
	$(call deploy_file,$(WIN_HOME)/Dotfiles/powershell/profile.ps1,$(WIN_HOME)/OneDrive/ドキュメント/PowerShell/Microsoft.PowerShell_profile.ps1)

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

list:## Show dotfiles in this repo
	@echo '--DOTFILES--'
	@$(foreach val, $(DOTFILES), $(call _list,$(val)))
	@echo ''
	@echo '--CONFIG DIRS--'
	@$(foreach val, $(CONFIGDIRS), $(call _list,$(val)))

deploy-file:## Create symlink to home directory (FILES)
	@$(DEPLOY)

deploy-module:## Create symlink to home directory (SUBMODULES)
	@$(DEPLOY-MODULE)

deploy:## Create symlink to home directory
	credit deploy-file deploy-submodule

deploy-win:## Create symlink to WIN_HOME directory
	@$(DEPLOY_WIN)

init-pre:## Setup environment settings (PRE)
	@$(INIT_PRE)

init-lazy:## Setup environment settings (LAZY)
	@$(INIT_LAZY)

init-fake:## Test for init
	@$(call run,./etc/util/do_nothing)

init:## Setup HEAD and LAZY environment settings
	init-pre init-lazy

# test:## Test dotfiles and init scripts (now DEPRECATED)
# 	@#DOTPATH = $(DOTPATH)bash $(DOTPATH)/etc/test/test.sh
# 	@echo "test is inactive temporarily"

update:## Fetch changes for this repo
	git pull origin master
	git submodule init
	git submodule update --remote
	git submodule foreach git pull origin master

install:update deploy init ## Run make update, deploy, init

clean:## Remove the dot files
	@echo '==> Remove dotfiles in your home directory...'
	@$(CLEAN)

purge:## Run 'clean' and remove self
	clean
	$(call rm_recursive, $(DOTPATH))

# debug-dotpath:
# 	@echo "DOTPATH is: $(DOTPATH)"

help:## Print about this
	@$(MAKE) credit
	@echo 'Usage: make [target]'
	@echo
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z0-9_-]+:##' $(MAKEFILE_LIST) | sort | sed -e 's/\([^:]*\):##\(.*\)/    \x1b[36m\1:\x1b[0m\t\2/' | expand -t 28
