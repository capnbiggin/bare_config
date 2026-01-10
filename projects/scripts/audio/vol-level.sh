#!/bin/bash

mute_status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf $3}')
if [[ $mute_status != "" ]]; then
    printf "MUTED"
    exit 0
fi
wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%s%\n", $2*100}'
