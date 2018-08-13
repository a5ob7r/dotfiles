if [ $SHLVL -eq 1 ]; then
  # environment
  export LANG=en_US.UTF-8
  export LC_TIME="C"

  # tool confiture
  export PAGER=less
  export EDITOR=vim
  export VISUAL=vim

  export LESS='-ij10FMRX'

  # colorized for man with less
  export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
  export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
  export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
  export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
  export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
  export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
  export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

  # history
  export HISTFILE=$HOME/.zsh_history
  export HISTSIZE=100000
  export SAVEHIST=100000
  export HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

  export DOTFILES=$(dirname $(readlink .zshenv))

  # external configure
  export VOLTPATH=$DOTFILES/volt
  export GOPATH=$HOME/go
  export ANYENV_ROOT=$HOME/.anyenv

  export FZF_DEFAULT_OPTS='--reverse'
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_TMUX=1

  # prevent adding duplication path
  typeset -U path PATH

  # add $path
  export path=( \
    $HOME/bin(N-/) \
    $GOPATH/bin(N-/) \
    $HOME/.local/bin(N-/) \
    /usr/local/bin(N-/) \
    $path \
  )

  typeset -U fpath FPATH

  export fpath=( \
    $DOTFILES/zsh/compdefs(N-/) \
    $fpath \
    )

  # add anyanv commnad path to $PATH when no the command path
  if [ -d $ANYENV_ROOT ] ; then
    export PATH="$ANYENV_ROOT/bin:$PATH"
    eval "$(anyenv init - --no-rehash)"

    # correspond tmux
    for D in `\ls $ANYENV_ROOT/envs`
    do
      export PATH="$ANYENV_ROOT/envs/$D/shims:$PATH"
    done
  fi

  # load local zshenv
  __zshenv_local=$HOME/.zshenv.local
  [ -f $__zshenv_local ] && source $__zshenv_local
fi
