export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom/plugins

# Include the antigen functions.
source $ZSH_CUSTOM/antigen.zsh

# Import default oh-my-zsh plugins and themes
antigen use oh-my-zsh

# Plugins
#	Default plugins
antigen bundle git
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


# User configuration
#	Aliases
alias reload="source ~/.zshrc"
alias i="sudo apt install -y"
alias l="ls -a"
alias hg="history | grep"
alias tp="tree -a -I '.git|build|*_out|__pycache__'"
alias reload="source ~/.zshrc"
