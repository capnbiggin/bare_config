#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# source global shell alias & variable files
[ -f "$HOME/.config/shell/aliases.sh" ] && source "$HOME/.config/shell/aliases.sh"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
