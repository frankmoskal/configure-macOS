#!/usr/bin/env bash

###############################################################################
# Preliminary Setup                                                           #
###############################################################################

# Clears Screen
clear

# Sets Variables for Text Styling
bold=$(tput bold)
normal=$(tput sgr0)
blue=$(tput setaf 4)
black=$(tput setaf 0)


###############################################################################
# Xcode Command Line Tools (CLT)                                              #
###############################################################################

# Installs Xcode Command Line Tools (CLT)
xcode-select --install &>/dev/null

# Wait until the Xcode Command Line Tools are installed
until $(xcode-select -p &>/dev/null); then
sleep 5
done

# Accept Xcode CLT License Agreement
sudo xcodebuild -license accept
