#!/bin/bash

sketchybar -m --add item calendar_with_meetings left \
    --set calendar_with_meetings icon=":calendar:" \
          update_freq=20 \
          updates=on \
          label.max_chars=53\
          label.scroll_duration=300\
          scroll_texts=on\
          icon.font="sketchybar-app-font:Regular:15.0" \
          popup.background.color="$TRANSPARENT" \
          popup.height=20 \
          script="$PLUGIN_DIR/calendar_with_meetings.sh" \
          click_script="sketchybar -m --set calendar_with_meetings popup.drawing=toggle"
