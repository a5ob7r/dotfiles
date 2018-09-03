#!/bin/sh

DOTFILES="$HOME/src/github.com/a5ob7r/dotfiles"
DOTFILES_REMOTE='https://github.com/a5ob7r/dotfiles.git'

git clone $DOTFILES_REMOTE $DOTFILES

cd $DOTFILES

./etc/script/universal/install_zplugin.sh
./etc/script/universal/install_fzf.sh
