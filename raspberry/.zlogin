if [ -n "$SSH_CONNECTION" ]; then
  # If we are logged in via SSH, automatically attach to master session
  [ -z "$TMUX" ] && (tmux attach -t master || tmux new -s master)
else
  # If we are logged in directly (not via SSH)
  # create the session which will be displayed on TV
  tmuxinator start display
fi
