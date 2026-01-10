#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/projects/capndot/scripts

set -eu

# Set your terminal:
TERM="ghostty"

# Directories
PROJECTS_DIR="$ACTUAL_HOME"/projects

# Pick repo
configs="$(find "$PROJECTS_DIR"/*/ -maxdepth 0 -print0 | xargs -0 -n1 basename)"
[ -n "$configs" ] || exit 0
chosen="$(printf '%s\n' "$configs" |
  rofi -dmenu -p 'Projects:')"
[ -n "$chosen" ] || exit 0
dir="$PROJECTS_DIR/$chosen"

# Nuke any existing terminal (since you only use one terminal)
# pkill -x $terminal 2>/dev/null || true
# sleep 0.1

# Launch a clean terminal: attach if exists, else create
exec $TERM -e tmux new-session -As "$chosen" -c "$dir"
