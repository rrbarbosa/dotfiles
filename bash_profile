if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
	    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

export PATH=$PATH:/Users/rafael/local/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=/Users/rafael/local/bin/
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export WORKON_HOME=~/.venvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.6
source /usr/local/bin/virtualenvwrapper_lazy.sh

# 3dhubs CLI
#export VIRTUALENV_PYTHON=/usr/local/bin/python2.7

[[ -s ~/.bashrc ]] && source ~/.bashrc


export PATH=~/.local/bin:$PATH
eval "$(_3DHUBS_COMPLETE=source 3dhubs)"
export PATH=~/.local/bin:$PATH
eval "$(_3DHUBS_COMPLETE=source 3dhubs)"

alias zcat="gunzip -c"
