## mpursley's .zshrc -- zsh port of ~/.bashrc
## https://github.com/mpursley/mpursley-dotfiles

## ---------------------------------------------------------------- prompt ---
setopt PROMPT_SUBST

_p_title=$'\e]0;%n@%m:%~\a'   # set the terminal window title
_p_green=$'\e[01;32m'
_p_blue=$'\e[01;34m'
_p_cyan=$'\e[1;36m'
_p_red=$'\e[0;31m'
_p_off=$'\e[m'
_p_reset=$'\e[00m'

## user@host (green) + cwd (blue)
PROMPT="%{${_p_title}%}%{${_p_green}%}%n@%m%{${_p_blue}%} %~ "
## Add git branch to the prompt
PROMPT="${PROMPT}%{${_p_cyan}%}(\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))%{${_p_off}%} "
## Add kubectx to the prompt
PROMPT="${PROMPT}%{${_p_red}%}(\$(kubectx -c 2>/dev/null))%{${_p_off}%} "
## Add a newline, $ and set the color back to normal
PROMPT="${PROMPT}"$'\n'"\$%{${_p_reset}%} "
export PROMPT

unset _p_title _p_green _p_blue _p_cyan _p_red _p_off _p_reset

## --------------------------------------------------------------- envvars ---
typeset -U path PATH                     # keep PATH entries unique
export EDITOR=/usr/bin/vim
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/bin:$HOME/go/bin"

## --------------------------------------------------------------- history ---
## Share history across shells...
export HISTFILE=~/.zsh_history
export HISTSIZE=100000                   # big big history
export SAVEHIST=100000                   # big big history
setopt APPEND_HISTORY                    # append to history, don't overwrite it
setopt INC_APPEND_HISTORY                # write each command as it finishes
setopt SHARE_HISTORY                     # read new history from other shells
setopt HIST_IGNORE_DUPS                  # no duplicate entries
setopt HIST_IGNORE_ALL_DUPS              # drop older duplicates of a command
setopt HIST_EXPIRE_DUPS_FIRST            # trim duplicates first when full
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY                       # confirm history expansions

## --------------------------------------------------------------- aliases ---
alias ll="ls -la"
alias llt="ls -latr"
alias lt="ls -latr"
alias gp="git pull --rebase upstream master"

## ---------------------------------------------------------- completion -----
autoload -Uz compinit && compinit

## If there is a .zshrc file for this host, source it.
[ -f ~/.zshrc_$(hostname) ] && source ~/.zshrc_$(hostname)
