#!/usr/bin/env bash

source "$HOME/Documents/scripts/script-beginer.sh"

PACKAGES=(
  chromium
  google-chrome
)

for pkg in "${PACKAGES[@]}"; do
  log_info "\nInstalling $pkg\n"
  yay -S --noconfirm --needed $pkg
done
