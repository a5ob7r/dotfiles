is_exists() { type "$1" >/dev/null 2>&1; return $?; }
is_tmux_runnning() { [ ! -z "$TMUX" ]; }
is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }
is_shell_called_interactively() { [ ! -z "$PS1" ]; }

tmux_automatically_attach_session() {
  if ! is_exists 'tmux'; then
    echo 'Error: tmux command not found' 2>&1
    return 1
  fi

  if is_tmux_runnning; then
    return 1
  fi

  if is_shell_called_interactively && ! is_ssh_running; then
    if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
      # detached session exists
      tmux list-sessions
      echo -n "Tmux: attach? (y/N/num) "
      read
      if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
        tmux attach-session
        if [ $? -eq 0 ]; then
          echo "$(tmux -V) attached session"
          return 0
        fi
      elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
        tmux attach -t "$REPLY"
        if [ $? -eq 0 ]; then
          echo "$(tmux -V) attached session"
          return 0
        fi
      fi
    fi

    tmux new-session && echo "tmux created new session"
  fi
}

tmux_automatically_attach_session
