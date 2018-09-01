if (( $+commands[exa] )); then
  alias ll='exa -1'
  alias la='exa -lag'
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
