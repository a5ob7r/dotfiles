#!/bin/bash

install_formula() {
  brew update

  local formulas=( \
    "git" \
    "tig" \
    "vim" \
    "zsh --without-etcdir" \
    "tmux" \
    "exa" \
    "ripgrep" \
    "direnv" \
    "python" \
    "hub" \
    "coreutils" \
    "bash" \
    "ctags" \
    "go" \
    "htop" \
    "gibo" \
    )
  
  for ((i=0; i<${#formulas[@]}; i++)); do
    brew install ${formulas[i]}
  done
}

# check brew is installed
if type "brew" > /dev/null 2>&1; then
  echo "brew had been already installed."
  install_formula
else
  echo "brew hadn't been installed."
fi
