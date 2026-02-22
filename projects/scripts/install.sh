#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="${ACTUAL_HOME}/projects/scripts"
LIB_DIR="${SCRIPTS_DIR}/lib"
# Install Directory
INSTALL_DIR="${SCRIPTS_DIR}/install"

source "${LIB_DIR}/common.sh"

# Check if running as root user
if [ "$EUID" -eq 0 ]; then
  log_error "\nDo not run this script as root!!\n"
  exit 1
fi

show_logo() {
  clear
  echo -e "$CYAN"
  cat <"${LIB_DIR}/logo.txt"
  echo -e "$NC"
}

# Update System
sudo pacman -Syyu --noconfirm --needed

show_logo

if ping -q -c 2 -W 1 8.8.8.8 >/dev/null 2>&1; then
  log_info "\nInternet connection is UP...  Continuing with install...\n"
else
  log_error "\nInternet connection is DOWN.. Exiting Script...\n"
  exit 1
fi

source "${INSTALL_DIR}/configs.sh"
source "${INSTALL_DIR}/aur-yay.sh"
source "${INSTALL_DIR}/base.sh"
source "${INSTALL_DIR}/fonts.sh"
source "${INSTALL_DIR}/gum.sh"

# source "${INSTALL_DIR}/niri.sh"
# source "${INSTALL_DIR}/qtile.sh"
source "${INSTALL_DIR}/hypr.sh"
source "${INSTALL_DIR}/backlight.sh"
source "${INSTALL_DIR}/bluetooth.sh"
source "${INSTALL_DIR}/docker.sh"
source "${INSTALL_DIR}/power.sh"
source "${INSTALL_DIR}/screen-cap.sh"
source "${INSTALL_DIR}/webapps.sh"

source "${INSTALL_DIR}/zsh.sh"

log_warning "\nRESTART NEEDED!!!"
nonify-send "RESTART NEEDED"
exit 0

