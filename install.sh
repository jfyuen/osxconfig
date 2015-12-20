#!/bin/bash

set -e

CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
BREW_DIR=/opt/homebrew

echo "Enabling MacOS preferences"
source ${CURRENT_DIR}/macosx_setup.sh

echo "Installing command line tools"
xcode-select --install

echo "Installing homebrew in ${BREW_DIR}"
sudo mkdir -p ${BREW_DIR}
sudo chown $(whoami):admin ${BREW_DIR}
curl -L http://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C ${BREW_DIR}
PATH=${BREW_DIR}:$PATH

echo "Installing brew packages"
while read line
do
    brew install ${line}
done < brew.txt

echo "Linking to homebrew apps in ~/Applications"
mkdir -p ~/Applications
brew linkapps --local

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
done < python3.txt

echo "Installing ruby packages"
while read line
do
    gem install ${line}
done < ruby.txt

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

echo "Setting up bashrc"
ln -s ${CURRENT_DIR}/bashrc ~/.bashrc

echo "Base system finished installing"
echo "Now install the following from the Appstore: XCode, Microsoft Remote Desktop"
open /Applications/App\ Store.app

