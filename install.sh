#!/bin/bash

set -e

CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
BREW_DIR=/opt/xhomebrew  # For x86 version

echo "Enabling MacOS preferences"
source ${CURRENT_DIR}/macosx_setup.sh

echo "Installing command line tools"
xcode-select --install

echo "Installing homebrew (x86) in ${BREW_DIR}"
sudo mkdir -p ${BREW_DIR}
sudo chown -R $(whoami):admin ${BREW_DIR}
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ${BREW_DIR}
PATH=${BREW_DIR}/bin:$PATH

echo "Updating homebrew"
brew update

echo "Install brew taps"
while read line
do
    brew tap ${line}
done < brew_tap.txt

echo "Install cask packages"
while read line
do
    brew cask install ${line}
done < brew_cask.txt

echo "Installing brew packages"
while read line
do
    brew install ${line}
done < brew.txt

echo "Upgrading pip"
pip3 install --upgrade pip

echo "Installing python3 packages"
while read line
do
    pip3 install ${line}
done < python3.txt

echo "Set up clamav and update"
echo "DatabaseMirror database.clamav.net" > ${BREW_DIR}/etc/clamav/freshclam.conf
freshclam -v

VIMDIR=${CURRENT_DIR}/../vimconfig
echo "Install vimconfig in ${VIMDIR}"
git clone https://github.com/jfyuen/vimconfig ${VIMDIR}
ln -s  ${VIMDIR}/vimrc ~/.vimrc
ln -s  ${VIMDIR}/vim ~/.vim
mkdir ~/.tmp
(cd  ${VIMDIR} && git submodule init && git submodule update)

echo "Setting up zsh"
bash install_zsh.sh
rm -f ~/.zshrc
ln -s ${CURRENT_DIR}/zshrc ~/.zshrc

echo "Base system finished installing"
echo "Now install the following from the Appstore: Slack, Ghostery Lite (from Safari Extensions)"
open /Applications/App\ Store.app

