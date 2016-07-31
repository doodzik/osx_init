#!/usr/bin/env bash

set -x

sudo -s

if [ $? -ne 0 ]; then
    echo "please run the script again with a correct password"
    exit 1
fi


# ==============================================
# homebrew
# ==============================================

command -v brew >/dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap doodzik/tap https://github.com/doodzik/tap
brew tap homebrew/dupes # for screen
brew tap caskroom/cask

cmds=(
  vim
  zsh
  git
  nvm
  selecta
  screen
  ghi
  m-cli
  tidy-html5
  npm-scripts
  rmapp
  find_with_gitignore
  bash_join
)

# dep for ghi
gem install pygments.rb

brew install ${cmds[@]}

brew cask install vagrant
brew cask install virtualbox

vagrant plugin install vagrant-vbguest

# ==============================================
# nvm
# ==============================================

# setup node
mkdir ~/.nvm
. $(brew --prefix nvm)/nvm.sh
nvm install 5
nvm use 5
nvm alias default 5

# ==============================================
# github
# ==============================================

git config --global user.name "Frederik Dudzik"
git config --global user.email frederik@dudzik.co
git config --global push.default simple
git config --global core.editor vim
git config --global credential.helper osxkeychain
git config --global core.excludesfile ~/.gitignore_osx
ssh-keygen -t rsa -b 4096 -C "frederik@dudzik.co"
eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub

# echo in red
tput setaf 1
echo 'copied key to clipboard. opening github settings.'
# stop echoing in red
tput sgr0

echo 'Press [Enter] key when added key to github'
sleep 2
open https://github.com/settings/ssh
read -p ''
echo "ghi"
ghi config --auth doodzik

# setup repo for dotfiles
git init
git remote add origin https://github.com/doodzik/dotfiles.git
git fetch
git checkout -t origin/master
git submodule update --init --recursive --remote

cd .zprezto
git submodule update --init --recursive --remote

cd ~

# ==============================================
# zsh
# ==============================================

touch ~/.zshrc
/usr/local/bin/zsh
rm ~/.zshrc

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

