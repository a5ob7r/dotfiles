# define alias of colorful and detail ls
if (( $+commands[exa] )); then
  alias ll='exa -1'
  alias la='exa -lag'
elif type ls --color=auto > /dev/null 2>&1; then
  # when GNU LS(= coreutils) is installed
  alias ll='ls -1 --color=auto'
  alias la='ls -lAh --color=auto'
else
  # BSD LS
  alias ll='ls -1G'
  alias la="ls -hlTAFG"
fi

if (( $+commands[docker] )); then
  alias dk='docker'
fi

if (( $+commands[docker-compose] )); then
  alias dkcp='docker-compose'
fi

if (( $+commands[tmux] )); then
  alias t='tmux'
fi

if (( $+commands[hub] )); then
  alias g='hub'
elif (( $+commands[git] )); then
  alias g='git'
fi

alias cdh='cd ~'
alias shinit='exec $SHELL -l'
