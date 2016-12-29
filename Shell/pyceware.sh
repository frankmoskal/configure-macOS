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
# cask-upgrade Installation                                                          #
###############################################################################

echo -e "${bold}${blue}==> ${default}${bold}Installing pyceware ${default}"
git clone git://github.com/frankmoskal/pyceware.git &>/dev/null
sudo cp -r "pyceware/data" "${HOME}/bin"
sudo cp -r "pyceware/pyceware.py" "${HOME}/bin"
sudo rm -r -f -P "../Downloads"

