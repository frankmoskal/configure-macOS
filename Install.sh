#!/usr/bin/env bash

###############################################################################
# Preliminary Setup                                                           #
###############################################################################

# Sets Variables for Text Styling
bold=$(tput bold)
normal=$(tput sgr0)
blue=$(tput setaf 4)
black=$(tput setaf 0)

# Sets OS-Level Defaults
source .macOS

# Installs Xcode command line tools
xcode --select install


###############################################################################
# Homebrew Setup                                                              #
###############################################################################

# Installs Homebrew
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Updates Homebrew
brew update && brew upgrade

# Disables Analytics
brew analytics off

# Taps homebrew/bundle to run brewfile
brew tap Homebrew/bundle

# Configures Homebrew and installs packages
brew bundle

# Resets QuickLook
qlmanage -r

#mas-cli setup
echo -e "${bold}${blue}==> ${black}Input your Apple ID: ${normal}"
read -p "Apple ID: " id
mas signin $id

# Installs Xcode
mas install 497799835


###############################################################################
# Bash Setup                                                                  #
###############################################################################



###############################################################################
# Telegram-cli Setup                                                          #
###############################################################################


###############################################################################
# Cleanup                                                                     #
###############################################################################

# Deletes all occurrences of .DS_Store files
sudo find / -name ".DS_Store" -depth -exec rm {} \; &>/dev/null
