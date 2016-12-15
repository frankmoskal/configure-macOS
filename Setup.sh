#!/usr/bin/env bash

###############################################################################
# Preliminary Setup                                                           #
###############################################################################

# Clears Screen
clear

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
