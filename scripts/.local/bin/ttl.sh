#!/bin/sh
# Fix default TTL and disable ipv6 making changes permanent
# TODO: replace wlan0 with automatically detected device name

sudo sysctl \
  net.ipv4.ip_default_ttl=65 \
  net.ipv6.conf.all.disable_ipv6=1\
  net.ipv6.conf.default.disable_ipv6=1 \
  net.ipv6.conf.wlan0.disable_ipv6=1 \
  | sudo tee /etc/sysctl.d/fix-ttl.conf -a

