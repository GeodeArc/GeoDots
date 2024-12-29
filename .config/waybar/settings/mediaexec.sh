#!/bin/bash

# File to store the current mode
TOGGLE_FILE="/tmp/media-toggle"

# Initialize the mode if file doesn't exist
if [[ ! -f "$TOGGLE_FILE" ]]; then
    echo "spotify" > "$TOGGLE_FILE"
fi

# Read the current mode
MODE=$(cat "$TOGGLE_FILE")

# Check if Spotify is running
SPOTIFY_RUNNING=$(playerctl -l 2>/dev/null | grep -q 'spotify' && echo "yes" || echo "no")

# Execute based on the current mode
if [[ "$MODE" == "spotify" ]]; then
    if [[ "$SPOTIFY_RUNNING" == "yes" ]]; then
        # Show Spotify's metadata if Spotify is open
        playerctl metadata --player=spotify --format '  {{title}} - {{artist}}'
    else
        # Show message if Spotify is not open
        echo "Spotify isn't open"
    fi
else
    # All-media mode, prefer non-Spotify if available
    OTHER_PLAYING=$(playerctl -l | grep -v 'spotify' | xargs -I {} playerctl --player={} status 2>/dev/null | grep 'Playing')
    if [[ -n "$OTHER_PLAYING" ]]; then
        playerctl metadata --format '󰎆  {{title}} - {{artist}}'
    else
        # Fallback to Spotify if it's the only player open
        if [[ "$SPOTIFY_RUNNING" == "yes" ]]; then
            playerctl metadata --player=spotify --format '  {{title}} - {{artist}}'
        else
            echo "No media playing"
        fi
    fi
fi
