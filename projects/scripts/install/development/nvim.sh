#!/usr/bin/env bash

source "$HOME/Documents/scripts/script-beginer.sh"

log-info "\nInstalling Neovim\n"
if ! command -v nvim &>/dev/null; then
  yay -S --noconfirm --needed vim neovim luarocks tree-sitter-cli

fi
