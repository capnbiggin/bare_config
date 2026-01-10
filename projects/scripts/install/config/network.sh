#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/git_repos/capndot/scripts
# Install Directory
INSTALL_DIR="$SCRIPTS_DIR"/install

source "$SCRIPTS_DIR"/script-beginer.sh

NETWORKS=(
  iwd
  iwgtk
  impala
)

for pkg in "${NETWORKS[@]}"; do
  log-info "\nInstalling $pkg .\n"
  yay -S --needed --noconfirm "$pkg"
done

log-info "\nEnable iwd service by default\n"
sudo systemctl enable --now iwd

log-info "\nPrevent systemd-networkd-wait-online timeout on boot\n"
sudo systemctl disable systemd-networkd-wait-online.service
sudo systemctl mask systemd-networkd-wait-online.service
