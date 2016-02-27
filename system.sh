# monitor changes to the settings
# sudo opensnoop -n cfprefsd-int-int

# ==============================================
# system
# ==============================================
# disable gateskeeper
sudo spctl --master-disable

#multitouch/trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2;
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1;
defaults write -g com.apple.trackpad.scaling 3

#keyboard
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 0; "KeyboardLayout Name" = "U.S"; }'
defaults write InitialKeyRepeat -int 15
defaults write KeyRepeat -int 2
# capslock to cntr
# ~/Library/Preferences/ByHost/.GlobalPreferences
mappingplist=com.apple.keyboard.modifiermapping.1452-585-0
defaults -currentHost write -g $mappingplist '({
    HIDKeyboardModifierMappingDst = 2;
    HIDKeyboardModifierMappingSrc = 0;
  })'

#notification settings
defaults write com.apple.notificationcenterui dndEnd   -int 420
defaults write com.apple.notificationcenterui dndStart -int 1320

#menu bar
defaults read com.apple.menuextra.battery ShowPercent -bool YES

#users
defaults write com.apple.loginwindow GuestEnabled -bool NO
defaults write com.apple.loginwindow SHOWFULLNAME -int 1

#dock
defaults write com.apple.dock autohide  -int 1
defaults write com.apple.dock mineffect -string 'scale'
defaults write com.apple.dock persistent-apps '()'

# Don't offer new disks for backup
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# disable desktop
defaults write com.apple.finder CreateDesktop -bool FALSE
# change screenshot folder
defaults write com.apple.screencapture location ~/Downloads
# symlink iCloud Folder to ~/
ln -s Library/Mobile\ Documents/com~apple~CloudDocs
mv com\~apple\~CloudDocs iCloud

