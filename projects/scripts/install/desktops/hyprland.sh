#!/usr/bin/env bash

source "$HOME/Documents/scripts/script-beginer.sh"

HYPR=(
  hyprland
  hypridle
  hyprpicker
  hyprlock
  hyprpaper
  imv
  noctalia-shell
  swww
  wl-clipboard
  rofi
  waybar
  waypaper
  matugen
)

for pkg in "${HYPR[@]}"; do
  log_info "\nInstalling $pkg\n"
  yay -S --needed --noconfirm "$pkg" ||
    printf "\n${R}Failed to install $pkg. Continuing without!${C}\n"
done
