echo "installing gui..."

brew install youtube-dl

guis=(
  vlc
  skype
  flux
  appcleaner
  iterm2
)

brew cask install ${guis[@]}

echo 'setup icloud && opening apps'
echo 'Press [Enter] if done'
sleep 2
open -a System\ Preferences
osascript -e 'tell application "Safari"
                open location "https://www.ublock.org"
                open location "http://web.whatsapp.com"
              end tell'
open -a Flux
open -a Skype
read -p ''

# disable desktop
defaults write com.apple.finder CreateDesktop -bool FALSE
# change screenshot folder
defaults write com.apple.screencapture location ~/Downloads
# symlink iCloud Folder to ~/
ln -s Library/Mobile\ Documents/com~apple~CloudDocs
mv com\~apple\~CloudDocs iCloud

# restart
killall SystemUIServer
killall Finder
