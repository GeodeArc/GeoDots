#!/bin/bash
clear
echo "8888888b.                            888    "
echo "888   Y88b                           888    "
echo "888    888                           888    "
echo "888   d88P .d88b.  .d8888b   .d88b.  888888 "
echo "888888P   d8P  Y8b 88K      d8P  Y8b 888    "
echo "888 T88b  88888888  Y8888b. 88888888 888    "
echo "888  T88b Y8b.          X88 Y8b.     Y88b.  "
echo "888   T88b Y88888   88888P   Y8888    Y888  "
echo ""
echo ""
echo "This script will allow you to reinstall things like nerd fonts/AUR helpers if they didnt install properly the first time"
read -p "Press enter to delete cache files, or ctrl+c to stop this script: "

rm -r /tmp/dotaurinstall
rm -r /tmp/dotfontinstall
