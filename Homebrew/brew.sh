#!/usr/bin/env bash

###############################################################################
# Preliminary Setup                                                           #
###############################################################################

# Sets Variables for Text Styling
bold=$(tput bold)
normal=$(tput sgr0)
blue=$(tput setaf 4)
black=$(tput setaf 0)


###############################################################################
# Homebrew Setup                                                              #
###############################################################################

# Installs Homebrew
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Updates Homebrew
brew update && brew upgrade

# Disables Analytics
brew analytics off

# Configures Homebrew and installs packages
brew tap Homebrew/bundle
brew bundle


###############################################################################
# Cleanup                                                                     #
###############################################################################

brew cleanup
brew prune

