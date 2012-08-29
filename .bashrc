#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$HOME/bin:$PATH
export EDITOR='emacs'
export HISTCONTROL='ignoredups'

psgrep() { ps ax | grep -v grep | grep $1; }
cmdfu() { wget -qO - "http://www.commandlinefu.com/commands/matching/$@/$(echo -n "$@" | openssl base64)/plaintext"; }

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias whatsmyip='curl ifconfig.me'
alias e='emacsclient -c'

PS1='\u@\h:\W \$ '

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
