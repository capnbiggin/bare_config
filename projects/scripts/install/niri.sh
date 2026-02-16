#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/projects/scripts
# Install Directory
INSTALL_DIR="$SCRIPTS_DIR"/install

source "$SCRIPTS_DIR"/lib/common.sh
source "$INSTALL_DIR"/packages_functions.conf

for pak in "${NIRI[@]}"; do
  log_info "Installing $pak"
  yay -S --needed --noconfirm "$pak"
done
systemctl --user add-wants niri.service
