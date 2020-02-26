##--Define Variables--##

# SUFFIX_OF_SCRIPTS

ifeq ($(OS),Windows_NT)
SUFFIX		:= ps1
else
SUFFIX		:= sh
endif

# SCRIPTS

## paths
MAININITDIR	:= etc/init/main
SYSINITDIR	:= etc/init/system
LAZYINITDIR := etc/init/lazy

## get items
SYSINITSCRIPTS	:= $(sort $(wildcard $(SYSINITDIR)/??*.$(SUFFIX)))
MAININITSCRIPTS	:= $(sort $(wildcard $(MAININITDIR)/??*.$(SUFFIX)))
LAZYINITSCRIPTS	:= $(sort $(wildcard $(LAZYINITDIR)/??*.$(SUFFIX)))

# DOTFILES

DOTPATH		:= $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES	:= $(wildcard .??*) $(wildcard .config/??*.??*)
CONFIGDIRS	:= $(filter-out .config/%.toml,$(wildcard .config/??*))
CANDIDATES	:= $(CANDIDATES) $(foreach DIR, $(CONFIGDIRS), $(wildcard $(DIR)/??*)) package.json $(wildcard .jupyter/??*.??*) Pipfile
EXCLUSIONS	:= .DS_Store .git .gitmodules .gitignore .travis.yml .config .vscode
DOTFILES	:= $(sort $(filter-out $(EXCLUSIONS), $(CANDIDATES)))

## UPDATES
UPDATESDIR	:= etc/update
UPDATES		:= $(sort $(wildcard $(UPDATESDIR)/??*.$(SUFFIX)))

#--Define Functions--#

ifeq ($(OS),Windows_NT)
define set_config_home
$(subst .config/,AppData/Local/,$1)
endef
else
define set_config_home
$1
endef
endif

#--

ifeq ($(OS),Windows_NT)
define mkdir_safety
cmd /C "setlocal enableextensions & md $(subst /,\,$1) & endlocal"

endef
else
define mkdir_safety
mkdir -p $1

endef
endif

#--

ifeq ($(OS),Windows_NT)
define mk_symlink
cmd /C mklink $(subst /,\,$2) $(subst /,\,$1)

endef
else
define mk_symlink
ln -sfv $1 $2

endef
endif

#--

ifeq ($(OS),Windows_NT)
define run
powershell -NoLogo $1

endef
else
define run
bash $1

endef
endif

#--

ifeq ($(OS),Windows_NT)
define rm_recursive
cmd /C "del $(subst /,\,$1)"

endef
else
define rm_recursive
rm -vrf $1

endef
endif

#--

define _list
echo $1

endef


##--Setup all tasks--##

DEPLOY	= $(foreach val,$(CONFIGDIRS),\
	$(call mkdir_safety,$(HOME)/$(call set_config_home,$(val))))\
	$(foreach val,$(DOTFILES),\
	$(call mk_symlink,$(realpath $(val)),$(HOME)/$(call set_config_home,$(val)))) \
	$(call mk_symlink,$(realpath .config/starship.toml),$(HOME)/.config/starship.toml)

SYSINIT := $(foreach val,$(SYSINITSCRIPTS),$(call run,$(abspath $(val))))
INIT	:= $(foreach val,$(MAININITSCRIPTS),$(call run,$(abspath $(val))))
INIT_LAZY	:= $(foreach val,$(LAZYINITSCRIPTS),$(call run,$(abspath $(val))))

CLEAN	= -$(foreach val,$(DOTFILES),\
	$(call rm_recursive,$(HOME)/$(call set_config_home,$(val)))) \
	-$(call rm_recursive,$(HOME)/.config/starship.toml)

UPDATE	:= $(foreach val,$(UPDATES),$(call run,$(abspath $(val))))


##--MAIN--##

.DEFAULT_GOAL	:= help

all:

list: ## Show dot files in this repo
	@$(foreach val,"--DOT FILES--" $(DOTFILES) "--CONFIG DIRECTORIES--" $(CONFIGDIRS), $(call _list,$(val)))

deploy: ## Create symlink to home directory
	@echo 'Copyright (c) 2013-2015 BABAROT, 2019- BORLEY All Rights Reserved.'
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(DEPLOY)

init-head: ## Setup environment settings (HEAD-group)
	@$(INIT)

init-lazy: ## Setup environment settings (LASY-group)
	@$(INIT_LAZY)

init-system: ## Setup environment settings (System-Wide)
	@$(SYSINIT)

init: init-head init-lazy ## Setup HEAD and LAZY environment settings

test: ## Test dotfiles and init scripts (now DEPRECATED)
	@#DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/test/test.sh
	@echo "test is inactive temporarily"

self-update: ## Fetch changes for this repo
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

update: ## Update all local objects
	@echo "==> Start to apply UPDATES for all pkgs, plugins, envs, managers, or more..."
	@$(UPDATE)

install: update deploy init ## Run make update, deploy, init

clean: ## Remove the dot files and this repo
	@echo '==> Remove dotfiles in your home directory...'
	@$(CLEAN)

purge: clean ## Run 'clean' and remove self
	-$(call rm_recursive,$(DOTPATH))


help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
