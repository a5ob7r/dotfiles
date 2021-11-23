export PS1='\n\[\e[0;36m\]\w\[\e[m\] (j: \j) (s: $?)\n\[\e[$((( $? )) && echo "0;31" || echo "0;32")m\]\$\[\e[m\] '

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
    source "$1"
  fi
}

alias quit=exit
alias q=quit
alias g=git
alias v=vim

xsource ~/.local.bashrc
