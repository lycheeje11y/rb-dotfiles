#!/bin/sh

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

NOTIFICATION_STATUS_COLOR=$TRANSPARENT

STATUS_LABEL=$(lsappinfo info -only StatusLabel "Microsoft Outlook")
if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
    LABEL="${BASH_REMATCH[1]}"

    if [[ $LABEL == "•" ]]; then
          NOTIFICATION_STATUS_COLOR=$TRANSPARENT_YELLOW
    elif [[ $LABEL =~ ^[0-9]+$ ]]; then
        NOTIFICATION_STATUS_COLOR=$TRANSPARENT_RED
    fi
fi

sketchybar --set outlook label="${LABEL}" 


STATUS_LABEL=$(lsappinfo info -only StatusLabel "Microsoft Teams")
if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
    LABEL="${BASH_REMATCH[1]}"

   if [[ $LABEL == "•" ]]; then
        if [[ $NOTIFICATION_STATUS_COLOR != $TRANSPARENT_RED ]]; then
          NOTIFICATION_STATUS_COLOR=$TRANSPARENT_YELLOW
        fi
    elif [[ $LABEL =~ ^[0-9]+$ ]]; then
        NOTIFICATION_STATUS_COLOR=$TRANSPARENT_RED
    fi
fi

sketchybar --set teams label="${LABEL}" 


STATUS_LABEL=$(lsappinfo info -only StatusLabel "Mattermost")
if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
    LABEL="${BASH_REMATCH[1]}"

    if [[ $LABEL == "•" ]]; then
        if [[ $NOTIFICATION_STATUS_COLOR != $TRANSPARENT_RED ]]; then
          NOTIFICATION_STATUS_COLOR=$TRANSPARENT_YELLOW
        fi
    elif [[ $LABEL =~ ^[0-9]+$ ]]; then
        NOTIFICATION_STATUS_COLOR=$TRANSPARENT_RED
    fi
fi

sketchybar --set mattermost label="${LABEL}" 

sketchybar --bar color=$NOTIFICATION_STATUS_COLOR  \
                 height=37        \
                 blur_radius=30   \
                 position=top     \
                 sticky=off       \
                 padding_left=10  \
                 padding_right=10 







