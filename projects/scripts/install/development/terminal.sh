#!/usr/bin/env bash

source "$HOME/Documents/scripts/script-beginer.sh"

PACKAGES=(
  alacritty
  bat
  btop
  cliphist
  curl
  eza
  fastfetch
  fd
  fzf
  ghostty
  inetutils
  impala
  jq
  kitty
  lastpass-cli
  less
  man
  plocate
  ripgrep
  tldr
  tmux
  unzip
  wget
  whois
  wiremix
  wl-clipboard
  zoxide
)

for pkg in "${PACKAGES[@]}"; do
  log-info "\nInstalling $pkg.\n"
  yay -S --noconfirm --needed $pkg
done
