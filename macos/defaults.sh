# Specific setups for MacOS system

## General

# Set dark interface style"
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

## Desktop & Screensaver

### Disable Screensaver 
defaults write com.apple.screensaver idleTime 0

## Dock

# Remove all icons from the dock
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-others -array

# add my preferred icons to the dock
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Hyper.app/</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Visual%20Studio%20Code.app</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Firefox.app</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications//Google%20Chrome.app</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Station.app</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Sublime%20Text.app</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'

defaults write com.apple.dock persistent-others -array-add '<dict>
	<key>tile-data</key>
	<dict>
		<key>arrangement</key><integer>1</integer>
		<key>displayas</key><integer>1</integer>
		<key>preferreditemsize</key><string>-1</string>
		<key>showas</key><integer>0</integer>
		<key>file-data</key>
		<dict>
			<key>_CFURLString</key><string>file:///Applications</string>
			<key>_CFURLStringType</key><integer>15</integer>
		</dict>
	</dict>
	<key>tile-type</key><string>directory-tile</string>
</dict>'


# Enable magnification and set its size
defaults write com.apple.dock magnification 1
defaults write com.apple.dock largesize 75

# Automatically hide and show the Dock
defaults write com.apple.dock autohide 1

# Do not show recents apps in Dock
defaults write com.apple.dock "show-recents" 1

## Spotlight

# Change Spotlight shortcut to Alt + Space
defaults write "com.apple.symbolichotkeys" "AppleSymbolicHotKeys" -dict-add 64 "{ enabled = 1; value = { parameters = (65535, 49, 524288); type = 'standard'; }; }"

## Language & Region

# Change system languages
defaults write /Library/Preferences/.GlobalPreferences AppleLanguages -array en-US es-ES pt-BR

## Notifications

# Enable Do Not Disturb and set to 23:00 to 06:00
defaults -currentHost write com.apple.notificationcenteru dndEnabledDisplayLock 1
defaults -currentHost write com.apple.notificationcenteru dndEnd 360
defaults -currentHost write com.apple.notificationcenteru dndStart 1380

## Users & Groups

# Enable fast user switch, using icon
defaults write com.apple.systemuiserver menuExtras -array-add '<string>/System/Library/CoreServices/Menu Extras/Clock.menu</string>'
defaults write com.apple.systemuiserver menuExtras -array-add '<string>/System/Library/CoreServices/Menu Extras/Battery.menu</string>'
defaults write com.apple.systemuiserver menuExtras -array-add '<string>/System/Library/CoreServices/Menu Extras/AirPort.menu</string>'
defaults write com.apple.systemuiserver menuExtras -array-add '<string>/System/Library/CoreServices/Menu Extras/User.menu</string>'
defaults write com.apple.systemuiserver menuExtras -array-add '<string>/System/Library/CoreServices/Menu Extras/Bluetooth.menu</string>'
defaults write com.apple.systemuiserver menuExtras -array-add '<string>/System/Library/CoreServices/Menu Extras/Volume.menu</string>'
defaults write com.apple.systemuiserver menuExtras -array-add '<string>/System/Library/CoreServices/Menu Extras/Displays.menu</string>'

defaults write com.apple.systemuiserver "NSStatusItem Preferred Position Item-0" 23
defaults write com.apple.systemuiserver "NSStatusItem Preferred Position Siri" 61
defaults write com.apple.systemuiserver "NSStatusItem Preferred Position com.apple.menuextra.airport" 401
defaults write com.apple.systemuiserver "NSStatusItem Preferred Position com.apple.menuextra.appleuser" "131.5"
defaults write com.apple.systemuiserver "NSStatusItem Preferred Position com.apple.menuextra.battery" "321.5"
defaults write com.apple.systemuiserver "NSStatusItem Preferred Position com.apple.menuextra.bluetooth" 463
defaults write com.apple.systemuiserver "NSStatusItem Preferred Position com.apple.menuextra.clock" 219
defaults write com.apple.systemuiserver "NSStatusItem Preferred Position com.apple.menuextra.volume" 371

defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.airplay" 1
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.airport" 1
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.appleuser" 1
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.battery" 1
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" 1
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.clock" 1
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" 1

sudo defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled 1

## Security & Privacy

# Require password as soon as sleep
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

## Keyboard

# Enable App Expose Gesture
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

## Energy Saver

# Set energy save settings
# Battery
sudo pmset -b displaysleep 15
sudo pmset -b sleep 15
sudo pmset -b disksleep 10

# Power supply
sudo pmset -c displaysleep 60
sudo pmset -c sleep 60
sudo pmset -c disksleep 10

## Sharing

# Computer name
echo "Would you like to set your computer name (as done via System Preferences >> Sharing)?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo "What would you like it to be?"
    read COMPUTER_NAME
    sudo scutil --set ComputerName $COMPUTER_NAME
    sudo scutil --set HostName $COMPUTER_NAME
    sudo scutil --set LocalHostName $COMPUTER_NAME
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME
fi

## Time machine

# Prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

## Others

# Set default screenshot location to a specific folder
mkdir -p $SCREENSHOT_FOLDER
defaults write com.apply.screencapture location $SCREENSHOT_FOLDER

# Avoid the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show battery percent"
defaults write com.apple.menuextra.battery ShowPercent -bool true

## Finder

# Always open everything in Finder's list view"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

# Set User home/Downloads as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads"
