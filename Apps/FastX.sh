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
# FastX Installation                                                          #
###############################################################################

echo -e "${bold}${blue}==> ${default}${bold}Input your FastX License Key: ${default}"
read -er -p "License Key: " key
echo -e "${bold}${blue}==> ${default}${bold}Downloading FastX...${default}"
wget -q --trust-server-names "https://www.starnet.com/fastx/download.php?license_key=$key" -O FastX.txt &>/dev/null
while IFS='' read -r line || [[ -n "$line" ]]; do
if [[ "$line" == *".dmg"* && "$line" == *"/files/private/"* ]]; then
line=${line#*\"}
download=${line%%\"*}
fi
done < "FastX.txt"
file=${download##*/}
wget -q "https://www.starnet.com/$download"
sleep 2
echo -e "${bold}${blue}==> ${default}${bold}Installing FastX...${default}"
hdiutil mount "$file" &>/dev/null
if [ -f /Applications/FastX.app ]; then
sudo rm -f /Applications/FastX.app
fi
sudo cp -r -f "/Volumes/FastX/FastX.app" "/Applications"
hdiutil unmount "/Volumes/FastX/FastX.app" &>/dev/null
sudo rm -r -f -P  "../Downloads"
