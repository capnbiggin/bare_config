#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/projects/scripts
# Install Directory
INSTALL_DIR="$SCRIPTS_DIR"/install

source "$SCRIPTS_DIR"/lib/common.sh

log_info "\nInstalling bluberry Bluetooh controls\n"
yay -S --noconfirm --needed blueberry

log_info "\nTurning on bluetooth servise by default\n"
sudo systemctl enable --now bluetooth
