[[ -s ~/.bashrc ]] && source ~/.bashrc

alias zcat="gunzip -c"

# enable iterm2 itegration and set status variables
# if [ -s ~/.iterm2_shell_integration.bash ]; then
# 	function iterm2_print_user_vars() {
# 		iterm2_set_user_var aws_profile "$AWS_PROFILE"
# 		iterm2_set_user_var kube_context "$(kubectl config current-context)"
# 		iterm2_set_user_var kube_ns "$(kubens --current)"
# 	}
# 	source ~/.iterm2_shell_integration.bash
# fi
export PATH=$PATH:/usr/local/bin

# Multiple Homebrews on Apple Silicon
if [ "$(arch)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # export LDFLAGS="-L/opt/homebrew/opt/python@3.8/lib" # For compilers to find python@3.8
else
    eval "$(/usr/local/bin/brew shellenv)"
	export PYENV_ROOT="$HOME/.pyenv-x86"
    # export LDFLAGS="-L/usr/local/opt/python@3.7/lib" # For compilers to find python@3.7
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if command -v pyenv &> /dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

if command -v pipx 1>/dev/null 2>&1; then
	export PATH=$HOME/.local/bin/:$PATH
fi

