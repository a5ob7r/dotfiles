#!/bin/sh

has () {
  type "$1" > /dev/null
}

prepend_path () {
  # NOTE: Really should we use this validation? Maybe causes no idempotence.
  [ -d "$1" ] || return 1

  case ":$PATH:" in
    *":$1:"* )
      ;;
    * )
      PATH="$1${PATH:+:$PATH}"
      ;;
  esac
}

prepend_path ~/.node_modules/bin
prepend_path ~/.local/bin
prepend_path ~/.cargo/bin
prepend_path ~/.ghcup/bin
prepend_path ~/.cabal/bin
prepend_path ~/bin
export PATH

export EDITOR=vim
export VISUAL=vim
export PAGER=less

export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

export MANOPT='--nj'

if has vim; then
  # Maybe fail to open man page with vim as pager due to no filetype plugin
  # of vim loaded. Then, there are two ways to resolve this problem.
  #
  # 1. Overwrite the environment variable `MANPAGER` with empty string.
  #   e.g.
  #   $ MANPAGER= man some_command
  #
  # 2. Config vimrc to load filetype plugin.
  #   e.g.
  #   "in vimrc
  #   filetype plugin on
  #
  # NOTE: Supress `Vim: Reading from stdin...` message using `--not-a-term`.
  # https://github.com/vim/vim/commit/234d16286a2733adedef56784c17415ae169b9ad
  #
  # NOTE: Maybe it is enough to pass `-M` option to vim instead of
  # `-c "set nomodifiable | set nowrite"` in accordance with the document.
  # But somehow no effect even if passes `-M`. Is this bug?
  export MANPAGER='vim +MANPAGER -c "set nolist nomodifiable nowrite | nnoremap <buffer> <silent> q :quit<CR>" --not-a-term -'
fi

export LESS_TERMCAP_mb=$'\033[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\033[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\033[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\033[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\033[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\033[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\033[01;32m'      # Begins underline.

export LESS='-ij10FMRX'

export PIPENV_VENV_IN_PROJECT=1

export RUSTFLAGS='-C target-cpu=native'

export RIPGREP_CONFIG_PATH=~/.ripgreprc

export FZF_DEFAULT_OPTS='--reverse --height=40%'
export SKIM_DEFAULT_OPTIONS=$FZF_DEFAULT_OPTS

if has rg; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export SKIM_DEFAULT_COMMAND=$FZF_DEFAULT_COMMAND
fi
