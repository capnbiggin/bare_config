#!/usr/bin/env bash

source "$HOME/Documents/scripts/script-beginer.sh"

log_info "\nInstalling backlight cli for laptops.\n"
yay -S light brightnessctl --noconfirm --needed

sudo usermod -aG video $USER
