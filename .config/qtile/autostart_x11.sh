#!/usr/bin/env bash

# ------------------ #
# Autostart Programs #
# ------------------ #

picom --daemon &
sleep 1
awww-daemon &
kanshi &
waypaper --backend awww --restore &
xwayland-satellite &
swaync &
/usr/lib/polkit-kde-authentication-agent-1 &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
