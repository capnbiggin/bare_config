#!/usr/bin/env bash

SCRIPTS_DIR="${HOME}"/projects.scripts
# Install Directory
INSTALL_DIR="${SCRIPTS_DIR}"/install

source "${SCRIPTS_DIR}"/lib/env.sh
source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/common.sh


source "$INSTALL_DIR"/packages.conf

for pak in "${HYPR[@]}"; do
  log_info "Installing $pak"
  yay -S --needed --noconfirm "$pak"
done
systemctl --user add-wants niri.service
