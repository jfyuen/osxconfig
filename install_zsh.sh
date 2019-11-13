#!/bin/bash

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/dev/oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/dev/oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/dev/fzf && ~/dev/fzf/install
