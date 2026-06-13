#!/bin/sh

readonly USERXINITRC_LOCAL=~/.local.xinitrc

xsource () {
  if [ -r "$1" ]; then
    # shellcheck disable=SC1090
    . "$1"
  fi
}

xsources () {
  while [ $# -ne 0 ]; do
    xsource "$1"
    shift
  done
}

xrdb_merge () {
  if [ -f "$1" ]; then
    xrdb -merge "$1"
  fi
}

xrdb_merges () {
  while [ $# -ne 0 ]; do
    xrdb_merge "$1"
    shift
  done
}

xrdb_merges ~/.Xresources ~/.local.Xresources

xsources /etc/X11/xinit/xinitrc.d/?*.sh

xsource "$USERXINITRC_LOCAL"
