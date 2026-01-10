#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/git_repos/capndot/scripts
# Base configs Directory
CONFIG_DIR="$ACTUAL_HOME"/.config
# Config Directory
BASE_CONFIG_DIR="$ACTUAL_HOME"/git_repos/capndot/base

source "$SCRIPTS_DIR"/script-beginer.sh

cp -r "$ACTUAL_HOME"/.gitconfig "$BASE_CONFIG_DIR"/.gitconfig

log_info "Copying ZSH Configs"
cp -r "$ACTUAL_HOME"/.zshenv "$BASE_CONFIG_DIR"/.zshenv
cp -r "$CONFIG_DIR"/zsh/.zshrc "$BASE_CONFIG_DIR"/zsh/.zshrc
cp -r "$CONFIG_DIR"/zsh/.zprofile "$BASE_CONFIG_DIR"/zsh/.zprofile

log_info "Copying Shell Configs 'ie' aliases"
cp -r "$CONFIG_DIR"/shell/aliases "$BASE_CONFIG_DIR"/shell/aliases

log_info "Copying BAT Configs"
cp -r "$CONFIG_DIR"/bat/themes "$BASE_CONFIG_DIR"/bat/themes
cp -r "$CONFIG_DIR"/bat/config "$BASE_CONFIG_DIR"/bat/config

log_info "Copying Fastfetch Config"
cp -r "$CONFIG_DIR"/fastfetch/config.jsonc "$BASE_CONFIG_DIR"/fastfetch/config.jsonc

log_info "Copying Yazi Config"
cp -r "$CONFIG_DIR"/yazi/theme.toml "$BASE_CONFIG_DIR"/yazi/theme.toml

log_info "Copying user-dirs"
cp -r "$CONFIG_DIR"/user-dirs.dirs "$BASE_CONFIG_DIR"/user-dirs.dirs
cp -r "$CONFIG_DIR"/user-dirs.locale "$BASE_CONFIG_DIR"/user-dirs.locale
