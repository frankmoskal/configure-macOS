#!/usr/bin/env bash

###############################################################################
# Preliminary Setup                                                           #
###############################################################################

# Sets Variables for Text Styling
bold=$(tput bold)
default=$(tput sgr0)
blue=$(tput setaf 4)

# Checks for sudo permissions
if ! sudo -S true < /dev/null &>/dev/null ; then
echo -e "${bold}${blue}==> ${default}${bold}Input an Administrator's Password: ${default}"
sudo -v
fi

# Updates existing sudo time stamp until script finishes
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Run a Software Update & Set Defaults                                        #
###############################################################################

# Performs a software update
sudo softwareupdate --install --all --background &>/dev/null

# Sets OS-Level Defaults
source configure-macOS.sh

###############################################################################
# Cleanup                                                                     #
###############################################################################

# Deletes all occurrences of .DS_Store files
sudo find / -name ".DS_Store" -depth -exec rm {} \; &>/dev/null
