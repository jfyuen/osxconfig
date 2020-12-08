# enable bash completion in interactive shell (not on Debian)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export EDITOR=vim
export PAGER=less
export BLOCKSIZE=K

umask 022
# Prompt
export PS1='\[\033[1;33m\]\u@\h \[\033[01;34m\]\W \$ \[\033[00m\]'

# PATH
export PATH=/opt/xhomebrew/bin:/opt/xhomebrew/sbin:$PATH
export GOPATH=~/go
export PATH=/opt/xhomebrew/opt/go/libexec/bin:$PATH
export PATH=$GOPATH/bin:$PATH

# Global settings
set -o notify
set -o ignoreeof
set -o nounset
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s histappend histreedit
# Make bash check its window size after a process completes
shopt -s checkwinsize

# Aliases
alias a='alias'
alias ls='ls -G'
alias l='ls -lG'
alias ll='ls -lG'
alias la='ls -laG'
alias lc='ls -CG'
alias j='jobs'
alias h='history'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias df="df -h"
alias du="du -h"
alias grep="grep --color"
alias ssh="LC_ALL=C ssh"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
