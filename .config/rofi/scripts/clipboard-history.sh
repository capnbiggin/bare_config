#!/usr/bin/env bash

cliphist list | rofi -dmenu -p " Clipboard History" | cliphist decode | wl-copy
