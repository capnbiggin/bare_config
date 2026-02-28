#!/usr/bin/env bash

source "${HOME}"/projects/scripts/lib/env.sh
source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/lib/common.sh

log_info "\nInstalling backlight cli for laptops.\n"
yay -S light brightnessctl --noconfirm --needed

sudo usermod -aG video $USER
