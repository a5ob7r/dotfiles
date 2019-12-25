#!/usr/bin/env bash

set -Ceuo pipefail

export LC_ALL=C
export LANG=C

readonly PACKAGES=( \
  pipenv \
  'python-language-server[all]' \
  flake8 \
  ipdb \
  tmuxp \
  kaggle \
  youtube-dl \
  vim-vint \
  # powerline-status \
)

for package in "${PACKAGES[@]}"; do
  pip3 install --user "${package}"
done
