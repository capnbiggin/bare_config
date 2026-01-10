#!/usr/bin/env bash
# Script from rwx.gg
# makes the $PATH enviroment varoable and replacese every : with a new line.

echo -e "${PATH//:/\\n}"
