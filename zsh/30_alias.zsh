if type exa > /dev/null 2>&1; then
  alias ll='exa -lg'
  alias la='exa -lag'
fi

if type ghq > /dev/null 2>&1; then
  alias g='cd $(ghq root)/$(ghq list | fzf-tmux)'
fi
