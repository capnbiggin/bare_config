#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/Wallpapers"
CACHE_DIR="$HOME/.cache/thumbnails/large"  # Standard XDG thumbnail cache

# Ensure thumbnail cache exists
mkdir -p "$CACHE_DIR"

# Generate entries with thumbnails (rofi will auto-generate if missing)
find "$WALL_DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) -print0 |
    while IFS= read -r -d '' file; do
        basename=$(basename "$file")
        echo -en "$basename\0icon\x1fthumbnail://$file\n"
    done |
    rofi -dmenu \
         -show-icons \
         -theme ~/.config/rofi/wallpaper-selector.rasi \
         -p "Select Wallpaper" |
    while read -r selected; do
        if [[ -n "$selected" ]]; then
            full_path="$WALL_DIR/$selected"
            # Set wallpaper with swww (smooth transition)
            swww img "$full_path" --transition-type center --transition-fps 60 --transition-duration 1

            # Regenerate colors with matugen
            matugen image "$full_path"

            # Optional: force reload apps if needed (kitty/gtk/hyprland already in your config)
            # pkill -USR1 kitty  # Example for kitty if reload_apps doesn't catch it
        fi
    done
