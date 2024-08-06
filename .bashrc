#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

figlet "Prabash"
alias btop='btop --utf-force'
alias l='ls'
alias ll='ls -l'
alias cdCode='cd ~/Code/'
alias cdCodeHRpy='cd ~/Code/HackerRank/Python/'
alias cdCodepy='cd ~/Code/Python/'

# default text editor
export VISUAL=nvim;
export EDITOR=nvim;

