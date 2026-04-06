#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="${ACTUAL_HOME}/projects/scripts"
LIB_DIR="${SCRIPTS_DIR}/lib"

source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/common.sh

log_info "\nInstalling backlight cli for laptops.\n"
yay -S light brightnessctl --noconfirm --needed

sudo usermod -aG video $USER
