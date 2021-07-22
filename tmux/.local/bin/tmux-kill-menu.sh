#!/bin/sh
tmux ls -F "#{session_name}" | dmenu -l 10 | xargs tmux kill-session -t
