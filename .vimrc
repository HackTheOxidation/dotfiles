source $HOME/.vim/init.vim " Basic settings
source $HOME/.vim/vim-plug/plugins.vim " Plugins provided by vim-plug

" Important!!
if has('termguicolors')
    set termguicolors
endif

" For dark version.
set background=dark

" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'soft'

" For better performance
let g:everforest_better_performance = 1

colo everforest
