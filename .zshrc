#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
autoload -U colors && colors

autoload -U promptinit && promptinit

autoload -U compinit && compinit

setopt promptsubst
setopt inc_append_history
setopt hist_ignore_dups

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESSHISTFILE=/dev/null

## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# zsh options
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
# ignore duplication command history list
setopt hist_ignore_dups 
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
# share command history data
setopt share_history 

# ALIASES
alias dl="cd $HOME/Downloads ; ls -lGaF"
alias proj="cd $HOME/Developer/Projects/macCode ; pwd"
alias c='clear'
alias q='exit'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'

# FUNCTIONS
rmds() {
	find . -type f -name '*.DS_Store' -ls -delete 2>/dev/null
};

## FUNCTIONS

# Create Directory and cd inside
mkd() {
	mkdir -pv "$@" && cd "$@" ;
};

# Show Path
path(){
	echo -e ${PATH//:/\\n}
};

# Automatically update PATH entries
zstyle ':completion:*' rehash true

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

# automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH
