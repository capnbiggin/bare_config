#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="${ACTUAL_HOME}/projects/scripts"
LIB_DIR="${SCRIPTS_DIR}/lib"

source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/common.sh

log_info "\nMaking Screenshoot Directory\n"
mkdir -p ~/Pictures/captures/

log_info "\ninstalling grim and slurp\n"
yay -S grim slurp --needed --noconfirm
