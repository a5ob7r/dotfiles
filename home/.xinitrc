#!/bin/sh

readonly USERRECOURCES=~/.Xresources
readonly USERRECOURCES_LOCAL=~/.local.Xresources
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

if [ -f "$USERRECOURCES" ]; then
  xrdb -merge "$USERRECOURCES"
fi

if [ -f "$USERRECOURCES_LOCAL" ]; then
  xrdb -merge "$USERRECOURCES_LOCAL"
fi

xsources /etc/X11/xinit/xinitrc.d/?*.sh

xsource "$USERXINITRC_LOCAL"
