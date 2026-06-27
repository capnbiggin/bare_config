#!/usr/bin/env bash

<< 'COMMENT'
This script is used to display the current CPU temperature in the status bar. 
It uses the `sensors` command from the lm-sensors package to get the CPU temperature information.

Required - `lm-sensors`
COMMENT

# RAWTEMP="$(cat /sys/class/thermal/thermal_zone0/temp)"
# echo "󰈸 $((RAWTEMP / 1000))°C"

RAW_TEMP="$(sensors | grep "Package id 0:" | awk '{print $4}' | sed 's/+//;s/°C//')"
echo "󰈸 ${RAW_TEMP}°C"
