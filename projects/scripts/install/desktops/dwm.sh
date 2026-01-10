#!/usr/bin/env bash

source "$HOME/Documents/scripts/script-beginer.sh"

UTILS=(
  git
  curl
  wget
  zip
  unzip
  firefox
  feh
)

BDETS=(
  base-devel
  libx11
  libxft
  freetype2
  fontconfig
)

XORG=(
  xorg-server
  xorg-xinit
  xorg-xrandr
  xorg-xsetroot
)

cd ~

for pkg in "${UTILS[@]}"; do
  sudo pacman -S --needed --noconfirm "$pkg" ||
    log_error "\nFailed to install "$pkg". Continuing without!\n"
done

for pkg in "${BDETS[@]}"; do
  sudo pacman -S --needed --noconfirm "$pkg" ||
    log_error "\nFailed to install "$pkg". Continuing without!\n"
done

for pkg in "${XORG[@]}"; do
  sudo pacman -S --needed --noconfirm "$pkg" ||
    log_error "\nFailed to install "$pkg". Continuing without!\n"
done

mkdir -p ~/.local/share/suckless

git clone git@github.com:capnbiggin/suckless.git ~/Documents/dev/suckless
