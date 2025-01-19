#!/bin/bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

if pgrep -i zscaler > /dev/null; then
    sketchybar --set zscaler background.color=$TRANSPARENT_PURPLE \
               --set zscaler label="on"
else
    sketchybar --set zscaler background.color=$TRANSPARENT \
               --set zscaler label="off"
fi
