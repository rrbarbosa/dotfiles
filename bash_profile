export PATH=$PATH:/Users/rafael/local/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin/


export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export WORKON_HOME=~/.venvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper_lazy.sh

[[ -s ~/.bashrc ]] && source ~/.bashrc

alias zcat="gunzip -c"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v pipx 1>/dev/null 2>&1; then
	export PATH=$HOME/.local/bin/:$PATH
fi

