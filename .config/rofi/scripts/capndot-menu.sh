#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

SCRIPTS_DIR="$ACTUAL_HOME"/projects/capndot/scripts
ROFI_DIR="$ACTUAL_HOME"/.config/rofi

menu() {
  echo -e "$2" | rofi -dmenu -p "$1…"
}

terminal() {
  ghostty --class=capndot.menu -e bash -c "$1"
}

browser() {
  setsid google-chrome-stable --new-window --app="$1"
}

remove_menu() {
  case $(menu "Remove" "󰣇  Package\n  Web App") in
  *Package*) terminal "$SCRIPTS_DIR"/pkg-remove.sh ;;
  *Web*) terminal "$SCRIPTS_DIR"/webapp-remove.sh ;;
  *) main_menu ;;
  esac
}

install_menu() {
  case $(menu "Install" "󰣇  Arch Install\n󰣇  AUR Install\n  Web App") in
  *Arch*) terminal "$SCRIPTS_DIR"/pkg-install.sh ;;
  *AUR*) terminal "$SCRIPTS_DIR"/aur-pkg-install.sh ;;
  *Web*) terminal "$SCRIPTS_DIR"/webapp-install.sh ;;
  *) main_menu ;;
  esac
}

learn_menu() {
  case $(menu "Learn" " Keybindings\n  Hyprland\n󰣇  Arch\n  Neovim\n󱆃  Bash") in
  *Keybindings*) "$SCRIPTS_DIR"/rofi-scripts/hypr-keybindings.sh ;;
  *Hyprland*) browser "https://wiki.hypr.land/" & ;;
  *Arch*) browser "https://wiki.archlinux.org/title/Main_page" & ;;
  *Bash*) browser "https://devhints.io/bash" & ;;
  *Neovim*) browser "https://www.lazyvim.org/keymaps" & ;;
  *) main_menu ;;
  esac
}

system_menu() {
  case $(menu "System" "  Lock\n󰤄  Suspend\n󰜉  Restart\n󰐥  Shutdown") in
  *Lock*) hyprlock ;;
  *Suspend*) systemctl suspend ;;
  *Restart*) systemctl reboot ;;
  *Shutdown*) systemctl poweroff ;;
  *) main_menu ;;
  esac
}

tmux_sessions() {
  case $(menu "Tmux Sessions" "  Project\n  Tmux_Sessions\n  Kill_Tmux_Session") in
  *Project*) "$ROFI_DIR"/scripts/projects_menu.sh ;;
  *Tmux_Sessions*) "$ROFI_DIR"/scripts/tmux_sessions.sh ;;
  *Kill_Tmux_Session*) "$ROFI_DIR"/scripts/kill_tmux_sessions.sh ;;
  esac
}

main_menu() {
  case $(menu "Start" " Apps\n  Tmux\n󰉉  Install\n󰉉  Uninstall\n󰧑  Learn\n  System\n- About") in
  *Apps*) "$ROFI_DIR"/launchers/launcher-1.sh ;;
  *Tmux*) tmux_sessions ;;
  *Install*) install_menu ;;
  *Uninstall*) remove_menu ;;
  *Learn*) learn_menu ;;
  *System*) system_menu ;;
  *About*) ghostty --class=capndot.menu --title=About -e bash -c 'fastfetch; read -n 1 -s' ;;
  esac
}

main_menu
