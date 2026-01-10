#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/projects/capndot/scripts
# Install Directory
INSTALL_DIR="$SCRIPTS_DIR"/install

source "$SCRIPTS_DIR"/script-beginer.sh

WEBAPP_INSTALL="$SCRIPTS_DIR"/webapp-install.sh
WEBAPP_DIR="$ACTUAL_HOME"/.local/share/applications

# Ensureing the application directory exist
mkdir -p "$WEBAPP_DIR"

log_info "\nInstalling Web Apps\n"
source $WEBAPP_INSTALL "Google Messages" https://messages.google.com/web/conversations https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/google-messages.png
source $WEBAPP_INSTALL "YouTube" https://youtube.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/youtube.png
source $WEBAPP_INSTALL "GitHub" https://github.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/github-light.png
source $WEBAPP_INSTALL "LastPass" https://lastpass.com/vault/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/lastpass.png
source $WEBAPP_INSTALL "Discord" https://discord.com/channels/@me https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/discord.png

update-desktop-database "$WEBAPP_DIR"
