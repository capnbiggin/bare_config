#!/usr/bin/env bash

source "$HOME/Documents/scripts/script-beginer.sh"

PACKAGES=(
  cargo
  clang
  llvm
  mise
  imagemagick
  mariadb-libs
  postgresql-libs
  github-cli
  lazygit
  lazydocker-bin
  kate
)

for pkg in "${PACKAGES[@]}"; do
  log_info "\nInstalling $pkg\n"
  yay -S --needed --noconfirm "$pkg" ||
    printf "\n${R}Failed to install $pkg. Continuing without!${C}\n"
done
