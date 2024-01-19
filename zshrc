# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
if [[ $(arch) != arm64* ]]
then
	eval "$($HOME/.homebrew/bin/brew shellenv)"
	export PYENV_ROOT="$HOME/.pyenv-x86"
else
	eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH=/opt/homebrew/opt/go/libexec/bin:$PATH
	# default PYENV_ROOT => $HOME/.pyenv
fi
export PATH=$HOME/go/bin:$PATH

export EDITOR='vim'
alias flush_dns="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias arm='env /usr/bin/arch -arm64 /bin/zsh --login'
alias intel='env /usr/bin/arch -x86_64 /bin/zsh --login'

setopt IGNORE_EOF

# Remove duplicate history
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
setopt SHARE_HISTORY
unsetopt BEEP

set completion-ignore-case on

bindkey -e
bindkey "^[[3~" delete-char
export SHELL_ARCH=$(arch)
PS1="%d (${SHELL_ARCH}) %# "
autoload -U select-word-style
select-word-style bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
