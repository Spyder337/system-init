export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom/plugins

# Include the antigen functions.
source $ZSH_CUSTOM/antigen.zsh

unsetopt beep

function ppy() {
	CMD_ERROR_MSG="Command Format: -v (opt): PYTHON_VER -g (opt): REMOTE_URL\nExample: test -v(?) 3.10.12 -g(?) <empty_git_remote>"
	MAIN_PY_TXT="def main():\n\tprint(\"Hello World!\")\n\nif __name__ == \"__main__\":\n\tmain()"
	PYTHON_VER="$(python3 --version)"
	PYTHON_VER="${PYTHON_VER#Python }"
	echo "Python Venv Version: $PYTHON_VER"
	README_TXT="# $1\n"
	REMOTE_URL=""
	PROJECT_NAME="${@[1]}"
	args_len="${#@}"
	

	if [[ -z $PROJECT_NAME ]]; then
		echo $CMD_ERROR_MSG
		return 1
	fi

	arg_index=2
	has_remote=false
	
	if [[ "${#@}" > 2 ]]; then
		while $arg_index < $args_len
		do
			arg="${@[$arg_index]}"
			if [[ $arg == "-v" ]]; then
				arg_val_i=$arg_index + 1
				if [[ $arg_val_i < $args_len ]]; then	
					arg_val = "${@[$arg_val_i]}"
					$PYTHON_VER=$arg_val
					arg_index=$arg_index + 1
				fi
			else
				echo $CMD_ERROR_MSG
				return 1
			fi
			if [[ $arg == "-g" ]]; then
				arg_val_i=$arg_index + 1
				if [[ $arg_val_i < $args_len ]]; then
					arg_val = "${@[$arg_val_i]}"
					has_remote=true
					REMOTE_URL=$arg_val
					arg_index=$arg_index + 1
				else
					echo $CMD_ERROR_MSG
					return 1
				fi
			fi
			arg_index=$arg_index + 1
		done
	fi

	mkdir -p $PROJECT_NAME
	cd $PROJECT_NAME
	echo $README_TXT > "README.md"
	echo $MAIN_PY_TXT > "main.py"
	pipenv --python $PYTHON_VER
	gi python > ".gitignore"
	git init -b main

	if [[ $has_remote ]]; then
		git remote add orgin $REMOTE_URL
		git add .
		git commit -m "Initialized directory."
	fi
	
	cd ..

	return 0
}

function aliases-init() {
	alias i="sudo apt install -y"
#   File System
	alias l="ls -A"
	alias lf="ls -A -f"
	alias ld="ls -A -d"
	alias lfr="ls -A -f -R -I '$IGNORE_FLAG_DIRS'"
	alias ta="tree -a -I '$IGNORE_FLAG_DIRS'"
	alias td="tree -a -d -I '$IGNORE_FLAG_DIRS'"
	alias rt="rm -f $~"
#   Grep
	alias hg="history | grep"
#   Configs
	alias shcfg="emacs ~/.zshrc"
	alias rld="omz reload"
#   Cargo
	alias cb="cargo clean;cargo build"
	alias cf="cargo clippy --fix"
	alias cr="cargo run"
#   Python
	alias py="python3"
	alias pv="pipenv run python"
#   ENVIRONMENT VARIABLES
	#	Python pip install dir.
	export PATH=$PATH:/home/devtoast/.local/bin
	#	Pipenv in project folder
	export PIPENV_VENV_IN_PROJECT=1
	# Default Editor
	export EDITOR="emacs"
}

function ssh-init() {
	if [[ -z "$SSH_AUTH_SOCK" ]]; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_git
    ssh -T git@github.com
	else
    ssh-add ~/.ssh/id_git
    ssh -T git@github.com
	fi
}

function antigen-init() {
	# Import default oh-my-zsh plugins and themes
	antigen use oh-my-zsh

	# Plugins
	antigen bundle git
	antigen bundle gitignore
	antigen bundle ssh
	antigen bundle python
	antigen bundle pip
	antigen bundle rust
	#	Alternative to cd
	antigen bundle agkozak/zsh-z
	#	ZSH Users
	antigen bundle zsh-users/zsh-syntax-highlighting
	antigen bundle zsh-users/zsh-autosuggestions
	antigen bundle zsh-users/zsh-completions

	# Theme
	antigen theme dst

	# Apply Changes
	antigen apply
}

function env-init() {
	ssh-init
	aliases-init
}

antigen-init
aliases-init
