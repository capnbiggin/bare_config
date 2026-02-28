#!/usr/bin/env bash

source "${HOME}"/projects/scripts/lib/env.sh
source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/lib/common.sh

source "${SCRIPTS_DIR}"/install/packages.conf

for pak in "${BASE[@]}"; do
  log_info "Installing $pak"
  yay -S --needed --noconfirm "$pak"
done
