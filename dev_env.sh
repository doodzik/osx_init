#!/usr/bin/env bash

set -x

# install homebrew
command -v brew >/dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap doodzik/tap https://github.com/doodzik/tap
brew tap homebrew/dupes # for screen

cmds=(
  caskroom/cask/brew-cask
  vim
  zsh
  git
  nvm
  selecta
  screen
  ghi
  wifi-password
  tidy-html5
  npm-scripts
  rmapp
  find_with_gitignore
)

# dep for ghi
gem install pygments.rb

brew install ${cmds[@]}

brew cask install vagrant
brew cask install virtualbox

vagrant plugin install vagrant-vbguest

# setup node
mkdir ~/.nvm
. $(brew --prefix nvm)/nvm.sh
nvm install 5
nvm use 5
nvm alias default 5

# no blurry font
defaults write com.apple.Terminal AppleFontSmoothing -int 0

# setup repo for dotfiles
git init
git remote add origin https://github.com/doodzik/dotfiles.git
git fetch
git checkout -t origin/master
git submodule update --init --recursive

# Create a new Zsh configuration by copying the Zsh configuration files provided:
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# set brew zsh as default shell
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

# ==============================================
# Xcode
# ==============================================
echo "Setting Xcode preferences"

# Always use spaces for indenting
defaults write com.apple.dt.Xcode DVTTextIndentUsingTabs -bool false

# Show tab bar
defaults write com.apple.dt.Xcode AlwaysShowTabBar -bool true

/usr/local/bin/zsh
