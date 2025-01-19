#!/bin/bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

EVENTS="$(icalBuddy -n -nc -b '' -iep 'title,datetime' -po 'title,datetime' -ps '/|/' -ea eventsToday)"
NOW="$(date +"%d.%m.%Y %H:%M")"

if [[ -z "$EVENTS" ]]; then
  sketchybar --set "$NAME" label="$NOW"
  exit 0
fi

MAX_EVENTS=10
for I in $(seq 1 "$MAX_EVENTS"); do
  if sketchybar --query "${NAME}.${I}" &>/dev/null; then
    sketchybar --remove "${NAME}.${I}"
  fi
done

N=0
while IFS= read -r EVENT; do
  TITLE="$(cut -d'|' -f1 <<<"$EVENT")"
  DATETIME="$(cut -d'|' -f2 <<<"$EVENT")"
  START="$(cut -d'-' -f1 <<<"$DATETIME" | xargs)"
  END="$(cut -d'-' -f2 <<<"$DATETIME" | xargs)"

  if [[ "$N" == 0 ]]; then
    CURRENT_SECONDS="$(date +"%s")"
    START_SECONDS="$(date -j -f "%H:%M" "$START" +"%s")"
    END_SECONDS="$(date -j -f "%H:%M" "$END" +"%s")"

    if [[ "$((CURRENT_SECONDS - START_SECONDS))" -ge 0 && "$((END_SECONDS - CURRENT_SECONDS))" -gt 0 ]]; then
      BG_COLOR="$TRANSPARENT_PURPLE"
      LABEL="${NOW} | to ${END} - ${TITLE}"
    elif [[ "$((START_SECONDS - CURRENT_SECONDS))" -le 300 ]]; then
      BG_COLOR="$TRANSPARENT_RED"
      LABEL="${NOW} | from ${START} - ${TITLE}"
    else
      BG_COLOR="$TRANSPARENT"
      LABEL="${NOW} | from ${START} - ${TITLE}"
    fi

    sketchybar --set "$NAME" \
      drawing=on \
      label="$LABEL" \
      background.color="$BG_COLOR"
  elif [[ "$N" -le "$MAX_EVENTS" ]]; then
    sketchybar --add item "${NAME}.${N}" "popup.${NAME}" \
      --set "${NAME}.${N}" icon="󰃶" \
      label="${TITLE} from ${START} to ${END}"
  fi

  N=$((++N))
done <<<"$EVENTS"
