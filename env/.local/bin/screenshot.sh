#!/bin/sh
# Screenshot via ImageMagick
# Passes all args down to import command

SCREENSHOTS_DIR=$HOME/Pictures/Screenshots
FILENAME=$SCREENSHOTS_DIR/$(date +%F_%H-%M-%S).png

mkdir -p $SCREENSHOTS_DIR
import $@ $FILENAME && xclip -selection clipboard -target image/png -i < $FILENAME
