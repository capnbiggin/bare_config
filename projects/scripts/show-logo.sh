#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/.dotfiles/scripts

source "$SCRIPTS_DIR"/script-beginer.sh

clear
echo -e "${CYAN}"
cat <"$SCRIPTS_DIR"/logo.txt
echo -e "${NC}"
echo
