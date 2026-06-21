#!/usr/bin/env bash

<< 'COMMENT'
This script is used to display the current Wi-Fi SSID and signal strength in the status bar. 
It uses the `nmcli` command to get the Wi-Fi information from NetworkManager.

Required - `networkmanager`
COMMENT

# SSID="$(nmcli -g n | grep "connected to" | awk 'match($0, / to /) {print substr($0, RSTART+RLENGTH)}')"
# SSID="$(nmcli -g n | grep "connected to" | sed 's/.* to //')"
# SSID="$(nmcli -g n | grep "connected to" | awk '{print substr($0, index($0,$4))}')"

SSID="$(nmcli -t -f active,ssid dev wifi | awk -F: '$1 ~ /^yes/ {print $2}')"
SIG="$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '*' | sed 's/[^0-9]//g')"

echo "󰖩 ${SSID} ${SIG}%"
