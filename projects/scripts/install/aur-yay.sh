#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="${ACTUAL_HOME}/projects/scripts"
LIB_DIR="${SCRIPTS_DIR}/lib"

source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/common.sh

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

  cd yay || exit
  log_info "\nBuilding yay.... yaaaaayyyyy\n"
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  log_info "$\nyay is already installed\n"
fi
