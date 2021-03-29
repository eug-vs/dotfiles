#!/bin/sh
# Launch SXIV and set wallpaper randomly from selected images

WALLPAPERS_DIR=~/Pictures/Wallpapers
xwallpaper --zoom $(sxiv $WALLPAPERS_DIR -t -o | shuf | head -n 1)
