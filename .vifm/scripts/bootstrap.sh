#!/bin/bash
# Create tmuxinator project if it doesn't exist and run it

ROOT=$1
NAME=$(basename $1)
CONFIG_DIR=~/.config/tmuxinator
CONFIG=$CONFIG_DIR/$NAME.yml

if [ -f $CONFIG ]; then
  echo 'Project already exists'
else
  echo name: $NAME >> $CONFIG
  echo root: $ROOT >> $CONFIG
  cat $CONFIG_DIR/.template.yml >> $CONFIG
fi

tmuxinator start $NAME

