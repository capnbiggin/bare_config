#!/bin/bash

# Path to Hyprland config file
CONFIG="$HOME/.config/hypr/modules/hyprbinds.conf"

# Check if config file exists
if [[ ! -f "$CONFIG" ]]; then
  notify-send "Error" "Hyprland Keybing config file not found at $CONFIG"
  exit 1
fi

# Extract keybindings from config
get_keybindings() {
  # Read bind and bindm lines, filter and format
  grep -E '^\s*bind(m)?\s*=' "$CONFIG" | while read -r line; do
    # Skip commented lines
    [[ $line =~ ^\s*# ]] && continue

    # Remove bind/bindm prefix and split
    binding=$(echo "$line" | sed 's/^\s*bindm*\s*=//')

    # Split into modifier, key, and action
    IFS=',' read -r modifier key action <<<"$binding"

    # Clean up whitespace
    modifier=$(echo "$modifier" | tr -d '[:space:]')
    key=$(echo "$key" | tr -d '[:space:]')
    action=$(echo "$action" | tr -d '[:space:]')

    # Skip empty or invalid lines
    [[ -z "$modifier" || -z "$key" || -z "$action" ]] && continue

    # Format output for rofi
    echo "$modifier + $key : $action"
  done
}

# Create rofi menu
show_menu() {
  # Get keybindings and pipe to rofi
  get_keybindings | sort | rofi -dmenu -i -p "Hyprland Keybindings"
}

# Execute
show_menu
