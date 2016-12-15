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
# Homebrew Setup                                                              #
###############################################################################

# Configures Homebrew and installs packages
brew bundle
brew cask cleanup

# Resets QuickLook
qlmanage -r

#mas-cli setup
echo -e "${bold}${blue}==> ${default}${bold}Input your Apple ID: ${default}"
read -er -p "Apple ID: " id
mas signin "$id"

# Installs Xcode
mas install 497799835


###############################################################################
# Cleanup                                                                     #
###############################################################################


sudo rm -f -r "/Applications/Microsoft Outlook.app"
sudo rm -f -r "/Applications/Microsoft OneNote.app"
