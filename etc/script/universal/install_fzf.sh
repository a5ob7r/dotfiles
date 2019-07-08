#!/usr/bin/env bash

install_fzf() {
  if type fzf > /dev/null 2>&1; then
    echo "fzf commnad is installed"
    return 1
  fi
  if [ -d ~/.fzf ]; then
    echo "fzf is installed"
    return 1
  fi

  # https://github.com/junegunn/fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --bin
}

make_link_fzf() {
  if ! [ -d ~/bin ]; then
    echo "make bin directory in \$HOME"
    mkdir ~/bin
  fi

  fzf_dir_bin=$HOME/.fzf/bin
  fzf=$fzf_dir_bin/fzf
  if ! [ -f "$fzf" ]; then
    echo "fzf command is not found in $fzf_dir_bin"
    return
  fi
  ln -svf "$fzf" ~/bin/fzf

  fzf_tmux=$fzf_dir_bin/fzf-tmux
  if ! [ -f "$fzf_tmux" ]; then
    echo "fzf-tmux command is not found in $fzf_dir_bin"
    return
  fi
  ln -svf "$fzf_tmux" ~/bin/fzf-tmux
}

install_fzf
make_link_fzf
