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
# Hosts File Installation                                                     #
###############################################################################

echo -e "${bold}${blue}==> ${black}Updating Hosts File...${normal}"
sudo rm -f "/private/etc/hosts"
sudo touch "/private/etc/hosts"
curl -s https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -o hosts.txt
while IFS='' read -r line || [[ -n "$line" ]]; do
echo "$line" >> "/private/etc/hosts"
done < "Hosts.txt"
sudo rm -r -f -P "../Downloads"

###############################################################################
# Clear DNS Cache                                                             #
###############################################################################

sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
