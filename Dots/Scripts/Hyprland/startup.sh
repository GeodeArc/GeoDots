#!/bin/bash

# Make terminal flexible later!
if [ -f "$HOME/Dots/Options/startup" ] && grep -q "postinstall" "$HOME/Dots/Options/startup"; then
    kitty $HOME/Dots/Scripts/postinstall.sh
fi
