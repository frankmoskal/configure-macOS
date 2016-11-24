#!/usr/bin/env bash

###############################################################################
# Preliminary Setup                                                           #
###############################################################################

# Sets Variables for Text Styling
bold=$(tput bold)
normal=$(tput sgr0)
blue=$(tput setaf 4)
black=$(tput setaf 0)

mkdir "../Downloads"
cd "../Downloads"


###############################################################################
# cask-upgrade Installation                                                          #
###############################################################################

echo -e "${bold}${blue}==> ${black}Installing cask-upgrade ${normal}"
git clone git://github.com/frankmoskal/cask-upgrade.git &>/dev/null
mv "cask-upgrade/cask-upgrade.py" "../Shell/Bash/bin"
sudo rm -r -f -P "../Downloads"

