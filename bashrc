# Author: Sarp Orgul - sarporgul@gmail.com
# File: ~/.bashrc
# To be executed every time you enter the bash terminal

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon

# best text editor ever made
export EDITOR=vim

# setup of aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

# for my laziness
alias c='clear'
alias tmux='tmux -2'
alias t='tmux -2'
alias pacman='sudo pacman'

alias e='exit'

alias grep='grep --color=auto'
alias hman='man -Hgoogle-chrome-stable'

# stuff to make the prompt pretty
# and so I can tell if I'm using ssh
PS1='\[\033[00;32m\]\u\[\033[00;33m\]@\[\033[00;32m\]\h\[\033[01;30m\]:\[\033[01;36m\]\w\[\033[01;37m\]$ \[\033[00m\]'
if [ -n "$SSH_CLIENT" ]
then
    PS1='\[\033[00;36m\]ssh:\u\[\033[00;33m\]@\[\033[00;36m\]\h\[\033[01;30m\]:\[\033[01;32m\]\w\[\033[01;37m\]$ \[\033[00m\]'
fi

if [ -f /etc/bash_completion ]; then
    ./etc/bash_completion
fi

#source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
