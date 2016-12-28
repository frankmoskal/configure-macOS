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
# Google Hangouts Installation                                                #
###############################################################################

nativefier -f --name "Hangouts" https://hangouts.google.com > path.txt

while IFS='' read -r line || [[ -n "$line" ]]; do
if [ "$line" == *"App built to"* ]; then
path=${line#*/"}
fi
done < "path.txt"
echo "$path"

#sudo rm -r -f -P  "../Downloads"
