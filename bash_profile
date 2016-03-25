if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
	    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

alias zcat="gunzip -c"

export PATH=$PATH:/Users/rafael/local/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=/Users/rafael/local/bin/
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

[[ -s ~/.bashrc ]] && source ~/.bashrc

