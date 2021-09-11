readonly USERRECOURCES=~/.Xresources
readonly USERRECOURCES_LOCAL=~/.local.Xresources
readonly SYSXINITRCS=/etc/X11/xinit/xinitrc.d
readonly USERXINITRC_LOCAL=~/.local.xinitrc

if [ -f "${USERRECOURCES}" ]; then
  xrdb -merge "${USERRECOURCES}"
fi

if [ -f "${USERRECOURCES_LOCAL}" ]; then
  xrdb -merge "${USERRECOURCES_LOCAL}"
fi

if [ -d "${SYSXINITRCS}" ] ; then
  for f in "${SYSXINITRCS}"/?*.sh ; do
    [ -x "${f}" ] && . "${f}"
  done
  unset f
fi

[ -f "${USERXINITRC_LOCAL}" ] && source "${USERXINITRC_LOCAL}"

# vim: set ft=sh :
