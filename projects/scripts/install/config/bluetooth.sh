#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/git_repos/capndot/scripts
# Install Directory
INSTALL_DIR="$SCRIPTS_DIR"/install

source "$SCRIPTS_DIR"/script-beginer.sh

log_info "\nInstalling bluberry Bluetooh controls\n"
yay -S --noconfirm --needed bluberry

log-info "\nTurning on bluetooth servise by default\n"
sudo systemctl enable --now bluetooth
