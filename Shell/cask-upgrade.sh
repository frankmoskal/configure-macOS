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

echo -e "${bold}${blue}==> ${default}${bold}Installing cask-upgrade ${default}"
git clone git://github.com/frankmoskal/cask-upgrade.git &>/dev/null
sudo mv -f "cask-upgrade/cask-upgrade.py" "../Shell/Bash/bin"
sudo rm -r -f -P "../Downloads"

