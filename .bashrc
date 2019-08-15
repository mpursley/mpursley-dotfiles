## mpursley's .bashrc file https://github.com/mpursley/mpursley-dotfiles/blob/master/.bashrc

source ~/.ssh/environment

## update the shell prompt
export PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$\[\033[00m\] "

## import my ssh keys into the ssh agent
eval `~/bin/ssr`

## add some envvars
export EDITOR=/usr/bin/vim
export PATH=$PATH:~/bin:~/go/bin
export GOPATH=/home/mpursley/go

## Share history across shells...
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
 # Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
#export all_proxy="socks5://localhost:1080"

alias ll="ls -la"
alias llt="ls -latr"
alias lt="ls -latr"
alias gp="git pull --rebase upstream master"


#keychain ~/.ssh/id_rsa ~/.ssh/id_crt > /dev/null 2>&1

## TMUX
#if which tmux 2>&1 >/dev/null; then
    # if no session is started, start a new session
#    test -z ${TMUX} && tmux -2

    # when quitting tmux, try to attach
#    while test -z ${TMUX}; do
#        tmux attach || break
#    done
#fi
ALL_PROXY=socks5://localhost:1080

# this is to fix some clipboard issues..
#printf "\e[?2004l" > /dev/null

# If there is a .bashrc file for this host, source it.
[ -f ~/.bashrc_$(hostname) ] && source ~/.bashrc_$(hostname)

