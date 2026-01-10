#!/usr/bin/env bash

logo_ansi='
    >>============================================================<<
    || ██████╗ █████╗ ██████╗ ███╗   ██╗██████╗  ██████╗ ████████╗||
    ||██╔════╝██╔══██╗██╔══██╗████╗  ██║██╔══██╗██╔═══██╗╚══██╔══╝||
    ||██║     ███████║██████╔╝██╔██╗ ██║██║  ██║██║   ██║   ██║   ||
    ||██║     ██╔══██║██╔═══╝ ██║╚██╗██║██║  ██║██║   ██║   ██║   ||
    ||╚██████╗██║  ██║██║     ██║ ╚████║██████╔╝╚██████╔╝   ██║   ||
    || ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═══╝╚═════╝  ╚═════╝    ╚═╝   ||
    >>============================================================<<'

printf "\e[96m"
printf "\n$logo_ansi\n"
printf "\e[0m"

sudo pacman -Sy --needed --noconfirm git

CAPNDOT="capnbiggin/capndot"

printf "\nCloning the capndot file\n"
rm -rf ~/.local/share/capndot
git clone "https://github.com/${CAPNDOT}.git" ~/.local/share/capndot >/dev/null

printf "\nStarting Install...\n"
source ~/.local/share/capndot/install.sh
