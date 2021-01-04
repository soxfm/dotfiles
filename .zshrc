# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# ALIASES
alias ls='lsd'
alias git='/usr/local/bin/git'
alias l='lsd --group-dirs first -1AF'
alias ll='lsd --group-dirs first -lhAF'
alias la='lsd --group-dirs first -AF'
alias tree='lsd -1A --tre --group-dirs first -I=.DS_Store'

alias mv='mv -iv'
alias cp='cp -iv'
alias mkdir='mkdir -pv'

alias dl='cd ~/Downloads/'
alias dox='cd ~/Documents/'
alias proj='cd ~/Developer/'
alias c='clear'
alias q='exit'
alias g='/usr/local/bin/git'
alias path='echo -e ${PATH//:/\\n}'
alias reload="exec ${SHELL} -l"
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias zshdir='cd /Users/soxfm/.zprezto'
alias brewit="brew update -v ; brew upgrade -v ; brew cleanup ; brew dr"
alias ytdla='youtube-dl --extract-audio --audio-format mp3 --output "~/Downloads/%(id)s.%(ext)s"'

# Homebrew
alias bws="brew search"
alias bwsd="brew search --desc"
alias bwl="brew list"
alias bwh="brew home"
alias bwuses="brew uses --installed"
alias bwinfo="brew info"
export HOMEBREW_NO_ANALYTICS=1
#export HOMEBREW_CASK_OPTS=--require-sha

# support colors in less
# improved less option
export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS"

# Colored manpages
export LESS_TERMCAP_mb=$'\E[01;34m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;32m'
#export LESS_TERMCAP_so=$'\E[00;47;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;34m'
export LESSHISTFILE=/dev/null

# LS COLORS terminal output
export LS_COLORS="$(vivid -m 8-bit generate molokai)"
# PATHS
export PATH="/usr/local/opt/python@3.9/bin:$PATH"
## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
HISTDUP=erase

# OPTIONS
setopt nobeep			# disable noise
setopt autocd			# change dirs without entering cd
setopt promptsubst
setopt append_history	# dont override history
setopt extended_history	# record time and duration of commands
setopt share_history	# share history btw shell ttys
setopt hist_expire_dups_first	# Clear duplicates when trimming internal hist
setopt hist_find_no_dups # No display of duplicates searches
setopt hist_ignore_dups	 # ignore consecutive duplicates
setopt hist_ignore_all_dups # remember only unique cmds
setopt hist_reduce_blanks	# remove blanks
setopt hist_save_no_dups	# replace older cmds with newer
setopt pushd_ignore_dups 	# dont push copies of same dir on stack
setopt pushd_minus			# Reference stack entries with "-"
setopt hist_verify interactive_comments octal_zeroes
setopt hist_ignore_space
setopt inc_append_history
setopt rc_quotes extended_glob notify
setopt hash_all

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

# automatically remove duplicates from these arrays
# typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH
typeset -U PATH
# zstyle
zstyle ':completion:*' list-prompt '%S%M matches%s' #from prezto
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' rehash true
# Automatically update PATH entries
zstyle ':completion:*' rehash true

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true
# show descriptions when autocompleting
zstyle ":completion:*:descriptions" format "%B%d%b"
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' format 'Completing %d'
# Partial completion suggestions
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' expand preffix suffix
# list with colors
zstyle ':completion:*' list-colors ' '

# Ignore completion functions for commands not in the system
zstyle ':completion:*:functions' ignored-patterns '_*'

# define autoloads
autoload -Uz compinit && compinit
autoload -Uz prompinit && promptinit
autoload -Uz colors && colors

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
