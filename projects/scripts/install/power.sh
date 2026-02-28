#!/usr/bin/env bash

source "${HOME}"/projects/scripts/lib/env.sh
source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/lib/common.sh

log-info "\nInstalling power-profiles-daemon\n"
yay -S --noconfirm --needed power-profiles-daemon

if ls /sys/class/power_supply/BAT* &>/dev/null; then
  log-info "\nThis computer runs on a battery\n"
  powerprofilesctl set balanced || true
else
  log-info "\nThis computer runs on power outlet\n"
  powerprofilesctl set performance || true
fi
