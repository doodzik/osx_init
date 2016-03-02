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
osascript -e 'tell application "Safari"
                open location "https://www.ublock.org"
                open location "http://web.whatsapp.com"
                open location "https://github.com/guyht/vimari/releases/latest"
              end tell'
open -a Flux
open -a Anki
open -a Skype
read -p ''

# ==============================================
# Xcode
# ==============================================
echo "Setting Xcode preferences"

# Always use spaces for indenting
defaults write com.apple.dt.Xcode DVTTextIndentUsingTabs -bool false

# Show tab bar
defaults write com.apple.dt.Xcode AlwaysShowTabBar -bool true

# enable safari dev mode
defaults write com.apple.Safari WebKitDeveloperExtras -bool true 

bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/osx_init/master/system.sh)

# ==============================================
# restart
# ==============================================
killall SystemUIServer
killall Finder
