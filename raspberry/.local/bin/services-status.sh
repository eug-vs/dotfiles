#!/bin/sh
SERVICES="nginx taskd syncthing@eug-vs sshd iwd chronyd"
USER_SERVICES="spotifyd"

RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

for SERVICE in $SERVICES $USER_SERVICES; do
  if [[ $(echo $USER_SERVICES | grep $SERVICE) ]]; then
    SYSTEMD="systemctl --user"
  else
    SYSTEMD="systemctl"
  fi;

  IS_ACTIVE=$($SYSTEMD is-active $SERVICE)

  if [[ "$IS_ACTIVE" == 'active' ]]; then
    INDICATOR="$GREEN *$NC"
    STATUS="$GREEN $IS_ACTIVE $NC"
  else
    STATUS="$RED $IS_ACTIVE $NC"
    INDICATOR="$RED *$NC"
  fi;

  echo -e "$INDICATOR $SERVICE $STATUS"
done;
