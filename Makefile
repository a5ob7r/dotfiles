OSNAME=${shell uname}

FINLTER := .config .git .DS_Store .gitignore .travis.yml
DOTFILES_RAW := $(wildcard .??*)
DOTFILES := $(filter-out $(FINLTER), $(DOTFILES_RAW))

CONFIG_ALL := $(wildcard .config/*)

install: init link pluginstall tests

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

tests:
	@test/test.sh

lint:
	@bash -c 'shopt -s globstar; shellcheck -a -x **/*.zsh .zshrc .zshenv .zprofile etc/**/*.sh .bash_profile .bashrc'

powerline-conf:
	@etc/script/universal/link_powerline_conf.sh

brew:
	@etc/script/macos/install_brew.sh
	@etc/script/macos/install_formula.sh
