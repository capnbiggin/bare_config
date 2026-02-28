#!/usr/bin/env bash

source "${HOME}"/projects/scripts/lib/env.sh
source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/lib/common.sh

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
