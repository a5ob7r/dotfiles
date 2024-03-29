#!/bin/sh

xsource () {
  if [ -f "$1" ]; then
    # shellcheck disable=SC1090
    . "$1"
  fi
}

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
prepend_path ~/.deno/bin
prepend_path ~/.local/bin
prepend_path ~/.cargo/bin
prepend_path ~/.ghcup/bin
prepend_path ~/.cabal/bin
prepend_path ~/bin

export ENV=~/.shrc
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

export LESS='-ij10FMRX'

export PIPENV_VENV_IN_PROJECT=1

export RIPGREP_CONFIG_PATH=~/.ripgreprc

export FZF_DEFAULT_OPTS='--reverse --height=40% --min-height=12'
export SKIM_DEFAULT_OPTIONS="$FZF_DEFAULT_OPTS"

if has rg; then
  # NOTE: Use config file which is spacified with RIPGREP_CONFIG_PATH to config
  # general options for rg.
  export FZF_DEFAULT_COMMAND='rg --files'
  export SKIM_DEFAULT_COMMAND="$FZF_DEFAULT_COMMAND"
fi

if has delta; then
  export GIT_PAGER=delta
elif ! has less; then
  :
elif has diff-so-fancy; then
  export GIT_PAGER='diff-so-fancy | less'
elif has diff-highlight; then
  export GIT_PAGER='diff-highlight | less'
fi

xsource ~/.local.profile
