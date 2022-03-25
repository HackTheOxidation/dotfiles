" ALE
let g:ale_linters = { 
      \ 'cs' : ['OmniSharp'], 
      \ 'rust' : ['analyzer'],
      \ 'go': ['gopls'],
      \ }

let g:ale_sign_column_always = 1
let g:ale_virtualtext_cursor = 1
let g:ale_echo_cursor = 0
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
