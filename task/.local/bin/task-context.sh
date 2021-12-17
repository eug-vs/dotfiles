#!/bin/sh
# TODO: list contexts using taskwarrior

echo "none default dev codex reading writing" | sed 's/ /\n/g' | dmenu -l 10 | xargs task context
