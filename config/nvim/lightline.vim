function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline  = {
   \ 'colorscheme': 'icebergDark',
   \ 'component': {
	\     'lineinfo': '>>= %3l:%-2v',
   \},
   \ 'separator': { 'left': 'λ', 'right': 'λ' },
   \ 'subseparator': { 'left': 'λ', 'right': 'λ' },
   \ 'active': {
      \ 'left': [ [ 'mode', 'paste' ],
         \ [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ],
         \ [ 'gitbranch', 'readonly', 'filename', 'modified' ]]
   \ },
   \ 'component_function': {
      \ 'cocstatus': 'coc#status',
      \ 'gitbranch': 'FugitiveHead',
      \ 'myfilename': 'LightlineFilename',
 		\ 'myreadonly': 'LightlineReadonly',
 		\ 'mymodified': 'LightlineModified',
   \}
\}


function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

" Attempt to create icon
" let g:gitbranch_icon = '↝'
" function! LightlineGitbranch()
" 	let l:bname = gitbranch#name()
" 	return l:bname != '' ? g:gitbranch_icon . ' ' . l:bname : ''
" endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname =~# '^__Tagbar__' ? 'Tagbar' :
        \ fname ==# 'ControlP' ? 'CtrlP' :
        \ fname ==# '__Gundo__' ? 'Gundo' :
        \ fname ==# '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~# 'NERD_tree' ? 'NERDTree' :
        \ &ft ==# 'unite' ? 'Unite' :
        \ &ft ==# 'vimfiler' ? 'VimFiler' :
        \ &ft ==# 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') ==# 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  return lightline#statusline(0)
endfunction


let g:lightline.component_expand = {
    \ 'tabs': 'lightline#tabs' }

" function! LightlineReadonly()
" 	return &readonly ? '⭤' : ''
" endfunction

" function! LightlineFugitive()
" 	if exists('*FugitiveHead')
" 		let branch = FugitiveHead()
" 		return branch !=# '' ? '⭠ '.branch : ''
" 	endif
" 	return ''
" endfunction

function! LightlineModified()
	return &ft =~# 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
	return &ft !~? 'help\|vimfiler' && &readonly ? '⭤' : ''
endfunction

function! LightlineFilename()
	return (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
	\ (&ft ==# 'vimfiler' ? vimfiler#get_status_string() :
	\  &ft ==# 'unite' ? unite#get_status_string() :
	\  &ft ==# 'vimshell' ? vimshell#get_status_string() :
	\ expand('%:t') !=# '' ? expand('%:t') : '[No Name]') .
	\ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
	if &ft !~? 'vimfiler' && exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? '⭠ '.branch : ''
	endif
	return ''
endfunction


" let g:lightline = {
" 		\ 'colorscheme': 'icebergDark',
" 		\ 'active': {
" 		\   'left': [ [ 'mode', 'paste' ], [ 'myfilename' ] ]
" 		\ },
" 		\ 'component_function': {
" 		" 		\ }
" 	\ }

" let g:lightline = {
" 	\ 'active': {
" 	\   'left': [ [ 'mode', 'paste' ],
" 	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
" 	\ },
" 	\ 'component_function': {
" 	\   'gitbranch': 'FugitiveHead'
" 	\ },
" 	\ }


" let g:lightline.tab = {
"     \ 'active': [ 'tabnum', 'filename', 'modified' ],
"     \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }


"  function! LightlineFilename()
"  	return (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
"  	      \ (&ft ==# 'vimfiler' ? vimfiler#get_status_string() :
"  	      \  &ft ==# 'unite' ? unite#get_status_string() :
"  	      \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]') .
"  	      \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
"  endfunction

" function! LightlineReadonly()
" 	return &ft !~? 'help' && &readonly ? 'RO' : ''
" endfunction

function! LightlineModified()
	return &modifiable && &modified ? '+' : ''
endfunction

" let g:lightline.component = {
"     \ 'mode': '%{lightline#mode()}',
"     \ 'absolutepath': '%F',
"     \ 'relativepath': '%f',
"     \ 'filename': '%t',
"     \ 'modified': '%M',
"     \ 'bufnum': '%n',
"     \ 'paste': '%{&paste?"PASTE":""}',
"     \ 'readonly': '%R',
"     \ 'charvalue': '%b',
"     \ 'charvaluehex': '%B',
"     \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
"     \ 'fileformat': '%{&ff}',
"     \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
"     \ 'percent': '%3p%%',
"     \ 'percentwin': '%P',
"     \ 'spell': '%{&spell?&spelllang:""}',
"     \ 'lineinfo': '%3l:%-2v',
"     \ 'line': '%l',
"     \ 'column': '%c',
"     \ 'close': '%999X X ',
"     \ 'winnr': '%{winnr()}' }


" let g:lightline = { 'colorscheme': 'material_vim', 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" }, 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }}
" let g:lightline = { 'colorscheme': 'iceberg', 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" }, 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }}
" 'currentfunction':'CocCurrentFunction'
