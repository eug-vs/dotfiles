# !/bin/bash
# Generate layout from JSON in a separate
# workspace and open nvim + alacritty.
# Requires workspace.json (see $LAYOUT, can be copied
# from config/i3/workspace.json).

LAYOUT=~/.config/i3/workspace.json

WORKSPACE=$(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))
WORKDIR=$1

i3-msg "workspace $WORKSPACE; append_layout $LAYOUT"
alacritty --title "nvim" --working-directory $WORKDIR -e zsh -c "nvim; zsh" &
alacritty --title "primary-terminal" --working-directory $WORKDIR -e zsh &
alacritty --title "secondary-terminal" --working-directory $WORKDIR -e zsh &

# Fix weird nvim + Alacritty behaviour
# TODO: remove this hack after you start using Tmux
sleep 0.3
i3-msg reload

