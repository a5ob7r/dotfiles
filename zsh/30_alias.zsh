if type exa > /dev/null 2>&1; then
  alias ll='exa -lg'
  alias la='exa -lag'
fi

if type docker > /dev/null 2>&1; then
  alias dk='docker'
fi

if type docker-compose > /dev/null 2>&1; then
  alias dkcp='docker-compose'
fi
