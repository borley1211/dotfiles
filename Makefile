ifeq ($(OS),Windows_NT)
INITSCRIPTS	:= $(sort $(wildcard etc/init/??*.ps1))
LAZYSCRIPTS	:= $(sort $(wildcard etc/init_lazy/??*.ps1))
else
INITSCRIPTS	:= $(sort $(wildcard etc/init/??*.sh))
LAZYSCRIPTS	:= $(sort $(wildcard etc/init_lazy/??*.sh))
endif

DOTPATH		:= $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES	:= $(wildcard .??*) $(wildcard .config/??*.??*)
CONFIGDIRS	:= $(filter-out .config/%.toml,$(wildcard .config/??*))
CANDIDATES	:= $(CANDIDATES) $(foreach DIR, $(CONFIGDIRS), $(wildcard $(DIR)/??*))
EXCLUSIONS	:= .DS_Store .git .gitmodules .gitignore .travis.yml .config .vscode
DOTFILES	:= $(sort $(filter-out $(EXCLUSIONS), $(CANDIDATES)))

ifndef XDG_CONFIG_HOME
XDG_CONFIG_HOME	:= .config
endif

#--Define Functions--#

ifeq ($(OS),Windows_NT)

define set_config_home
$(subst .config/,AppData/Local/,$1)
endef
else
define set_config_home
$(subst .config/,$(XDG_CONFIG_HOME)/,$1)
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
define init
powershell -NoLogo $1

endef
else
define init
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

#--Setup all task--#

DEPLOY	= $(foreach val,$(CONFIGDIRS),\
	$(call mkdir_safety,$(HOME)/$(call set_config_home,$(val))))\
	$(foreach val,$(DOTFILES),\
	$(call mk_symlink,$(realpath $(val)),$(HOME)/$(call set_config_home,$(val))))

INIT	:= $(foreach val,$(INITSCRIPTS),$(call init,$(abspath $(val))))
INIT_LAZY	:= $(foreach val,$(INITSCRIPTS),$(call init,$(abspath $(val))))

CLEAN	= -$(foreach val,$(DOTFILES),\
	$(call rm_recursive,$(HOME)/$(call set_config_home,$(val)))) \
	-$(call rm_recursive,$(DOTPATH))

#--

.DEFAULT_GOAL	:= help

all:

list: ## Show dot files in this repo
	@$(foreach val,"--DOT FILES--" $(DOTFILES) "--CONFIG DIRECTORIES--" $(CONFIGDIRS), $(call _list,$(val)))

deploy: ## Create symlink to home directory
	@echo 'Copyright (c) 2013-2015 BABAROT, 2019 BORLEY All Rights Reserved.'
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(DEPLOY)

init: ## Setup environment settings
	@$(INIT)

test: ## Test dotfiles and init scripts
	@#DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/test/test.sh
	@echo "test is inactive temporarily"

update: ## Fetch changes for this repo
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

install: update deploy init ## Run make update, deploy, init

clean: ## Remove the dot files and this repo
	@echo 'Remove dot files in your home directory...'
	@$(CLEAN)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
