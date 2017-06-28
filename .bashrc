#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ping8='ping -c 3 8.8.8.8'
alias lsa='ls -al'

alias gotoclass='source ~/shellscr/gotoclass.sh'
alias goclimb='source ~/shellscr/goclimb.sh'
alias gotobank='source ~/shellscr/gotobank.sh'
alias netstart='source ~/shellscr/netstart.sh'


# added by Anaconda3 4.4.0 installer
export PATH="/home/steve/anaconda3/bin:$PATH"
