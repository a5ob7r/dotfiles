#!/usr/bin/env bash

install_formula() {
  brew update
  brew bundle install -v
}

# check brew is installed
if type "brew" > /dev/null 2>&1; then
  echo "brew had been already installed."
  cd "$(dirname "$0")" || exit
  install_formula
else
  echo "brew hadn't been installed."
fi
