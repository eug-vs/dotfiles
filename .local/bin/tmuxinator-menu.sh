#!/bin/sh

PROJECTS_DIR=~/.config/tmuxinator

ls $PROJECTS_DIR | sed 's/\.yml//g' | dmenu -l 10 | xargs tmuxinator start
