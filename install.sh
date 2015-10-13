#!/bin/bash

set -e

CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "Enabling MacOS preferences"
source ${CURRENT_DIR}/macosx_setup.sh

echo "Installing command line tools"
xcode-select --install

echo "Installing homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brew packages"
while read line
do
    brew install ${line}
done < brew.txt

echo "Install cask packages"
while read line
do
    brew cask install ${line}
done < brew_cask.txt

echo "Upgrading pip"
pip3 install --upgrade pip

echo "Installing python3 packages"
while read line
do
    pip3 install ${line}
done < brew_cask.txt

echo "Base system finished installing"
echo "Now install the following from the Appstore: XCode, Microsoft Remote Desktop"
open /Applications/App\ Store.app

echo "Set up clamav and update"
echo "DatabaseMirror database.clamav.net" > /usr/local/etc/clamav/freshclam.conf
freshclam -v

echo "TODO: install vim"
