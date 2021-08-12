#!/bin/sh
# Display natural wakeup time according to 90-minute rule and wish a good night :)
# Crontab: 0 23,0-5 * * *

HOURS=$(date +%k)
notify-send \
  "It's getting late" \
  "Go to sleep right now, you will wake up at $(($HOURS+4)):30, $(($HOURS+6)) or $(($HOURS+7)):30 and finish whatever you are doing.\n Sweet dreams!"
