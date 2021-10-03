#!/bin/sh
# Show CPU temperature in a cool way. Requires superuser permissions.

watch -n 2 --no-title "/opt/vc/bin/vcgencmd measure_temp | sed 's/temp=//' | figlet -W | /usr/bin/cowsay -f ghostbusters -n | sed 's/^/                                                        /'"
