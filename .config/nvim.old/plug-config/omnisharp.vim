" OmniSharp
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_autoselect_existing_sln = 1
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_highlighting = 3
let g:OmniSharp_diagnostic_exclude_paths = [ 'Temp[/\\]', 'obj[/\\]', '\.nuget[/\\]' ]
let g:OmniSharp_fzf_options = { 'down': '10' }

nmap gd <Plug>(omnisharp_go_to_definition)
nmap <Leader><Space> <Plug>(omnisharp_code_actions)
xmap <Leader><Space> <Plug>(omnisharp_code_actions)
nmap <F2> <Plug>(omnisharp_rename)
nmap <Leader>cf <Plug>(omnisharp_code_format)
nmap <Leader>fi <Plug>(omnisharp_find_implementations)
nmap <Leader>fs <Plug>(omnisharp_find_symbol)
nmap <Leader>fu <Plug>(omnisharp_find_usages)
nmap <Leader>dc <Plug>(omnisharp_documentation)
nmap <Leader>cc <Plug>(omnisharp_global_code_check)
nmap <Leader>rt <Plug>(omnisharp_run_test)
nmap <Leader>rT <Plug>(omnisharp_run_tests_in_file)
nmap <Leader>ss <Plug>(omnisharp_start_server)
nmap <Leader>sp <Plug>(omnisharp_stop_server)
nmap <C-\> <Plug>(omnisharp_signature_help)
imap <C-\> <Plug>(omnisharp_signature_help)

autocmd BufWritePre *.cs :OmniSharpCodeFormat
