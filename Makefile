FINLTER := .config .git .DS_Store .gitignore
DOTFILES_RAW := $(wildcard .??*)
DOTFILES := $(filter-out $(FINLTER), $(DOTFILES_RAW))

link:
	@$(foreach dotfile, $(DOTFILES), ln -sfv dotfiles/$(dotfile) $(HOME)/$(dotfile);)

unlink:
	@$(foreach dotfile, $(DOTFILES), unlink $(HOME)/$(dotfile);)

powerline-conf:
	@etc/script/universal/link_tmux_powerline_conf.sh

brew:
	@etc/script/macos/install_brew.sh
	@etc/script/macos/install_formula.sh
