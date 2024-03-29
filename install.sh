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
echo "Now install the following from the Appstore: Slack, Adguard for Safari (from Safari Extensions)"

