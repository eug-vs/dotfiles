#!/bin/sh
PROJECTS_DIRS="$HOME/Documents/Projects $HOME/Documents/Projects/hp"
TMUXINATOR_PROJECTS_DIR="$HOME/.config/tmuxinator"

SELECTED=$({ for dir in $PROJECTS_DIRS; do ls $dir; done; ls $TMUXINATOR_PROJECTS_DIR; } | dmenu -l 10)

if [ $(echo $SELECTED | grep '.yml') ]; then
  # Tmuxinator project was selected, start it
  tmuxinator start "${SELECTED%.*}"
else
  # Project directory was selected, find its full path (in any of the dirs)
  for dir in $PROJECTS_DIRS; do
    FULL_PATH=$(find -L $dir -maxdepth 1 -type d -name $SELECTED)
    if [ -n "$FULL_PATH" ]; then
      # Start project based on the template
      tmuxinator start --no-attach -p=$HOME/.config/tmuxinator/.template.yml name=$SELECTED root=$FULL_PATH 2>/dev/null &
      break
    fi
  done;
fi
