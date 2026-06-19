#!/usr/bin/env bash

nmcli dev wifi | awk '/\*/{if (NR!=1) {print $3, $8"%"}}'
# nmcli -g n | grep "connected to"