#!/bin/sh

packages_root=`pip3 show powerline-status | grep "Location:" |  sed -e "s/Location: //g"`
tmux_powerline_conf=$packages_root/powerline/bindings/tmux/powerline.conf

if [[ -f $tmux_powerline_conf ]]; then
  ln -sfv $tmux_powerline_conf $DOTFILES/tmux/powerline.conf
fi

if ! [[ -d $HOME/.config ]]; then
  mkdir $HOME/.config
fi

ln -sfnv $DOTFILES/.config/powerline $HOME/.config/powerline
