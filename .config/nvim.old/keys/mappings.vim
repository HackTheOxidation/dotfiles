" Better nav for omnicomplete 
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Ctrl-l will move to next buffer
nnoremap <c-l> :bnext<CR>

" Ctrl-h will go back
nnoremap <c-h> :bprevious<CR>

" Alt-w kills a buffer
nnoremap <m-w> :bdelete<CR>

" Better window navigation
nnoremap <m-h> <C-w>h
nnoremap <m-j> <C-w>j
nnoremap <m-k> <C-w>k
nnoremap <m-l> <C-w>l

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> pumvisible() ? coc#_select_confirm() : coc#refresh()

"Better tabbing
vnoremap < <gv
vnoremap > >gv

" Shortcuts for telescope.nvim
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"nnoremap <Leader>o o<Esc>^Da
"nnoremap <Leader>O O<Esc>^Da
