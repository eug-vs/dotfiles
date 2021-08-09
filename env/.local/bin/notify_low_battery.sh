#!/bin/sh
CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
[ $CAPACITY -lt 20 ] && notify-send --urgency=critical "Low battery" "Less then $CAPACITY% remaining.\n Charge your laptop."

