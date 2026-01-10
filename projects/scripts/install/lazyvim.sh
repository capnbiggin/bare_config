#!/usr/bin/env bash

source "$HOME/projects/capndot/scripts/script-beginer.sh"

log-info "\nCloning LazyVim\n"
git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git
