#!/usr/bin/env bash

# install homebrew
command -v brew >/dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap doodzik/tap https://github.com/doodzik/tap

cmds=(
  caskroom/cask/brew-cask
  vim
  git
  nvm
  selecta
  npm-scripts
  rmapp
)

brew install ${cmds[@]}

brew cask install vagrant
brew cask install virtualbox

# setup node
mkdir ~/.nvm
. $(brew --prefix nvm)/nvm.sh
nvm install 5
nvm use 5
nvm alias default 5

# no blurry font
defaults write com.apple.Terminal AppleFontSmoothing -int 0

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

rm .zshrc

# setup repo for dotfiles
git init
git remote add origin https://github.com/doodzik/dotfiles.git
git fetch
git checkout -t origin/master
git submodule update --init --recursive

zsh
