# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# If this is an xterm set the title to user@host:dir and set PS1
case "$TERM" in
xterm*|rxvt*|screen*)
	if [[ "$OSTYPE" == "darwin"* ]]; then
		PS1="\\$> \[$(tput sgr0)\]"
	else
		PROMPT_COMMAND+='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
		# only show hostname if remote
		if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
			host="@\h"
		fi
		# will break if the source git stuff above failed
		PS1='\[\e[00;32m\]\u${host}\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[00;36m\][\W$(__git_ps1 " (%s)")]:\[\e[0m\]\[\e[00;37m\] \[\e[0m\]'
	fi
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some aliases
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias open='xdg-open'
elif [[ "$OSTYPE" == "darwin*" ]]; then
    # ...
    :
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export EDITOR=vim
export SVN_EDITOR=$EDITOR

#colors tmux
alias tmux='TERM=xterm-256color tmux'

export PIP_REQUIRE_VIRTUALENV=true

# Created by `userpath` on 2020-03-25 14:04:59
export PATH="$PATH:/Users/rafael/.local/bin"
