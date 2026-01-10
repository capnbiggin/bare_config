#!/usr/bin/env bash

C='\033[0m'    # no color
G='\033[0;32m' # green color
R='\033[0;31m' # red color

# Exit on error
set -e

# Source Utility function
source ./utils.sh

# Source my package list
if [ ! -f "packages.conf" ]; then
  printf "\n${R}ERROR: packages.conf not found!!${C}\n"
  exit 1
fi

source packages.conf

# install the Arch User Repository helper yay.
. preflight/yay-install.sh

sleep 1

# Install all packages
printf "\n${G}Installing System Utilities...${C}/n"
install_packages "${SYSTEM_UTILS[@]}"

printf "\n${G}Installing Dev Tools...${C}\n"
install_packages "${DEV[@]}"

printf "\n$G}Installing Fonts...${C}\n"
install_packages "${FONTS[@]}"

printf "\n${G}Installing Media packages...${C}\n"
install_packages "${MEDIA[@]}"

printf "\n${G}Installing Network Packages...${C}\n"
install_packages "${NETWORK[@]}"

# Enable Services
printf "\n${G}Configuring services...${C}\n"
for service in "${SERVICES[@]}"; do
  if ! systemctl is-enabled "$service" &>/dev/null; then
    printf "Enabling $service..."
    sudo systemctl enable --now "$service"
  else
    printf "n${G}$service is already enabled${C}\n"
  fi
done

# Sett up Z Shell
. config/zsh.sh

# Link config files
printf "/n${G}Linking config files${C}/n"
pushd ~/dotfiles/
stow config
popd
