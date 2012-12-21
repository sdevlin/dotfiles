#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$HOME/.local/bin:$PATH
export EDITOR='emacs'
export HISTCONTROL='ignoredups'
export GOPATH=$HOME/.local

psgrep() { ps ax | grep -v grep | grep $1; }
cmdfu() { wget -qO - "http://www.commandlinefu.com/commands/matching/$@/$(echo -n "$@" | openssl base64)/plaintext"; }
print_path() { echo $PATH | tr ':' '\n'; }

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cuts='cut -d " "'
alias cal='cal -3'
alias whatsmyip='curl ifconfig.me'
alias e='emacsclient -c'

fizzbuzz() {
    seq 100 | awk '
        $0 % 15 == 0 { print "fizzbuzz"; next }
        $0 % 3 == 0 { print "fizz"; next }
        $0 % 5 == 0 { print "buzz"; next }
        1';
}

infamy() {
    cal -3 7 12 1941
}

PS1='\u@\h:\W \$ '

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PERL_LOCAL_LIB_ROOT="/home/sean/perl5";
export PERL_MB_OPT="--install_base /home/sean/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/sean/perl5";
export PERL5LIB="/home/sean/perl5/lib/perl5/i686-linux-thread-multi:/home/sean/perl5/lib/perl5";
export PATH="/home/sean/perl5/bin:$PATH";
