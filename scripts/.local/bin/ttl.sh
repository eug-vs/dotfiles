#!/bin/sh
# Fix default TTL and disable ipv6 making changes permanent
# TODO: replace wlo1 with automatically detected device name

sudo sysctl \
  net.ipv4.ip_default_ttl=65 \
  net.ipv6.conf.all.disable_ipv6=1\
  net.ipv6.conf.default.disable_ipv6=1 \
  net.ipv6.conf.wlo1.disable_ipv6=1 \
  | sudo tee /etc/sysctl.d/fix-ttl.conf -a

