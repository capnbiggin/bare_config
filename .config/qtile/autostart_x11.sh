#!/usr/bin/env bash

# ------------------ #
# Autostart Programs #
# ------------------ #

picom --daemon &
sleep 1
waypaper --backend feh --restore &
