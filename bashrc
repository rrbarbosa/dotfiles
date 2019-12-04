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

# if fails, try: xcode-select --install
if [ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh ]; then
	. /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
fi
if [ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ]; then
	. /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
fi


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
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	PATH=$PATH:/home/rafael/local/bin:/home/rafael/local/sbin
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export EDITOR=vim
export SVN_EDITOR=$EDITOR

#colors tmux
alias tmux='TERM=xterm-256color tmux'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Alias aadlogin
if command -v docker &> /dev/null; then
	export AWS_DEFAULT_REGION=eu-west-1
	export AWS_REGION=eu-west-1
	alias aadlogin='docker run -ti -v ~/.aws:/root/.aws dtjohnson/aws-azure-login'
fi
if which pyenv-virtualenv-init > /dev/null; then
	eval "$(pyenv virtualenv-init -)";
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash

# Export DBT_PASSWORD to redshift db
alias pwd_redshift="op get item cw6djckxcneu5kjo7b4kdpkgvm | jq -r '.details.fields[] | select(.designation==\"password\") | .value'"

export PIP_REQUIRE_VIRTUALENV=true

# local toolbox
alias ltb='/Users/rafael/go/src/gitlab.com/new10/toolchain/toolbox/bin/toolbox-darwin-amd64'

# show aws profile in status bar
PROMPT_COMMAND+='iterm2_set_user_var aws_profile "$AWS_PROFILE";'
