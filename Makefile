OSNAME=${shell uname}

CONFIGS_HOME := $(shell find home -mindepth 1 -maxdepth 1 -exec basename {} \;)
CONFIG_ALL := $(wildcard .config/*)

install: init link pluginstall tests

init:
	@etc/init

pluginstall:
	@etc/pluginstall

link:
	@$(foreach config, $(CONFIGS_HOME), ln -sfv $(CURDIR)/home/$(config) $(HOME)/$(config);)
	@$(foreach config, $(CONFIG_ALL), ln -sfv $(CURDIR)/$(config) $(HOME)/$(config);)

unlink:
	@$(foreach config, $(CONFIGS_HOME), unlink $(HOME)/$(config);)
	@$(foreach config, $(CONFIG_ALL), unlink $(HOME)/$(config);)

tests:
	@test/test.sh

lint:
	@bash -c 'shopt -s globstar; shellcheck -x etc/**/*.sh .bash_profile .bashrc'

powerline-conf:
	@etc/link_powerline_conf.sh
