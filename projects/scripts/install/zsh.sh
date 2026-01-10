#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Dotfiles Directory
BASE_DIR="$ACTUAL_HOME"/projects/capndot
# Script Directory
SCRIPTS_DIR="$BASE_DIR"/scripts
# Config Directory
CONFIG_DIR="$ACTUAL_HOME"/.config

source "$SCRIPTS_DIR/script-beginer.sh"

log_info "\nInstalling Z Shell./n"
sudo pacman -S --needed --noconfirm zsh which
sleep 0.2

log_info "\nChanging default shell to zsh.\n"
hash -r
chsh -s $(which zsh)

# Make Directory for zsh config and plugins
mkdir -p "$CONFIG_DIR"/zsh/plugins

log_info "\nCloning plugin zsh-syntax-highlighting.\n"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting/
sleep 0.2
log_info "\nCloning plugin zsh-autosuggestions.\n"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions/
sleep 0.2
log_info "\nCloning plugin zsh-you-should-use.\n"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.config/zsh/plugins/zsh-you-should-use/
sleep 0.2
log_info "\nCloning plugin zsh-history-substring-search.\n"
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.config/zsh/plugins/zsh-history-substring-search/
sleep 0.2
log_info "\nCloning plugin pure prompt.\n"
git clone https://github.com/sindresorhus/pure.git ~/.config/zsh/plugins/pure/
