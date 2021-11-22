set listchars=tab:\·\ ,trail:.,extends:#,nbsp:.

let g:rehash256 = 1

 if (has("termguicolors"))
    set termguicolors
 endif

" Create ctag tags file
command! MakeTags !ctags -R .
command! MakeHaskellTags !hasktags --ctags .

" Automate line numbers
autocmd InsertEnter * silent! setlocal norelativenumber
autocmd InsertLeave * silent! setlocal relativenumber

" NerdComment configs
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" Tagbar
nmap <F8> :TagbarToggle<CR>

" NvimTree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>

" Fold
" Handling created fold blocks to be presisted
augroup remember_folds
   autocmd!
    " au BufWinLeave ?* mkview 1
    " au BufWinEnter ?* silent loadview 1
   autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
   autocmd BufWinEnter ?* silent! loadview
augroup END

" set foldcolumn=2
" hi Folded guifg=LightRed
" hi FoldColumn guifg=LightRed
" set viewoptions=folds,cursor
" " set sessionoptions=folds,blank,buffers,curdir,folds,help,options,tabpages,winsize
" set sessionoptions=folds,options,tabpages
" hi Folded ctermfg=216
"
hi diffAdded   ctermfg=green
hi diffRemoved ctermfg=red

" inserting date
nnoremap <leader>td "=strftime("%Y-%m-%d")<CR>P
inoremap <leader>td <C-R>=strftime("%Y-%m-%d")<CR>

nnoremap <leader>S :lua require('spectre').open()<CR>
" search current word
nnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s :lua require('spectre').open_visual()<CR>
" search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>

" Keep Eye
let g:keepeye_features = ['bell', 'notification', 'statusline']
" let g:keepeye_features = ['bell', 'notification']
let g:keepeye_autostart = 1
let g:keepeye_timer = 900
let g:keepeye_message = 'SAVE YOUR EYES, DRINK WATER, TAKE A BREAK'

" Show Discord Presence
nnoremap <leader>qq :DiscordUpdatePresence<CR>
" nnoremap <leader>qq :lua Presence:update()<CR>


" Exiting Terminal mode remapping
:tnoremap <C-\><C-\> <C-\><C-n>

" Dashboard
let g:dashboard_default_executive ='fzf.vim'

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" mapping
nnoremap <Leader>rg :Grep<space>
" function to process fzf select
function! ProcessRgFzf(line)
    " line = FILE : COL : ROW : WORD
    let l:info = split(a:line, ":")
    execute "edit " .. l:info[0]
    call cursor(l:info[1], l:info[2])
    call feedkeys("*``", "n")
endfunction
" the command
command! -bang -nargs=* Grep
  \ call fzf#vim#grep(
  \   'rg -o -p --column --no-heading -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'sink': function('ProcessRgFzf')}), <bang>0)


" Setting for TagBar
" nnoremap <leader>tj :TagbarOpen j<CR>
nnoremap <silent><expr> <Leader>tj bufname() =~# '.Tagbar.' ? "\<C-w>\<C-p>" : ":TagbarOpen j<CR>"
hi TagbarKind term=bold ctermfg=Green
hi TagbarNestedKind ctermfg=126
hi TagbarScope term=bold ctermfg=208
hi TagbarType ctermfg=28
hi TagbarSignature ctermfg=21


" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" NOTE: Ale
let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ }
