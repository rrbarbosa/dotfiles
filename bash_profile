[[ -s ~/.bashrc ]] && source ~/.bashrc

alias zcat="gunzip -c"

# enable iterm2 itegration and set status variables
if [ -s ~/.iterm2_shell_integration.bash ]; then
	function iterm2_print_user_vars() {
		iterm2_set_user_var aws_profile "$AWS_PROFILE"
		iterm2_set_user_var kube_context "$(kubectl config current-context)"
		iterm2_set_user_var kube_ns "$(kubens --current)"
	}
	source ~/.iterm2_shell_integration.bash
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v pipx 1>/dev/null 2>&1; then
	export PATH=$HOME/.local/bin/:$PATH
fi

# Created by `userpath` on 2020-03-25 14:04:59
export PATH="$PATH:/Users/rafael/.local/bin"
