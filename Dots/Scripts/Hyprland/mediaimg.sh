#!/bin/bash
# production code 😭
# gets artist name too since that means less scripts

CURRENT_PLAYER=$(cat "$HOME/Dots/Options/player")
CURRENT_IMG=$(< "$HOME/Dots/Options/playerimg-data")

if [[ "$CURRENT_PLAYER" == "all" ]]; then
	PLAYER_TYPE=()
else
	PLAYER_TYPE=(--player="$CURRENT_PLAYER")
fi

IMG=$(playerctl metadata $PLAYER_TYPE --format "{{ mpris:artUrl }}" 2>&1)
ARTIST=$(playerctl metadata $PLAYER_TYPE --format "{{ xesam:artist }}" 2>&1)

if ! [ -f "$HOME/Dots/Options/playerimg" ]; then
	rm $HOME/Dots/Options/playerimg-data
fi 

if [[ "$CURRENT_IMG" == "$IMG" ]]; then
	echo "󰠃  $ARTIST"
	exit 0	
fi

if echo $IMG | grep -q 'No players found'; then
	rm -f ~/Dots/Options/playerimg
	echo "No Artist"
else
	echo "$IMG" > $HOME/Dots/Options/playerimg-data
	curl -s $IMG | convert - -gravity center -crop 1:1 +repage $HOME/Dots/Options/playerimg
	echo "󰠃  $ARTIST"
fi
