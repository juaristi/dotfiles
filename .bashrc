# ~/.bashrc: executed by bash(1) for non-login shells.
# TO BE USED INTO MY DOCKER CONTAINERS

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\][ \h \w ]# \[\033[00m\]'
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
if [[ $TERM == 'xterm' ]]; then
	export LS_OPTIONS='--color=auto'
	eval "`dircolors`"
fi

alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias la='ls $LS_OPTIONS -A'
alias grep='grep --colour=auto'

#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
