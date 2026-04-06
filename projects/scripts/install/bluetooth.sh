#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="${ACTUAL_HOME}/projects/scripts"
LIB_DIR="${SCRIPTS_DIR}/lib"
INSTALL_DIR="${SCRIPTS_DIR}"/install

source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/common.sh

# Install Directory

source "$INSTALL_DIR"/packages.conf

log_info "\nInstalling bluberry Bluetooh controls\n"
yay -S --noconfirm --needed blueberry

log_info "\nTurning on bluetooth servise by default\n"
sudo systemctl enable --now bluetooth
