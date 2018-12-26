is_tmux_runnning() { [[ -n "$TMUX" ]]; }
is_ssh_running() { [[ -n "$SSH_CONECTION" ]]; }

tmux_automatically_attach_session() {
  if ! (( $+commands[tmux] )); then
    echo 'Error: tmux command not found' 2>&1
    return 1
  fi

  if is_tmux_runnning || is_ssh_running; then
    return 1
  fi

  if ! tmux has-session >/dev/null 2>&1; then
    exec tmux new-session && echo "tmux created new session"
    return 0
  fi

  # detached session exists
  tmux list-sessions
  echo -n "Tmux: attach? (y/N/num) "
  read
  if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
    exec tmux attach-session
  elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
    exec tmux attach -t "$REPLY"
  else
    echo "Error: Invalid input"
    return 1
  fi

  if [[ $? -eq 0 ]]; then
    echo "$(tmux -V) attached session"
    return 0
  fi

  return 1
}

tmux_automatically_attach_session
