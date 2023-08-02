" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	"autocmd VimEnter * PlugInstall
	"autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

	Plug 'mhinz/vim-signify'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'junegunn/gv.vim'
	Plug 'rust-lang/rust.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'junegunn/rainbow_parentheses.vim'
	Plug 'tpope/vim-commentary'
	Plug 'junegunn/fzf.vim'
	Plug 'liuchengxu/vim-which-key'
  Plug 'nvim-lua/completion-nvim'
  Plug 'w0rp/ale'
  Plug 'OmniSharp/omnisharp-vim'
	Plug 'neovim/nvim.net'
	Plug 'aklt/plantuml-syntax'
	Plug 'tyru/open-browser.vim'
	Plug 'weirongxu/plantuml-previewer.vim'
	Plug 'fladson/vim-kitty'
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
	Plug 'tpope/vim-dispatch'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'alx741/vim-stylishask'

call plug#end()
