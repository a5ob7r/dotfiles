#!/bin/sh

# check brew is installed
#if type "brew" > /dev/null 2>&1; then
#    echo "brew had been already installed."
#else
#    echo "brew hadn't been installed."
#    exit
#fi

brew update

# essential formulas
brew install git
brew install tig
brew install vim
brew install zsh --without-etcdir
brew install tmux
brew install reattach-to-user-namespace

# option formulas
brew install source-highlight
brew install exa
brew install ripgrep
brew install direnv
#brew install grv
#brew install the_silver_searcher
#brew install htop
