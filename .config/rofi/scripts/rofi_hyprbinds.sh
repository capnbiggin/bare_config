#!/usr/bin/env bash

#!/usr/bin/env bash
# hyprland-keybinds.sh
# Show Hyprland keybindings in rofi
# Usage: bash hyprland-keybinds.sh
# Optional: bind it in hyprland.conf:
#   bind = $mainMod, F1, exec, ~/.config/hypr/hyprland-keybinds.sh

HYPRLAND_CONF="${XDG_CONFIG_HOME:-$HOME/.config}/hypr/modules/binds.conf"

# ── Parse keybinds from hyprland.conf ────────────────────────────────────────
parse_conf() {
  if [[ -f "$HYPRLAND_CONF" ]]; then
    grep -E '^\s*bind\s*=' "$HYPRLAND_CONF" |
      sed 's/^\s*bind\s*=\s*//' |
      awk -F',' '{
            mod=$1; key=$2; action=$3; arg=$4
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", mod)
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", key)
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", action)
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", arg)
            printf "%-30s  %-20s  %s\n", mod" + "key, action, arg
        }'
  fi
}

# ── Fallback: built-in common Hyprland keybind reference ─────────────────────
builtin_keybinds() {
  cat <<'EOF'
─── Window Management ─────────────────────────────────────────────────────────
SUPER + Q                          Kill active window
SUPER + F                          Toggle fullscreen
SUPER + V                          Toggle floating
SUPER + P                          Toggle pseudo (dwindle)
SUPER + J                          Toggle split (dwindle)
SUPER + left/right/up/down         Move focus between windows
SUPER + SHIFT + left/right/up/down Move/resize window
─── Workspaces ────────────────────────────────────────────────────────────────
SUPER + 1-9                        Switch to workspace 1-9
SUPER + SHIFT + 1-9                Move window to workspace 1-9
SUPER + S                          Toggle scratchpad workspace
SUPER + mouse scroll               Cycle workspaces
─── Launchers ─────────────────────────────────────────────────────────────────
SUPER + Return                     Terminal (kitty)
SUPER + D                          App launcher (rofi/wofi)
SUPER + E                          File manager
SUPER + B                          Browser
─── System ────────────────────────────────────────────────────────────────────
SUPER + L                          Lock screen
SUPER + M                          Exit Hyprland
SUPER + SHIFT + R                  Reload Hyprland config
Print                              Screenshot (full)
SUPER + Print                      Screenshot (region)
─── Media ─────────────────────────────────────────────────────────────────────
XF86AudioRaiseVolume               Volume up
XF86AudioLowerVolume               Volume down
XF86AudioMute                      Toggle mute
XF86MonBrightnessUp                Brightness up
XF86MonBrightnessDown              Brightness down
EOF
}

# ── Main ──────────────────────────────────────────────────────────────────────
main() {
  local entries=""

  # Try to parse live config first
  if [[ -f "$HYPRLAND_CONF" ]]; then
    entries=$(parse_conf)
  fi

  # If no entries parsed (empty config or no binds), show built-in reference
  if [[ -z "$entries" ]]; then
    entries=$(builtin_keybinds)
  fi

  # Pipe to rofi
  chosen=$(echo "$entries" | rofi \
    -dmenu \
    -i \
    -p "Hyprland Keybinds" \
    -theme-str 'window {width: 60%;}' \
    -theme-str 'listview {lines: 20;}' \
    -font "monospace 11" \
    -no-fixed-num-lines \
    -format 'i')

  # Nothing selected — exit cleanly
  exit 0
}

main "$@"
