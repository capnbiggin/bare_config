#!/usr/bin/env bash

source "$HOME/Documents/scripts/script-beginer.sh"

PACKAGE=(
  yazi
  ffmpeg
  7zip
  jq
  poppler
  fd
  ripgrep
  fzf
  zoxide
  resvg
  imagemagick
)

for pkg in "${HYPR[@]}"; do
  log_info "\nInstalling $pkg\n"
  yay -S --needed --noconfirm "$pkg" ||
    printf "\n${R}Failed to install $pkg. Continuing without!${C}\n"
done
