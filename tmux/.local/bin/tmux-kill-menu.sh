#!/bin/sh
tmux ls -F "#{session_name}" | dmenu | xargs tmux kill-session -t
