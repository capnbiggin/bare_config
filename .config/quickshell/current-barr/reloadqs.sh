#!/usr/bin/env bash

<< 'COMMENT' 
This script is used to reload the QuickShell configuration. It is called by the "Reload QuickShell" action in the QuickShell menu.
COMMENT

# Get the path to the QuickShell configuration file
QS_SHELL="$(dirname "$(realpath "$0")")"

pkill qs

sleep 1

qs -p "$QS_SHELL" &