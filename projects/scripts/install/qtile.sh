#!/usr/bin/env bash

source "${HOME}"/projects/scripts/lib/env.sh
source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/lib/common.sh
# Install Directory
INSTALL_DIR="$SCRIPTS_DIR"/install

source "$SCRIPTS_DIR"/lib/common.sh
source "$INSTALL_DIR"/packages.conf

for pak in "${QTILE[@]}"; do
  log_info "Installing $pak"
  yay -S --needed --noconfirm "$pak"
done
systemctl --user add-wants niri.service
