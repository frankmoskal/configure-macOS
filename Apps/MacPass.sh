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
# MacPass Installation                                                          #
###############################################################################

git clone https://github.com/mstarke/MacPass --recursive
cd MacPass
git submodule sync
git submodule init
carthage bootstrap --platform Mac
xcodebuild -scheme MacPass -target MacPass -configuration Release -derivedDataPath ../BuildENV
if [ -f /Applications/MacPass.app ]; then
sudo rm -f /Applications/MacPass.app
fi
sudo cp -r -f "../BuildENV/Build/Products/Release/MacPass.app" "/Applications"
sudo rm -r -f  "../../Downloads"
