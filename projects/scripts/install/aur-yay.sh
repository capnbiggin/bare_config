#!/usr/bin/env bash

source "${HOME}"/projects/scripts/lib/env.sh
source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/lib/common.sh

# Install yay AUR helper if not present
if ! command -v yay &>/dev/null; then
  log_info "\nInstalling yay AUR helper...\n"
  sudo pacman -S --needed git base-devel --noconfirm
  if [[ ! -d "yay" ]]; then
    log_info "\nCloning yay repository...\n"
  else
    log_info "\nyay directory already exists, removing it...\n"
    rm -rf yay
  fi

  git clone https://aur.archlinux.org/yay.git

  cd yay
  log_info "\nBuilding yay.... yaaaaayyyyy\n"
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  log_info "$\nyay is already installed\n"
fi
