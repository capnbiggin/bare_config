#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/projects/capndot/scripts
# Install Directory
INSTALL_DIR="$SCRIPTS_DIR"/install

source "$SCRIPTS_DIR"/script-beginer.sh
source "$INSTALL_DIR"/packages.conf

for pak in "${BASE[@]}"; do
  log_info "Installing $pak"
  yay -S --needed --noconfirm "$pak"
done
