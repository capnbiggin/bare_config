#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/projects/capndot/scripts
# Install Directory
INSTALL_DIR="$SCRIPTS_DIR"/install

source "$SCRIPTS_DIR"/script-beginer.sh

# Install yay AUR helper if not present
if ! command -v yay &>/dev/null; then
  log-info "\nInstalling yay AUR helper...\n"
  sudo pacman -S --needed git base-devel --noconfirm
  if [[ ! -d "yay" ]]; then
    log-info "\nCloning yay repository...\n"
  else
    log-info "\nyay directory already exists, removing it...\n"
    rm -rf yay
  fi

  git clone https://aur.archlinux.org/yay.git

  cd yay
  log-info "\nBuilding yay.... yaaaaayyyyy\n"
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  log-info "$\nyay is already installed\n"
fi
