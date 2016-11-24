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
# FastX Installation                                                          #
###############################################################################

echo -e "${bold}${blue}==> ${black}Input your FastX License Key: ${normal}"
read -er -p "License Key: " key
echo -e "${bold}${blue}==> ${black}Installing FastX...${normal}"
wget -q --trust-server-names "https://www.starnet.com/fastx/download.php?license_key=$key" -O FastX.txt &>/dev/null
while IFS='' read -r line || [[ -n "$line" ]]; do
if [[ "$line" == *".dmg"* && "$line" == *"/files/private/"* ]]; then
line=${line#*\"}
file=${line%%\"*}
fi
done < "FastX.txt"
rm "FastX.txt"
wget -q "https://www.starnet.com/$file"
hdiutil mount "../Downloads/$(ls ../Downloads)" &>/dev/null
cp -r "/Volumes/FastX/FastX.app" "${HOME}/Desktop"
hdiutil unmount "/Volumes/FastX/FastX.app" &>/dev/null
sudo rm -r -f -P  "../Downloads"
