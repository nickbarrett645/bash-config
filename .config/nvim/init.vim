" disable compatibility to old-time vi
set nocompatible
" show matching 
set showmatch
" case insensitive 
set ignorecase
" middle-click paste with 
set mouse=v
" highlight search 
set hlsearch
" incremental search
set incsearch
" number of columns occupied by a tab 
set tabstop=4
" see multiple spaces as tabstops so <BS> does the right thing
set softtabstop=4
" converts tabs to white space
set expandtab
" width for autoindents
set shiftwidth=4
" indent a new line the same amount as the line just typed
set autoindent
" add line numbers
set number
" get bash-like tab completions
set wildmode=longest,list
" set an 80 column border for good coding style
set cc=80
" allow auto-indenting depending on file type
filetype plugin indent on
" syntax highlighting
syntax on
" enable mouse click
set mouse=a
" using system clipboard
set clipboard=unnamedplus
filetype plugin on
" highlight current cursorline
set cursorline
" Speed up scrolling in Vim
set ttyfast
" enable spell check (may need to download language package)
" set spell
" disable creating swap file
" set noswapfile
" Directory to store backup files.
" set backupdir=~/.cache/vim
