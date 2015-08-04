#!/bin/bash

set -e

echo "Installing command line tools"
xcode-select --install

echo "Installing homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brew packages"
brew install caskroom/cask/brew-cask ansible htop-osx wine python3 python go

echo "Install cask packages"
brew cask install appcleaner firefox google-chrome keepassx libreoffice macvin pycharm-ce dwarf-fortress vlc wireshark tunnelblick transmission skype yubikey-personalization-gui xquartz virtualbox cyberduck

echo "Upgrading pip"
pip3 install --upgrade pip

echo "Installing python3 packages"
pip3 install pelican MarkDown Pygments youtube-dl you-get pandas cython

echo "Base system finished installing"
echo "Now install the following from the Appstore: XCode, Microsoft Remote Desktop"
open /Applications/App\ Store.app
