#!/usr/bin/env bash

source ."${SCRIPTS_DIR}"/lib/env.sh
source ."${SCRIPTS_DIR}"/colors.sh
source ."${SCRIPTS_DIR}"/common.sh

log-info "\nCloning LazyVim\n"
git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git
