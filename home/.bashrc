#!/bin/bash

if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi

has () {
  type "$1" &>/dev/null
}

stdswap () {
  "$@" 3>&2 2>&1 1>&3 3>&-
}

path () {
  echo "${PATH//:/$'\n'}"
}

xsource () {
  if [[ -f $1 ]]; then
    # shellcheck disable=1090
    source "$1"
  fi
}

# NOTE: This function must be executed on the head of 'PROMPT_COMMAND' to
# capture the previous command' status code.
prompt_command () {
  local -ir statuscode=$?

  local jobs
  # Ignore 'Done' job's info.
  jobs+=$(jobs -r)
  jobs+=$(jobs -s)
  local -r jobs

  # SGR parameters for text decorations.
  if [[ -t 1 && $TERM != dumb ]]; then
    local -r reset='\033[0m'
    local -r bold='\033[1m'
    local -r red='\033[31m'
    local -r green='\033[32m'
    local -r yellow='\033[33m'
    local -r blue='\033[34m'
    local -r magenta='\033[35m'
    local -r cyan='\033[36m'
  else
    local -r reset=''
    local -r bold=''
    local -r red=''
    local -r green=''
    local -r yellow=''
    local -r blue=''
    local -r magenta=''
    local -r cyan=''
  fi

  # The first line's components of the prompt.
  local -a tops=()
  # The second line's components of the prompt.
  local -a bottoms=()

  # Hostname.
  if [[ -n $SSH_CONNECTION ]]; then
    tops+=("\[$blue\]"'\H'"\[$reset\]")
  fi

  # Current working directory.
  tops+=("\[$cyan\]"'\w'"\[$reset\]")

  # Background jobs.
  if [[ -n $jobs ]]; then
    tops+=("\[$yellow$bold\]"'\j'"\[$reset\]\[$yellow\]j\[$reset\]")
  fi

  # Exit status code and prompt sign.
  if (( statuscode )); then
    tops+=("\[$red$bold\]$statuscode\[$reset\]")
    bottoms+=("\[$red\]"'\$'"\[$reset\]")
  else
    bottoms+=("\[$green\]"'\$'"\[$reset\]")
  fi

  # Number of bash instances up to the process tree root and the current
  # datetime.
  tops+=(
    "Lv.$SHLVL"
    "\[$magenta\]"'\D{%T %d-%m-%g}'"\[$reset\]"
  )

  PS1='\n'"${tops[*]}"'\n'"${bottoms[*]} "
}

PROMPT_COMMAND=prompt_command
HISTSIZE=5000000

xsource ~/.aliases
xsource ~/.local.bashrc
