#!/usr/bin/env bash

source "$HOME/Documents/scripts/script-beginer.sh"

PYTHON=(
  python
  python3
  python-pip
  python-gobject
  python3-gobject
  python-screeninfo
)

for py in "${PYTHON[@]}"; do
  log-info "\nInstalling $py.\n"
  yay -S --needed --noconfirm $py
done
