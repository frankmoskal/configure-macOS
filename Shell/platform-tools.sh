#!/usr/bin/env bash

###############################################################################
# Preliminary Setup                                                           #
###############################################################################

# Sets Variables for Text Styling
bold=$(tput bold)
default=$(tput sgr0)
blue=$(tput setaf 4)

mkdir "../Downloads"
cd "../Downloads"


###############################################################################
# Android Platform Tools Installation                                         #
###############################################################################

echo -e "${bold}${blue}==> ${default}${bold}Downloading Android Platform Tools...${default}"
wget -q "https://dl.google.com/android/repository/platform-tools-latest-darwin.zip"
unzip "../Downloads/platform-tools-latest-darwin.zip" -d "${HOME}/bin" &>/dev/null
sudo rm -r -f -P "../Downloads"
