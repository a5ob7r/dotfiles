OSNAME=${shell uname}

FINLTER := .config .git .DS_Store .gitignore .travis.yml
DOTFILES_RAW := $(wildcard .??*)
DOTFILES := $(filter-out $(FINLTER), $(DOTFILES_RAW))

CONFIG_ALL := $(wildcard .config/*)

install: init link pluginstall

init:
	@etc/init

pluginstall:
	@etc/pluginstall

link:
	@$(foreach dotfile, $(DOTFILES), ln -sfv $(CURDIR)/$(dotfile) $(HOME)/$(dotfile);)
	@$(foreach config, $(CONFIG_ALL), ln -sfv $(CURDIR)/$(config) $(HOME)/$(config);)

unlink:
	@$(foreach dotfile, $(DOTFILES), unlink $(HOME)/$(dotfile);)
	@$(foreach config, $(CONFIG_ALL), unlink $(HOME)/$(config);)

powerline-conf:
	@etc/script/universal/link_powerline_conf.sh

brew:
	@etc/script/macos/install_brew.sh
	@etc/script/macos/install_formula.sh
