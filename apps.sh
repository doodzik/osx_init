#!/usr/bin/env bash

set -x

echo "installing gui..."

brew install youtube-dl

guis=(
  vlc
  skype
  flux
  anki
  iterm2
)

brew cask install ${guis[@]}

echo 'setup icloud && opening apps'
echo 'Press [Enter] if done'
sleep 2
open -a System\ Preferences

osascript -e 'tell application "Safari" to activate
                open location "https://www.ublock.org"
                open location "http://web.whatsapp.com"
                open location "https://github.com/guyht/vimari/releases/latest"
                open location "http://www.bumblebeesystems.com/wastenotime/"

                delay 1
                tell application "System Events" to tell process "Safari"
                  keystroke "," using command down

                  tell group 1 of group 1 of window 1
                      tell pop up button 6
                        click
                        click menu item "After two weeks" of menu 1
                      end tell
                  end tell
              end tell'
open -a Flux
open -a Anki
open -a Skype
read -p ''

# enable safari dev mode
defaults write com.apple.Safari WebKitDeveloperExtras -bool true

echo "set ublock eu cookie warning"
echo "import waste no time config"
echo "press [enter] to continue"
read -p ''
