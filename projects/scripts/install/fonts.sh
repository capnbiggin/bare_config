#!/usr/bin/env bash

source "../script-beginer.sh"

FONTS=(
  ttf-jetbrains-mono-nerd
  ttf-font-awesome
  ttf-roboto
  ttf-font-awesome
  ttf-cascadia-mono-nerd
)

printf "\nDownloading Fonts...\n"

for font in "${FONTS[@]}"; do
  log_info "\nInstalling Font $font\n"
  yay -S --needed --noconfirm "$font"
done
