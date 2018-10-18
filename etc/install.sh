#!/bin/sh

DOTFILES=~/src/github.com/a5ob7r/dotfiles
DOTFILES_REMOTE='https://github.com/a5ob7r/dotfiles.git'

git clone "$DOTFILES_REMOTE" "$DOTFILES"

cd "$DOTFILES" || exit

./etc/script/universal/install_fzf.sh

make link
