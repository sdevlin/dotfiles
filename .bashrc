#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR='emacsclient -c -a ""'
export HISTCONTROL='ignoredups'
export GOPATH=$HOME/.local

psgrep() { ps ax | grep -v grep | grep $1; }

cmdfu() { wget -qO - "http://www.commandlinefu.com/commands/matching/$@/$(echo -n "$@" | openssl base64)/plaintext"; }

print_path() { echo $PATH | tr ':' '\n'; }

add_to_path() {
    if ! print_path | grep -x "$1" >/dev/null
    then
        export PATH=$1:$PATH
    fi
}

add_to_path "$HOME/.local/bin"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cuts='cut -d " "'
alias cal='cal -3'
alias whereami='curl ifconfig.me'
alias e=$EDITOR

fizzbuzz() {
    seq 100 | awk '
        $0 % 15 == 0 { print "fizzbuzz"; next }
        $0 % 3 == 0 { print "fizz"; next }
        $0 % 5 == 0 { print "buzz"; next }
        1';
}

PS1='\u@\h:\W \$ '
