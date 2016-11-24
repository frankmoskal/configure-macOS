#!/usr/bin/env bash

###############################################################################
# Preliminary Setup                                                           #
###############################################################################

# Add shells installed by Homebrew
sudo bash -c "bash" >> /etc/shells"

# Set default shell for the current user
chsh -s $(which bash)
