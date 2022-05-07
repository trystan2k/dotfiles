#!/usr/bin/env bash

# Specific setups for MacOS system

# dotfiles folder
DOTFILES_FOLDER="$(pwd | grep -o '.*dotfiles')"

# Load helper functions
#shellcheck source=/dev/null
source "$DOTFILES_FOLDER"/lib/functions

execute() {

    ## Ask for sudo pass
    user "Please enter root password to start setup MacOS defaults"
    sudo -v

    info "Close any open System Preferences panes"
    # Close any open System Preferences panes, to prevent them from overriding settings we’re about to change
    osascript -e 'tell application "System Preferences" to quit'

    ## General

    # Allow moving window by dragging at any place
    info "General - Allow moving window by dragging at any place"
    defaults write -g NSWindowShouldDragOnGesture -bool true   

    # Set dark interface style"
    info "General - Set Dark interface style"
    defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

    ## Desktop & Screensaver

    ### Disable Screensaver 
    info "Desktop & Screensaver - Disable Screensaver"
    defaults write com.apple.screensaver idleTime 0

    ## Dock

    # Remove all icons from the dock
    info "Dock - Remove all default Dock items and add most used ones"
    defaults write com.apple.dock persistent-apps -array
    defaults write com.apple.dock persistent-others -array

    # add my preferred icons to the dock
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Hyper.app/</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Visual%20Studio%20Code.app</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Microsoft%20Edge.app</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Firefox.app</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications//Google%20Chrome.app</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications//Notion.app</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'

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
    info "Dock - Enable Dock magnification and set its size"
    defaults write com.apple.dock magnification -bool true
    defaults write com.apple.dock largesize -integer 75

    # Automatically hide and show the Dock
    info "Dock - Automatically hide and show the Dock"
    defaults write com.apple.dock autohide -bool true

    # Do not show recents apps in Dock
    info "Dock - Do not show recents apps in Dock"
    defaults write com.apple.dock "show-recents" -bool false

    ## Spotlight

    # Change Spotlight shortcut to Alt + Space
    info "Spotlight - Change Spotlight shortcut to Alt + Space"
    defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 '<dict>
        <key>enabled</key><true/>
        <key>value</key>
        <dict>
            <key>type</key><string>standard</string>
            <key>parameters</key>
            <array>
                <integer>32</integer>
                <integer>49</integer>
                <integer>524288</integer>
            </array>
        </dict>
    </dict>'

    ## Language & Region

    # Change system languages
    info "Language & Region - Change system languages"
    defaults write -g AppleLanguages '(en-US, es-ES, pt-BR)'

    ## Notifications

    # Enable Do Not Disturb and set to 23:00 to 06:00
    info "Notifications - Enable Do Not Disturb and set to 23:00 to 06:00"
    defaults -currentHost write com.apple.notificationcenterui dndEnabledDisplayLock -bool true
    defaults -currentHost write com.apple.notificationcenterui dndStart -integer 1380
    defaults -currentHost write com.apple.notificationcenterui dndEnd -integer 360    

    ## Users & Groups

    # Configure menu bar icons, including fast user switch, battery %, time/date, bluetooth
    info "Users & Groups - Configure menu bar icons, including fast user switch, battery percentege, time/date, bluetooth"
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
    defaults write com.apple.menuextra.battery ShowPercent -bool true

    ## Security & Privacy

    # Set Lock Message to show on login screen
    info "Security & Privacy - Set Lock Message to show on login screen"
    sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText -string "Found me? Shoot a mail to trystan2k@gmail.com to return me. Thanks."

    ## Keyboard

    # Enable App Expose Gesture
    info "Keyboard - Enable App Expose Gesture"
    defaults write com.apple.dock showAppExposeGestureEnabled -bool true

    ## Energy Saver

    # Set energy save settings
    info "Energy Saver - Set energy save settings"
    # Battery
    sudo pmset -b displaysleep 15
    sudo pmset -b sleep 20
    sudo pmset -b disksleep 10

    # Power supply
    sudo pmset -c displaysleep 60
    sudo pmset -c sleep 65
    sudo pmset -c disksleep 10

    ## Date & Time

    # Show day of week, date and 24-hour time
    info "Date & Time - Show day of week, date and 24-hour time"
    defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm"
    defaults write com.apple.menuextra.clock FlashDateSeparators -bool true

    ## Sharing

    # Computer name
    info "Sharing - Computer name"
    if ask_question '"Would you like to set your computer name (as done via System Preferences >> Sharing)?'; then
        user "What would you like it to be?"
        read -r COMPUTER_NAME
        sudo scutil --set ComputerName "$COMPUTER_NAME"
        sudo scutil --set HostName "$COMPUTER_NAME"
        sudo scutil --set LocalHostName "$COMPUTER_NAME"
        sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"
    fi

    ## Time machine

    # Prevent Time Machine from prompting to use new hard drives as backup volume
    info "Time machine - Prevent Time Machine from prompting to use new hard drives as backup volume"
    defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

    ## Finder

    # Always open everything in Finder's list view
    info "Finder - Always open everything in Finder's list view"
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

    # Show status bar
    info "Finder - Show status bar"
    defaults write com.apple.finder ShowStatusBar -bool true

    # Show path bar
    info "Finder - Show path bar"
    defaults write com.apple.finder ShowPathbar -bool true

    # Set User home/Downloads as the default location for new Finder windows
    info "Finder - Set User home/Downloads as the default location for new Finder windows"
    defaults write com.apple.finder NewWindowTarget -string "PfLo"
    defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads"

    ## Others

    # Set default screenshot location to a specific folder
    info "Others - Set default screenshot location to a specific folder"
    mkdir -p "$SCREENSHOT_FOLDER"
    defaults write com.apple.screencapture location "$SCREENSHOT_FOLDER"

    # Avoid the creation of .DS_Store files on USB and network volumes
    info "Others - Avoid the creation of .DS_Store files on USB and network volumes"
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

    # Don’t automatically rearrange Spaces based on most recent use
    defaults write com.apple.dock mru-spaces -bool false
}

execute