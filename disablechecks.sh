#!/bin/bash

STATE_FILE="/tmp/geodots_skipchecks"

if [[ -f "$STATE_FILE" && "$(cat "$STATE_FILE")" == "true" ]]; then
    echo "Press ENTER to DISABLE skip checking, or press CTRL+C to exit."
    read -p " ■ "
    rm /tmp/geodots_skipchecks
else
    echo "Press ENTER to ENABLE skip checking, or press CTRL+C to exit."
    echo "This will allow you to skip any checks to see if stuff is installed or not."
    echo "Primarly for testing/bug reports."
    read -p " ■ "
    echo true > "/tmp/geodots_skipchecks" 
fi