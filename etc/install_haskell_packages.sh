#!/usr/bin/env bash

cabal install ShellCheck
cabal install xmonad xmonad-contrib
cabal install xmobar --flags="all_extensions"
