#!/bin/bash

echo "Welcome to Doge's Dots Installer!"
echo ""
read -p 'Press ENTER to START the installation: '

# 
# FONT INSTALLATION #
# 

./Scripts/Installation/nerdfontinstall.sh

# 
# GTK DARK THEME INSTALL #
# 

./Scripts/Installation/libadwaitafix.sh
