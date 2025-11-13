#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# alias
alias l='ls'
alias ll='ls -la'
alias g++='g++ --std=c++23'

alias open='xdg-open'
alias cf='cd ~/Code/Competitive/CodeForces/'
alias lc='cd ~/Code/DSA/LeetCode/'

# default text editor
export VISUAL=nvim;
export EDITOR=nvim;
