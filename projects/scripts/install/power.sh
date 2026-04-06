#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="${ACTUAL_HOME}/projects/scripts"
LIB_DIR="${SCRIPTS_DIR}/lib"

source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/common.sh

log-info "\nInstalling power-profiles-daemon\n"
yay -S --noconfirm --needed power-profiles-daemon

if ls /sys/class/power_supply/BAT* &>/dev/null; then
  log-info "\nThis computer runs on a battery\n"
  powerprofilesctl set balanced || true
else
  log-info "\nThis computer runs on power outlet\n"
  powerprofilesctl set performance || true
fi
