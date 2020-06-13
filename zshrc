# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Powerlevel9K
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir newline vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time dir_writable)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
# POWERLEVEL9K_STATUS_VERBOSE=false

autoload -U promptinit &&
promptinit

# support colors in less
# Colored manpages
export LESS_TERMCAP_mb=$'\E[01;34m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;32m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;34m'
export LESSHISTFILE=/dev/null

## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
HISTFILESIZE=10000
HISTDUP=erase

# zsh options
setopt promptsubst
setopt append_history
setopt hist_expire_dups_first
# ignore duplication command history list
setopt hist_ignore_space
setopt HIST_IGNORE_SPACE
setopt hist_ignore_dups
setopt hist_verify
setopt inc_append_history
# share command history data
setopt share_history
setopt extended_glob
setopt HASH_ALL

# ALIASES
alias mv='mv -iv'
alias cp='cp -iv'
alias mkdir='mkdir -pv'
alias dl='cd ~/Downloads/'
alias dox='cd ~/Documents/'
alias proj='cd ~/Developer/'
alias c='clear'
alias q='exit'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias g='/usr/local/bin/git'
alias zshdir='cd /Users/soxfm/.zprezto'
alias brewit="brew update -v ; brew upgrade -v ; brew cleanup ; brew dr"

## FUNCTIONS
# remove appledoubles
rmds() {
	find . -type f -name '*.DS_Store' -ls -delete 2>/dev/null
}

# Create Directory and cd inside
mkd() {
	mkdir -pv "$@" && cd "$@" ;
}

# Get url from formula and copy it to clipboard
brewurl() {
	brew info "$@" | grep -e '^https' | pbcopy ;
}

# Run `dig` and display the most useful info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer;
}

# zstyle
zstyle ':completion:*' list-prompt '%S%M matches%s' #from prezto

# Automatically update PATH entries
zstyle ':completion:*' rehash true

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

# automatically remove duplicates from these arrays
# typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH
typeset -U PATH

# Ignore completion functions for commands not in the system
zstyle ':completion:*:functions' ignored-patterns '_*'

# define autoloads
autoload -Uz compinit
autoload -U prompinit && promptinit
autoload -U colors && colors

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# HOMEBREW
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_CASK_OPTS=--require-sha
