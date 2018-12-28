#!/bin/sh

DOTFILES=~/src/github.com/a5ob7r/dotfiles
DOTFILES_REMOTE='https://github.com/a5ob7r/dotfiles.git'

if ! type git > /dev/null 2>&1; then
  echo 'Not found git.'
  echo 'Please install git.'
  exit 1
fi

git clone "$DOTFILES_REMOTE" "$DOTFILES"

cd "$DOTFILES" || exit

make install
