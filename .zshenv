if [[ -z $TMUX ]]; then
  # when on no tmux,
  # define environment variables and execute processing needed only once

  # {{{ dotfiles
  # detect and define dotfiles directory path
  export DOTFILES=$(dirname $(readlink $HOME/.zshenv))
  # }}}

  # {{{ basic
  export LANG=en_US.UTF-8
  export LC_TIME="C"

  export EDITOR=vim
  export VISUAL=vim
  export PAGER=less

  # prevent adding duplication path
  typeset -U path PATH

  export path=( \
    $HOME/bin(N-/) \
    $HOME/.local/bin(N-/) \
    /usr/local/bin(N-/) \
    $path \
    )
  # }}}

  # {{{ less
  # default less option
  export LESS='-ij10FMRX'
  # }}}

  # {{{ man
  # colorized man with less
  export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
  export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
  export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
  export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
  export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
  export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
  export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.
  # }}}

  # {{{ zsh
  # history
  export HISTFILE=$HOME/.zsh_history
  export HISTSIZE=100000
  export SAVEHIST=100000

  # spelling correction prompt
  export SPROMPT="zsh: correct: %F{red}%R%f -> %F{green}%r%f [No/Yes/Abort/Edit]? "

  # prevent adding duplication fpath
  typeset -U fpath FPATH
  # function path
  export fpath=( \
    $DOTFILES/zsh/compdefs(N-/) \
    $fpath \
    )
  # }}}

  # {{{ fzf
  export FZF_DEFAULT_OPTS='--reverse'
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_TMUX=1
  # }}}

  # {{{ anyenv
  export ANYENV_ROOT=$HOME/.anyenv

  # add anyanv commnad path to $PATH when no the command path
  if [[ -d $ANYENV_ROOT ]] ; then
    export PATH="$ANYENV_ROOT/bin:$PATH"
    eval "$(anyenv init - --no-rehash)"

    # correspond tmux
    for D in `\ls $ANYENV_ROOT/envs`; do
      export PATH="$ANYENV_ROOT/envs/$D/shims:$PATH"
    done
  fi
  # }}}

  # {{{ other
  export VOLTPATH=$DOTFILES/volt
  export GOPATH=$HOME/go
  export path=( \
    $GOPATH/bin(N-/) \
    $path \
    )
  # }}}

  # {{{ local zshenv
  _zshenv_local=$HOME/.zshenv.local
  [[ -f $_zshenv_local ]] && source $_zshenv_local
  # }}}
fi
