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
# SpoofMAC Installation                                                       #
###############################################################################

git clone git://github.com/feross/SpoofMAC.git &>/dev/null
cd SpoofMAC
python setup.py install &>/dev/null
# Download the startup file for launchd
curl -s https://raw.githubusercontent.com/feross/SpoofMAC/master/misc/local.macspoof.plist > local.macspoof.plist
# Customize location of `spoof-mac.py` to match your system
cat local.macspoof.plist | sed "s|/usr/local/bin/spoof-mac.py|`which spoof-mac.py`|" | tee local.macspoof.plist &>/dev/null
# Copy file to the OS X launchd folder
sudo cp local.macspoof.plist /Library/LaunchDaemons
# Set file permissions
sudo chown root:wheel /Library/LaunchDaemons/local.macspoof.plist
sudo chmod 0644 /Library/LaunchDaemons/local.macspoof.plist


###############################################################################
# Cleanup                                                                     #
###############################################################################

sudo rm -r -f -P "../../Downloads"
