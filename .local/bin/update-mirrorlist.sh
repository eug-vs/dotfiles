#!/bin/sh
# Update mirrorlist

export TMPFILE=$(mktemp)

sudo true # Force password prompt in the beginning
rate-arch-mirrors --max-delay=21600 --entry-country=BY | tee -a $TMPFILE
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup
sudo mv $TMPFILE /etc/pacman.d/mirrorlist
