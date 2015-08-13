# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir and set PS1
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
    PS1="\[\e[00;32m\]\u@\h\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[00;36m\][\W]:\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
    ;;
*)
    ;;
esac

#New bash separator
if [ -f "$HOME/.bash_ps1" ]; then
. "$HOME/.bash_ps1"
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

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
alias scpresume="rsync --partial --progress --rsh=ssh"
#alias mvim="mvim --remote-tab-silent"
#alias ipython="ipython-2.6"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias open='xdg-open'
elif [[ "$OSTYPE" == "darwin*" ]]; then
    # ...
    :
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#PATH=$PATH:$HOME/synergy/bin/
#PATH=$PATH:/Users/barbosarr/workspace/argus-clients-latest/bin:/Users/barbosarr/workspace/argus-latest/bin
#PATH=$PATH:/Users/barbosarr/local/bin:/Applications/sshfs/bin:/Users/barbosarr/bin
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	PATH=$PATH:/home/rafael/local/bin:/home/rafael/local/sbin
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export SVN_EDITOR=$EDITOR
export PYTHONPATH=~/workspace
export WORKON_HOME=~/envs

#ctrl+s to forward-search-history - makes letter u stop working 
#stty stop udef

#ssh autocomple
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh

#colors tmux
alias tmux='TERM=xterm-256color tmux'
