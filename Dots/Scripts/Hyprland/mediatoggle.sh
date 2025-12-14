#!/bin/bash

CURRENT_PLAYER="$(cat $HOME/Dots/Options/player)"
PLAYER_PATH="$HOME/Dots/Options/player"
COMMAND_PATH="$HOME/.config/hypr/config/player.conf"
DEFINED_PLAYER="$(cat $HOME/Dots/Options/mediaplayer)"

if [[ "$CURRENT_PLAYER" == "$DEFINED_PLAYER" ]]; then
    notify-send -i folder-music-symbolic "Media Mode Changed" "Media type is now set to 'All'"
    echo "all" > "$PLAYER_PATH"
    echo -e "\$player = "> "$COMMAND_PATH"
else
    notify-send -i  folder-music-symbolic "Media Mode Changed" "Media type is now set to '$DEFINED_PLAYER'"
    echo "$DEFINED_PLAYER" > "$PLAYER_PATH"
    echo -e "\$player = --player $DEFINED_PLAYER" > "$COMMAND_PATH"
fi
