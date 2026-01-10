#!/usr/bin/env bash

set -eu

# A simple script to list, attach to, or create a new tmux session using rofi.

TERMINAL="ghostty" # Replace with your preferred terminal (e.g., gnome-terminal, kitty)

# Function to list tmux sessions
list_sessions() {
  tmux list-sessions -F "#{session_name}" 2>/dev/null
}

# Function to create or attach to a session
create_or_attach() {
  session_name="$1"
  # Check if the session exists
  if tmux has-session -t "$session_name" 2>/dev/null; then
    # Attach to existing session
    "$TERMINAL" -e tmux attach-session -t "$session_name"
  else
    # Create a new session with the given name and attach
    "$TERMINAL" -e tmux new-session -s "$session_name"
  fi
}

# Rofi command to show existing sessions and allow user input for a new name
selected_session=$(list_sessions |
  rofi -dmenu -i -p "Tmux Session" \
    -format s -entry-field "Enter a session name or select from list:")
[ -n "$selected_session" ] || exit 0

# Nuke any existing st (since you only use one terminal)
# pkill -x $TERMINAL 2>/dev/null || true
# sleep 0.1

# Launch tmux session
if [ -n "$selected_session" ]; then
  create_or_attach "$selected_session"
fi
