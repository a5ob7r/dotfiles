FINLTER := .config .git .DS_Store .gitignore
DOTFILES_RAW := $(wildcard .??*)
DOTFILES := $(filter-out $(FINLTER), $(DOTFILES_RAW))

link:
	@$(foreach dotfile, $(DOTFILES), ln -sfhv dotfiles/$(dotfile) $(HOME)/$(dotfile);)

unlink:
	@$(foreach dotfile, $(DOTFILES), unlink $(HOME)/$(dotfile);)

brew:
	@etc/script/macos/install_brew.sh
	@etc/script/macos/install_formula.sh
