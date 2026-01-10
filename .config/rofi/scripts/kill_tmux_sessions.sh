#!/usr/bin/env bash

set -eu

# A simple script to kill a new tmux session using rofi.

terminal() {
  ghostty --class=capndot.menu -e bash -c "$1"
}

# Function to list tmux sessions
list_sessions() {
  tmux list-sessions -F "#{session_name}" 2>/dev/null
}

# Function to create or attach to a session
create_or_attach() {
  session_name="$1"
  # Check if the session exists
  if tmux has-session -t "$session_name" 2>/dev/null; then
    # Kill Tmux Session
    terminal "tmux kill-session -t ${session_name}"
  fi
}

# Rofi command to show existing sessions
selected_session=$(list_sessions |
  rofi -dmenu -i -p "Kill Tmux Session")
[ -n "$selected_session" ] || exit 0

# Nuke any existing st (since you only use one terminal)
# pkill -x $TERMINAL 2>/dev/null || true
# sleep 0.1

# Kill tmux session
if [ -n "$selected_session" ]; then
  create_or_attach "$selected_session"
fi
