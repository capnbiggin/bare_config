#!/usr/bin/env bash

source "$HOME/projects/capndot/scripts/lib/common.sh"

log_info "\nMaking Screenshoot Directory\n"
mkdir -p ~/Pictures/captures/

log_info "\ninstalling grim and slurp\n"
yay -S grim slurp --needed --noconfirm
