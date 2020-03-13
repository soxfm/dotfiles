" Commonly accepted VIM settings
set nocompatible 
set wildmenu
set secure
set ttyfast
set exrc
set binary
set noeol
set clipboard=unnamed
set encoding=utf-8 nobomb
set number
set mouse=a
set noerrorbells
set nostartofline
set showmode
set title
set showcmd
set tabstop=2
set shiftwidth=2
set hlsearch
set number
set list
set ignorecase
set incsearch
syntax on
set t_Co=256

" Regaring History and Backup Files
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists ("&undodir")
	set undodir=~/.vim/undo
endif

" Do not create backup files whenever on tmp dirs
set backupskip=/tmp/*,/private/tmp/*

" Automatic commands
if has ("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletypes json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setfiletypes *.md setlocal filetype=markdown
endif

