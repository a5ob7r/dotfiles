FINLTER := .config .git .DS_Store .gitignore
DOTFILES_RAW := $(wildcard .??*)
DOTFILES := $(filter-out $(FINLTER), $(DOTFILES_RAW))

link:
	@$(foreach dotfile, $(DOTFILES), ln -sfhv dotfiles/$(dotfile) $(HOME)/$(dotfile);)

unlink:
	@$(foreach dotfile, $(DOTFILES), unlink $(HOME)/$(dotfile);)

brew:
	@script/install_brew.sh
	@script/install_formula.sh
