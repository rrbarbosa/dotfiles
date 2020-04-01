[[ -s ~/.bashrc ]] && source ~/.bashrc

alias zcat="gunzip -c"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v pipx 1>/dev/null 2>&1; then
	export PATH=$HOME/.local/bin/:$PATH
fi

# Created by `userpath` on 2020-03-25 14:04:59
export PATH="$PATH:/Users/rafael/.local/bin"
