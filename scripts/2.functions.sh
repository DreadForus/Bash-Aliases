#!/usr/bin/env bash

alias c='clear'

alias g='git'

alias reloadBash="exec $SHELL -l"

# Detect which `ls` flavor is in use
export LS_OPTIONS='--color=auto'
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # macOS `ls`
	colorflag="-G"
fi

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
alias l.='ls -d .*'
alias ll='ls -lha'
# List only directories
alias lsd="ls -lF | grep --color=never '^d'"

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#sudo
alias root='sudo -i'
alias su='sudo -i'

# get rc
get_rc_path(){
    if [ -f "~/.bashrc" ]; then
        echo ".bashrc"
    else
        echo ".bash_rc"
    fi
}

# bash
alias bashsrc="source ~/$(get_rc_path)"
alias bashedit="nano ~/$(get_rc_path) && source ~/$(get_rc_path)"
bashinst(){
    if ! grep -q "$1" ~/$(get_rc_path); then
        echo "\n# $2 \n$1" >> ~/$(get_rc_path)
    fi;
}

# ps
alias ps2='ps -ef | grep -v $$ | grep -i '
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias psme='ps -ef | grep $USER --color=always '

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# other

alias hg='history|grep '
alias diff='colordiff'

alias composer='php /usr/local/bin/composer'

command_exists () { type "$1" &> /dev/null ; }