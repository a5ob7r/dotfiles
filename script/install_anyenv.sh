#!/bin/sh

set -x

anyenv_root=$HOME/.anyenv
anyenv_plugins=$anyenv_root/plugins
anyenv_update=$anyenv_plugins/anyenv-update


# install anyenv
# https://github.com/riywo/anyenv
if [ ! -d $anyenv_root ]; then
  git clone https://github.com/riywo/anyenv $anyenv_root
fi

# install anyenv update
# https://github.com/znz/anyenv-update
if [ ! -d $anyenv_update ]; then
  if [ ! -d $anyenv_plugins ]; then
    mkdir $anyenv_plugins
  fi
  git clone https://github.com/znz/anyenv-update.git $anyenv_update
fi
