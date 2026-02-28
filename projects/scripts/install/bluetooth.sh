#!/usr/bin/env bash

source "${HOME}"/projects/scripts/lib/env.sh
source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/lib/common.sh
# Install Directory
INSTALL_DIR="$SCRIPTS_DIR"/install

source "$SCRIPTS_DIR"/lib/common.sh

log_info "\nInstalling bluberry Bluetooh controls\n"
yay -S --noconfirm --needed blueberry

log_info "\nTurning on bluetooth servise by default\n"
sudo systemctl enable --now bluetooth
