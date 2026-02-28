#!/usr/bin/env bash

source "${HOME}"/projects/scripts/lib/env.sh
source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/lib/common.sh

# Install git
sudo pacman -S git --needed --noconfirm

git clone --bare https://github.com/capnbiggin/bare_config.git $HOME/.dotfiles

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

config checkout --force

config config --local status.showUntrackedFiles no
