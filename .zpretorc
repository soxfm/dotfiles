# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
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
autoload -U colors &&
colors

# autoload -U compinit && compinit

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
setopt hist_ignore_dups
setopt hist_verify
setopt inc_append_history
# share command history data
setopt share_history
setopt extended_glob

# ALIASES
alias dl='cd ~/Downloads/'
alias dox='cd ~/Documents/'
alias proj='cd ~/Developer/'
alias c='clear'
alias q='exit'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias g='/usr/local/bin/git'
alias prezdir='cd ~/Developer/GitHub/prezto'

# FUNCTIONS
rmds() {
	find . -type f -name '*.DS_Store' -ls -delete 2>/dev/null
};

# Create Directory and cd inside
mkd() {
	mkdir -pv "$@" && cd "$@" ;
};

# Show Path
path(){
	echo -e ${PATH//:/\\n}
};
# Brewitall
brewit(){
	brew update ; brew upgrade ; brew cask upgrade ; brew cleanup ; brew dr
};

# Del
findEmptyDirsAndFiles(){
  find . -type f -exec bash -c 'if [ `cat "{}" |wc -w` -eq 0 ]; then echo "file - {}";fi' \; -or -empty -exec bash -c "echo dir - {}" \;
};

# re <files> - Move files to trash.
re(){
  mv "$@" ~/.Trash
}

# Automatically update PATH entries
zstyle ':completion:*' rehash true

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

# automatically remove duplicates from these arrays
# typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH
typeset -U PATH

# Ignore completion functions for commands not in the system
zstyle ':completion:*:functions' ignored-patterns '_*'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || . ~/.p10k.zsh
