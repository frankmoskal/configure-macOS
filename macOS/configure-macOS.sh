#!/usr/bin/env bash

###############################################################################
# Preliminary Setup                                                           #
###############################################################################

# Sets Variables for Text Styling
bold=$(tput bold)
default=$(tput sgr0)
blue=$(tput setaf 4)

# Closes System Preferences
osascript -e 'tell application "System Preferences" to quit'

# Checks for sudo permissions
if ! sudo -S true < /dev/null &>/dev/null ; then
echo -e "${bold}${blue}==> ${default}${bold}Input an Administrator's Password: ${default}"
sudo -v
fi

# Updates existing sudo time stamp until script finishes
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo -e "${bold}${blue}==> ${default}${bold}Input your HostName: ${default}"
read -er -p "Hostname: " host

###############################################################################
# Accessibility Settings                                                      #
###############################################################################

# Disable Dictation
defaults write com.apple.assistant.support "Dictation Enabled" -bool false
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs MasterDictationEnabled -bool false
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs IntroMessagePresented -bool false

# Disable VoiceOver on login window
sudo defaults write /Library/Preferences/com.apple.loginwindow UseVoiceOverAtLoginwindow -bool false

# Disable application alert announcements
sudo defaults write com.apple.speech.synthesis.general.prefs TalkingAlertsSpeakTextFlag -bool false

# Disable "speak selected text" function"
sudo defaults write com.apple.speech.synthesis.general.prefs SpokenUIUseSpeakingHotKeyFlag -bool false

# Disable VoiceOver per user
defaults write ~/Library/Preferences/com.apple.universalaccess voiceOverOnOffKey -bool false


###############################################################################
# Activity Monitor Settings                                                   #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Sets Update Interval to 2 seconds
defaults write com.apple.ActivityMonitor UpdatePeriod -int 2


###############################################################################
# App Store Settings                                                          #
###############################################################################

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Installs System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Shows Debug Menu
defaults write com.apple.appstore ShowDebugMenu -bool true

# Enables WebKit Developer Tools
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Install updates to applications loaded via Mac App Store
defaults write com.apple.commerce AutoUpdate -bool true

###############################################################################
# Date & Time Settings                                                        #
###############################################################################

# Sets Analog Clock
defaults write com.apple.menuextra.clock IsAnalog -bool true

# Formats Digital Clock
defaults write com.apple.menuextra.clock DateFormat -string "HH:mm"

# Sets timezone to
sudo systemsetup -settimezone "America/New_York" &>/dev/null

# Adjust timezone using Location Services
sudo defaults write /Library/Preferences/com.apple.timezone.auto.plist Active -bool true

# Enables Network Time Protocol (NTP) Date/Time
sudo systemsetup -setusingnetworktime on &> /dev/null
sudo systemsetup -setnetworktimeserver "time.euro.apple.com" &>/dev/null
sudo ntpdate -u "time.euro.apple.com" &>/dev/null

###############################################################################
# Desktop Settings                                                            #
###############################################################################

# Don't show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false


###############################################################################
# Disk Utility Settings                                                       #
###############################################################################

# Enables the Debug Menu
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true

# Enables Advanced Options for Disk Utiliy
defaults write com.apple.DiskUtility advanced-image-options -bool true


###############################################################################
# Dock Settings                                                               #
###############################################################################

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Changes minimize/maximize window effect to scale"
defaults write com.apple.dock mineffect -string "scale"

# Disables Launch Animations for applications
defaults write com.apple.dock launchanim -bool false

# Minimizes windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Speeds up Mission Control animations"
defaults write com.apple.dock expose-animation-duration -float 0.1

# Disables Mission Control and Spaces
defaults write com.apple.dock mcx-expose-disabled -bool TRUE

# Shortens the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Disables opening application animations from the Dock
defaults write com.apple.dock launchanim -bool false


###############################################################################
# Finder Settings                                                             #
###############################################################################

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Sets new finder window to ~/Desktop
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Gets rid of the file extension change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disables the creation of .DS_Store files
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disables window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Un-Hides Library
sudo chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
General -bool true \
OpenWith -bool true \
Privileges -bool true

# Sets QuickLook open/close animation speed
defaults write NSGlobalDomain QLPanelAnimationDuration -float 0

# Default to the Column view in Finder windows
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Shows hidden files
defaults write com.apple.finder AppleShowAllFiles TRUE


###############################################################################
# Keyboard & Trackpad Settings                                                #
###############################################################################

# Disables tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 0
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 0

# Enables full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Maps bottom right-hand corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Enables Force Click and haptic feedback
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool true
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool false
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool true

# Sets a faster tracking Speed
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3

# Stop iTunes from responding to the keyboard media keystime
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist &> /dev/null

# Disables Smart Dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disables Smart Quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disables Automatic Spelling Correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Sets Automatic Backlight Brightness
defaults write com.apple.BezelServices kDim -bool false
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool false

# Dims Keyboard Backlight after 60 seconds of inactivity
defaults write com.apple.BezelServices kDimTime -int 60
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Keyboard Dim Time" -int 60


###############################################################################
# Messages Settings                                                           #
###############################################################################

# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false


###############################################################################
# Safari Settings                                                             #
###############################################################################

# Sets Safari’s home page to `about:blank`
defaults write com.apple.Safari HomePage -string 'about:blank'
defaults write com.apple.Safari NewWindowBehavior -int 1
defaults write com.apple.Safari NewTabBehavior -int 1

# Enables continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true

# Disables auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Enables “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Sets Download Directory to "~/Downloads"
defaults write com.apple.Safari DownloadsPath -string "${HOME}/Downloads"

# Disables Resume for Safari
defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -int 0

# Removes items from the Downloads List as soon as they finish
defaults write com.apple.Safari DownloadsClearingPolicy -int 2

# Disables opening files upon download completion.
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Disables Preloading the Top Hit in Safari
defaults write com.apple.Safari PreloadTopHit -bool true

# Geolocation set to ask user once a day for each website
defaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 1

# Disables DNS prefetching
defaults write com.apple.safari WebKitDNSPrefetchingEnabled -boolean false

# Disables AutoFill
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Disables fraudulent website warnings
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Disables the standard delay in rendering a Web page.
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25

# Updates extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# Hides Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Set default encoding
defaults write com.apple.Safari WebKitDefaultTextEncodingName -string 'utf-8'
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DefaultTextEncodingName -string 'utf-8'

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Makes Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Removes useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Disables sending search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true


###############################################################################
# Screenshot Settings                                                         #
###############################################################################

# Saves screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Saves screenshots in PNG format
defaults write com.apple.screencapture type -string "png"

# Disables shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Removes the date and time Stamp from Screenshots
defaults write com.apple.screencapture "include-date" 0;


###############################################################################
# Security Settings                                                           #
###############################################################################

# Seeds /dev/random and enables FileVault
if [[ $(sudo fdesetup status | head -1) == "FileVault is Off." ]]; then
openssl rand "$(($RANDOM * $RANDOM * $RANDOM * $RANDOM))" > /dev/random
sudo fdesetup enable -user $(whoami)
fi

# Enables auto updates
sudo softwareupdate --schedule on &> /dev/null

# Disables AirDrop
defaults write com.apple.NetworkBrowser DisableAirDrop -bool true

# Disables the sending of diagnostic data to Apple
defaults write ~/Library/Preferences/ByHost/com.apple.SubmitDiagInfo.$HW_UUID AutoSubmit -bool false

# Disable Infared Remote
sudo defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -bool false

# Ensures screen locks immediately when requested
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disables remote Apple Events
sudo systemsetup -setremoteappleevents off &> /dev/null

# Don’t open Bluetooth setup assistant if nothing's been detected
sudo defaults write /Library/Preferences/com.apple.Bluetooth BluetoothAutoSeekKeyboard -bool false
sudo defaults write /Library/Preferences/com.apple.Bluetooth BluetoothAutoSeekPointingDevice -bool false

# Forbid Bluetooth devices to wake the computer
defaults write ~/Library/Preferences/ByHost/com.apple.Bluetooth.$HW_UUID RemoteWakeEnabled -bool false

# Disables Bonjour Advertising
sudo defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder ProgramArguments -array-add "-NoMulticastAdvertisements"

# Disables remote login
sudo systemsetup -f -setremotelogin off &> /dev/null

# Disables Wake on Network Access
sudo systemsetup -setwakeonnetworkaccess off &> /dev/null

# Disables Remote Management
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop &> /dev/null

###############################################################################
# SSD Settings                                                                #
###############################################################################

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Set hibernatefile to `/dev/null` so it will not be recreated
sudo pmset -a hibernatefile /dev/null
# Remove the sleep image file to save disk space
sudo rm -f /private/var/vm/sleepimage
# Create a zero-byte file instead…
sudo touch /private/var/vm/sleepimage
# …and make sure it can't be rewritten
sudo bash -c "chflags uchg /private/var/vm/sleepimage"


###############################################################################
# System/UI Settings                                                          #
###############################################################################

# Disables the sound effects on boot
sudo nvram SystemAudioVolume=""

# Enables verbose boot mode"
sudo nvram boot-args="-v"

# Sets U.K. locale with U.S. curency
defaults write ~/Library/Preferences/.GlobalPreferences.plist AppleLocale -string "en_GB@currency=USD"

# Disables Siri
defaults write com.apple.assistant.support "Assistant Enabled" -bool true
defaults write com.apple.Siri StatusMenuVisible -bool false

# Enables access for assistive devices
echo -n 'a' | sudo tee /private/var/db/.AccessibilityAPIEnabled > /dev/null 2>&1
sudo chmod 444 /private/var/db/.AccessibilityAPIEnabled

# Sets printer app to quit once printing is complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Changes Computer Name & Hostname
sudo scutil --set ComputerName "$host"
sudo scutil --set HostName "$host"
sudo scutil --set LocalHostName "$host"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$host"

# Disables animations when opening and closing windows.
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Disables animations when opening a Quick Look window.
defaults write -g QLPanelAnimationDuration -float 0

# Disables Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disables Smart Quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disables smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Enables Launching Apps from Anywhere
sudo spctl --master-disable

# Increases window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Stops Photos from opening automatically when connecting an iPhone
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Restarts automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Sets number of recent items (Applications, Document, Servers)
for category in 'applications' 'documents' 'servers'; do
/usr/bin/osascript -e "tell application \"System Events\" to tell appearance preferences to set recent $category limit to 0"
done

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Sets the system theme to Dark
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Sets scroll bar visibility to "When Scrolling"
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Disables the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Makes Crash Reporter appear as a notification
defaults write com.apple.CrashReporter UseUNC 1

# Shows battery life percentage.
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Changes default highlight color to red
defaults write NSGlobalDomain AppleHighlightColor -string "1.000000 0.733333 0.721569"

# Makes password required immediately after entering sleep mode
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0


###############################################################################
# Terminal Settings                                                           #
###############################################################################

# Enables Secure Keyboard Entry
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Only use UTF-8 in Terminal
defaults write com.apple.terminal StringEncodings -array 4

# Enables "locate" command
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist &> /dev/null


###############################################################################
# TextEdit Settings                                                           #
###############################################################################

#Sets TextEdit to default to plaintext
defaults write com.apple.TextEdit RichText -int 0

# Disables autocorrect
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false


###############################################################################
# Time Machine Settings                                                       #
###############################################################################

# Prevents Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disables local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal


###############################################################################
# Users & Groups                                                              #
###############################################################################

# Display login window as: Name and password
sudo defaults write /Library/Preferences/com.apple.loginwindow "SHOWFULLNAME" -bool true

# Disable automatic login
sudo defaults delete /Library/Preferences/com.apple.loginwindow autoLoginUser 2>/dev/null

# Forbids guest access to this computer
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Disable guest access to shared folders
sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool false
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool false

# Disable password hints
defaults write NSGlobalDomain RetriesUntilHint -int 0

# Show sleep, restart, and shut down buttons in login window
sudo defaults write /Library/Preferences/com.apple.loginwindow PowerOffDisabled -bool true

# Disable input menu in login window
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool false

# Disable console login
sudo defaults write /Library/Preferences/com.apple.loginwindow DisableConsoleAccess -bool true

# Disable external accounts
sudo defaults write /Library/Preferences/com.apple.loginwindow EnableExternalAccounts -bool false

# Hide non-local users on login window user list
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWOTHERUSERS_MANAGED -bool false

# Hide mobile users on login window
sudo defaults write /Library/Preferences/com.apple.loginwindow HideMobileAccounts -bool true

# Hide network users on login window
sudo defaults write /Library/Preferences/com.apple.loginwindow IncludeNetworkUser -bool false

# Disable fast user switching
sudo defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool false


###############################################################################
# Cleanup                                                                     #
###############################################################################

for app in "Activity Monitor" "App Store" "cfprefsd" "Dock" "Finder" \
"Messages" "Photos" "Safari" "SystemUIServer" "TextEdit"; do
killall "${app}" &> /dev/null
done
