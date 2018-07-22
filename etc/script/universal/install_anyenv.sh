#!/bin/sh

install4anyenv() {
  if [ ! -d $2 ]; then
    git clone $1 $2
  fi
}

set -x

anyenv_root=$HOME/.anyenv
anyenv_plugins=$anyenv_root/plugins
anyenv_update=$anyenv_plugins/anyenv-update

# install anyenv
# https://github.com/riywo/anyenv
install4anyenv \
  'https://github.com/riywo/anyenv' \
  $anyenv_root

if [ ! -d $anyenv_plugins ]; then
  mkdir $anyenv_plugins
fi

# install anyenv update
# https://github.com/znz/anyenv-update
install4anyenv \
  'https://github.com/znz/anyenv-update.git' \
  $anyenv_update
