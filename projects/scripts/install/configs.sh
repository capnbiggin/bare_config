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

# Install git 
sudo pacman -S git --needed --noconfirm

git clone --bare https://github.com/capnbiggin/bare_config.git $HOME/.dotfiles

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

config checkout --force

config config --local status.showUntrackedFiles no

