#!/usr/bin/env bash

# ------------------ #
# Autostart Programs #
# ------------------ #

picom --daemon &
sleep 1
awww-daemon &
kanshi &
swaync &
waypaper --backend awww --restore &
xwayland-satellite &
/usr/lib/polkit-kde-authentication-agent-1 &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
