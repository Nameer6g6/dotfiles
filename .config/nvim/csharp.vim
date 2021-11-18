let g:OmniSharp_lookup_metadata = 1
let g:OmniSharp_server_stdio = 1
" let g:OmniSharp_diagnostic_showid = 1
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_popup = 1
let g:OmniSharp_popup_options = {
\ 'winblend': 30,
\ 'winhl': 'Normal:Normal'
\}
" let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
" let g:OmniSharp_timeout = 5
" let g:OmniSharp_proc_debug = 1
let g:omnicomplete_fetch_full_documentation=1

" key maps
nnoremap <leader>ou :OmniSharpFixUsings<cr>
nnoremap <leader>oa :OmniSharpGetCodeActions<cr>
nnoremap <leader>ot :OmniSharpTypeLookup<cr>

"let g:OmniSharp_popup_mappings.close = '<Esc>'
