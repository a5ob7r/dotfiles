#!/bin/sh
#
# ~/.profile
#
# - A profile to share configurations between multiple shells
#   - Supported shells
#     - dash
#     - bash
#     - zsh
# - Not a POSIX-compatible
#

has () {
  type "$1" > /dev/null
}

# Inspired by https://qiita.com/ko1nksm/items/47830e566f4c537f8db3
dedup_prepend_path () {
  [ -d "$1" ] || return 1

  set -- "$1" "${PATH:+$PATH:}"

  while [ -n "$2" ]; do
    case ":$1:" in
      *:"${2%%:*}":* )
        set -- "$1" "${2#*:}"
        ;;
      * )
        set -- "$1:${2%%:*}" "${2#*:}"
        ;;
    esac
  done

  PATH=$1
}

dedup_prepend_path ~/.node_modules/bin
dedup_prepend_path ~/.deno/bin
dedup_prepend_path ~/.local/bin
dedup_prepend_path ~/.cargo/bin
dedup_prepend_path ~/.ghcup/bin
dedup_prepend_path ~/.cabal/bin
dedup_prepend_path ~/bin

export ENV=~/.shrc
export EDITOR=vim
export VISUAL=vim
export PAGER=less

export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

export MANOPT='--nj'

if has vim; then
  # Require Vim 9.2 or later.
  export MANPAGER='vim +MANPAGER +"nnoremap <buffer> <silent> q <Cmd>quit<CR>" --not-a-term -'
fi

export LESS='-ij10FMRX'

export PIPENV_VENV_IN_PROJECT=1

export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgreprc"

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
elif has less; then
  if has diff-so-fancy; then
    export GIT_PAGER='diff-so-fancy | less'
  elif has diff-highlight; then
    export GIT_PAGER='diff-highlight | less'
  fi
fi

if [ -f ~/.local.profile ]; then
  # shellcheck disable=SC1090
  . ~/.local.profile
fi
