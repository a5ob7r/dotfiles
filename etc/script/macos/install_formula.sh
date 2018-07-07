#!/bin/sh

install_formula() {
  brew update
  
  # essential formulas
  brew install \
    git \
    tig \
    vim \
    zsh --without-etcdir \
    tmux \
    fzf
  
  # option formulas
  brew install \
    source-highlight \
    exa \
    ripgrep \
    direnv \
    #grv \
    #the_silver_searcher \
    #htop
}

# check brew is installed
if type "brew" > /dev/null 2>&1; then
  echo "brew had been already installed."
  install_formula
else
  echo "brew hadn't been installed."
fi
