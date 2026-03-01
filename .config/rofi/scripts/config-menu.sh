#!/usr/bin/env bash

ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

SCRIPTS_DIR="$ACTUAL_HOME"/projects/scripts
ROFI_DIR="$ACTUAL_HOME"/.config/rofi
CONFIG_DIR="$ACTUAL_HOME"/.config

source "./capn-menu.sh"

menu() {
  echo -e "$2" | rofi -dmenu -p "$1…"
}

terminal() {
  ghostty --class=capn.menu.window -e bash -c "$1"
}

browser() {
  setsid google-chrome-stable --new-window --app="$1"
}

configs_menu() {
  case $(menu "Config" " Ghostty\n Hyprland\n Niri\n Oh-My-Posh\n Picom\n Rofi\n Aliases\n Tmux\n Waybar\n Waypaper\n Yazi\n ZSH") in
  *Ghostty*) ghostty --class=capn.config -e nvim "$CONFIG_DIR/ghostty/config" ;;
  *) main_menu ;;
  esac
}

config_menu
