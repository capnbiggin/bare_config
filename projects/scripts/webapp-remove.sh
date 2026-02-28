#!/usr/bin/env bash

source "${HOME}"/projects/scripts/lib/env.sh
source "${LIB_DIR}"/colors.sh
source "${LIB_DIR}"/lib/common.sh

ICON_DIR="$ACTUAL_HOME/.local/share/applications/icons"
DESKTOP_DIR="$ACTUAL_HOME/.local/share/applications/"

if [ "$#" -ne 1 ]; then
  source "$SCRIPTS_DIR"/show-logo.sh

  # Find all web apps
  while IFS= read -r -d '' file; do
    if grep -q '^Exec=.*google-chrome-stable.*--app' "$file"; then
      WEB_APPS+=("$(basename "${file%.desktop}")")
    fi
  done < <(find "$DESKTOP_DIR" -name '*.desktop' -print0)

  if ((${#WEB_APPS[@]})); then
    IFS=$'\n' SORTED_WEB_APPS=($(sort <<<"${WEB_APPS[*]}"))
    unset IFS
    APP_NAME=$(gum choose --header "Select web app to remove..." "${SORTED_WEB_APPS[@]}")
  else
    echo "No web apps to remove."
    exit 1
  fi
else
  APP_NAME="$1"
fi

if [[ -z "$APP_NAME" ]]; then
  echo "You must provide web app name."
  exit 1
fi

rm "$DESKTOP_DIR/$APP_NAME.desktop"
rm "$ICON_DIR/$APP_NAME.png"

if [ "$#" -ne 1 ]; then
  echo -e "Removed $APP_NAME\n"
fi

source "$SCRIPTS_DIR/show-done.sh"
