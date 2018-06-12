#!/bin/sh

# install anyenv
# https://github.com/riywo/anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv

# install anyenv update
# https://github.com/znz/anyenv-update
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
