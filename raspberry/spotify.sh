#!/bin/sh

SPOTIFYD_RELEASE_URL=https://github.com/Spotifyd/spotifyd/releases/download/v0.3.2/spotifyd-linux-armv6-slim.tar.gz

# Download spotifyd binary
if [ ! -f ~/.local/bin/spotifyd ]; then
	echo Spotifyd binary not found. Downloading...
	cd /tmp
	wget $SPOTIFYD_RELEASE_URL
	tar -xvzf spotifyd-*.tar.gz
	mv spotifyd ~/.local/bin
fi

# Start spotifyd with restart behavior
while true; do
    spotifyd  --no-daemon
    echo Restarting...
done
