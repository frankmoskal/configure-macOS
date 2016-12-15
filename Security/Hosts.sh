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

# Checks for sudo permissions
if ! sudo -S true < /dev/null &>/dev/null ; then
echo -e "${bold}${blue}==> ${default}${bold}Input an Administrator's Password: ${default}"
sudo -v
fi

# Updates existing sudo time stamp until script finishes
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Hosts File Installation                                                     #
###############################################################################

echo -e "${bold}${blue}==> ${default}${bold}Updating Hosts File...${default}"
sudo rm -f "/private/etc/hosts"
curl -s https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -o hosts
sudo mv -f "hosts" "/private/etc/"
sudo rm -r -f -P "../Downloads"

###############################################################################
# Clear DNS Cache                                                             #
###############################################################################

sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
