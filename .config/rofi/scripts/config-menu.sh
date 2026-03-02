#!/usr/bin/env bash

ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

ROFI_DIR="$ACTUAL_HOME"/.config/rofi
ROFI_SCRIPTS_DIR="$ROFI_DIR"/scripts
CONFIG_DIR="$ACTUAL_HOME"/.config

menu() {
  echo -e "$2" | rofi -dmenu -p "$1…"
}

terminal() {
  ghostty --class=capn.menu.window -e bash -c "$1"
}

browser() {
  setsid google-chrome-stable --new-window --app="$1"
}

# +-------------+
# | ZSH Configs |
# +-------------+
zsh_configs() {
  case $(menu "ZSH Configs" " Zshenv\n Zshrc\n Zprofile") in
  *Zshenv*) ghostty --class=capn.config -e nvim "$ACTUAL_HOME"/.zshenv ;;
  *Zshrc*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/zsh/.zshrc ;;
  *Zprofile*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/zsh/.zprofile ;;
  *) configs_menu ;;
  esac
}

# +----------------+
# | Waybar Configs |
# +----------------+

# +--------------+
# | Rofi Configs |
# +--------------+

# +------------------+
# | Hyprland Configs |
# +------------------+
hypr_configs() {
  case $(menu "Hypr Configs" " Animations\n Autostart\n Keybinds\n Inputs\n Layouts\n Look\n Monitors\n Variables\n Window and Workspaces Rules") in
  *Animations*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/hypr/modules/animations.conf ;;
  *Autostart*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/hypr/modules/autostart.conf ;;
  *Keybinds*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/hypr/modules/binds.conf ;;
  *Inputs*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/hypr/modules/input.conf ;;
  *Layouts*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/hypr/modules/look.conf ;;
  *Look*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/hypr/modules/layout.conf ;;
  *Monitors*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/hypr/modules/look.conf ;;
  *Variables*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/hypr/modules/variables.conf ;;
  *Window*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/hypr/modules/windows_workspaces.conf ;;
  *) configs_menu ;;
  esac
}

configs_menu() {
  case $(menu "Config" " Ghostty\n Hyprland\n Niri\n Oh-My-Posh\n Picom\n Rofi\n Aliases\n Tmux\n Waybar\n Waypaper\n Yazi\n ZSH") in
  *Ghostty*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/ghostty/config ;;
  *Hyprland*) hypr_configs ;;
  *Niri*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/niri/config.kdl ;;
  *Oh-My-Posh*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/oh-my-posh/myprompt.toml ;;
  *Picom*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/picom/picom.conf ;;
  #*Rofi*) ;;
  *Aliases*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/shell/aliases.sh ;;
  *Tmux*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/tmuxs/tmux.conf ;;
  #*Waybar*) ;;
  *Waypaper*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/waypaper/config.ini ;;
  *Yazi*) ghostty --class=capn.config -e nvim "$CONFIG_DIR"/yazi/theme.toml ;;
  *ZSH*) zsh_configs ;;
  *) "$ROFI_SCRIPTS_DIR"/capn-menu.sh ;;
  esac
}

configs_menu
