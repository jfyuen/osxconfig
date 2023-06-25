#!/bin/bash

set -e

CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo "Enabling MacOS preferences"
source ${CURRENT_DIR}/macosx_setup.sh

echo "Installing command line tools"
xcode-select --install

echo "Installing homebrew (ARM)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
    brew install --cask ${line}
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

