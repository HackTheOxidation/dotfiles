" HackTheOxidation's .vimrc

" Basic settings
set number 			        " Enable line numbers	
syntax on 			        " Enable syntax highlighting
set nocompatible		    " Disable compatibility with Vi
filetype on			        " Enable file type detection
filetype plugin on		    " Enable plugins for detected file type
filetype indent on		    " Enable indentation for detected file type

set shiftwidth=4		    " Set shift width to 4
set tabstop=4			    " Set tab width to 4
set expandtab			    " Use spaces instead of tabs
set nobackup			    " Do not create backup files
set scrolloff=10		    " Don't scroll above or below N lines
set nowrap			        " Don't wrap lines

set incsearch			    " Highlight characters while searching
set ignorecase			    " Ignore case when searching
set smartcase			    " Override ignorecase when searching for Capital letters
set showcmd			        " Show command on the last line
set showmode			    " Show mode one the last line
set showmatch			    " Show matching words while searching
set hlsearch			    " Maintain syntax highlighting when searching
set smartindent             " Adaptive indentation
set autoindent              " Automatically indent lines
set smarttab                " Tab, indent or inline

set history=1000		    " Limit command history

set wildmenu			    " Enable auto completion in command mode
set wildmode=list:longest	" Make wildmenu behave like bash
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.o 

set splitbelow              " Force split below with horizontal splits
set splitright              " Force split right with vertical splits

set clipboard=unnamedplus   " Use and share system clipboard

let mapleader = ","

set termguicolors           " Enable colorschemes instead of default
