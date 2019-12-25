#!/bin/sh

set -Cue

readonly DOTFILES_LOCAL_PATH=~/src/github.com/a5ob7r/dotfiles
readonly DOTFILES_REMOTE_URL='https://github.com/a5ob7r/dotfiles.git'

git clone "${DOTFILES_REMOTE_URL}" "${DOTFILES_LOCAL_PATH}"

cd "${DOTFILES_LOCAL_PATH}"

make install
