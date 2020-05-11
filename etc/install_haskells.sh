#!/usr/bin/env bash

# Use ghcup to install Haskell tools
# https://www.haskell.org/ghcup/
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Install Stack
# https://docs.haskellstack.org/en/stable/install_and_upgrade/
curl -sSL https://get.haskellstack.org/ | sh -s - -d ~/bin
