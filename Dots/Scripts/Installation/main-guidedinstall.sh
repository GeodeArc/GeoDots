#!/bin/bash

clear
echo "" > /tmp/geodots_aurhelper

#
# DOTFILES OPTIONS + BASE INSTALL 
#

./Dots/Scripts/Installation/install-options.sh

# 
# PACKAGE INSTALL
# 

./Dots/Scripts/Installation/install-packages.sh
