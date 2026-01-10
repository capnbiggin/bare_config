#!/usr/bin/env bash

DIR="$HOME/.config/rofi/launchers/type-1"
THEME="style-2"

# Run
rofi \
  -show drun \
  -theme ${DIR}/${THEME}.rasi
