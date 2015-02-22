#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR='emacsclient -c -a ""'
export HISTCONTROL='ignoreboth'
export GOPATH=$HOME/.local
export MONO_GAC_PATH=/usr/local

psgrep() { ps ax | grep -v grep | grep $1; }

export PATH=$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cuts='cut -d " "'
alias cal='cal -3'
alias whereami='curl ifconfig.me'
alias e=$EDITOR

PS1='\u@\h:\W \$ '

if [ -f /usr/local/share/chruby/chruby.sh ]; then
    source /usr/local/share/chruby/chruby.sh
    chruby ruby-2.1.2
fi
