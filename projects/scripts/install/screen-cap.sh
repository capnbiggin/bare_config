#!/usr/bin/env bash

source "${HOME}"/projects/scripts/lib/env.sh
source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/lib/common.sh

log_info "\nMaking Screenshoot Directory\n"
mkdir -p ~/Pictures/captures/

log_info "\ninstalling grim and slurp\n"
yay -S grim slurp --needed --noconfirm
