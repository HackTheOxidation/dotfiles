" Ctrl-b will move to next buffer
nnoremap <C-b> :bnext<CR>

" Ctrl-p will go back
nnoremap <C-p> :bprevious<CR>

" Alt-w kills a buffer
nnoremap <m-w> :bdelete<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" use <c-space> to trigger coc completion
inoremap <silent><expr> <c-space> pumvisible() ? coc#_select_confirm() : coc#refresh()
