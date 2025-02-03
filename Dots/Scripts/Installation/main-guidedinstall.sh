#!/bin/bash

clear

# 
# AUR INSTALL
# 
./Dots/Scripts/Installation/install-aur.sh

# 
# FONT INSTALLATION
# 

./Dots/Scripts/Installation/install-nerdfonts.sh
./Dots/Scripts/Installation/install-font.sh

#
# TWEAKS/FINAL INSTALL 
#

./Dots/Scripts/Installation/install-options.sh

# 
# PACKAGE INSTALL
# 

./Dots/Scripts/Installation/install-packages.sh
