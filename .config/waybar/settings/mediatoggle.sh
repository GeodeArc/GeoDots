#!/bin/bash

# File to store the current mode
TOGGLE_FILE="/tmp/media-toggle"

# Initialize to spotify mode if file doesn't exist
if [[ ! -f "$TOGGLE_FILE" ]]; then
    echo "spotify" > "$TOGGLE_FILE"
fi

# Toggle between spotify and all
CURRENT_MODE=$(cat "$TOGGLE_FILE")
if [[ "$CURRENT_MODE" == "spotify" ]]; then
    echo "all" > "$TOGGLE_FILE"
else
    echo "spotify" > "$TOGGLE_FILE"
fi
