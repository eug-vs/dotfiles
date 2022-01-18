#!/bin/sh
PROJECTS_DIRS="$HOME/Documents/Projects $HOME/Documents/Projects/hp"

SELECTED=$({ for dir in $PROJECTS_DIRS; do ls $dir; done; } | dmenu)

for dir in $PROJECTS_DIRS; do
  FULL_PATH=$(find -L $dir -maxdepth 1 -type d -name $SELECTED)
  if [ -n "$FULL_PATH" ]; then
    tmux new-session -s $SELECTED -c $FULL_PATH \; send-keys "nvim" Enter \; split-window -h \; rename-window editor
    break
  fi
done;
