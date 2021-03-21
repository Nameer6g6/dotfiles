set nocompatible
let g:polyglot_disabled = ['css','ruby','javascript', 'haskell', 'cs']

source $HOME/.config/nvim/plugins.vim

filetype plugin indent on

" let g:python_host_prog  = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python'
let g:ruby_host_prog    = '~/.asdf/shims/neovim-ruby-host'

let g:rehash256 = 1
set encoding=UTF-8
set mouse=a
set expandtab
set smarttab
set tabstop=3
set shiftwidth=3
set list
set listchars=tab:\·\ ,trail:.,extends:#,nbsp:.

set noswapfile
set nu
set numberwidth=1
set splitbelow
set splitright
set wrap
set ruler
syntax enable

" Find file with `find`
set path+=**
set wildmenu

" Create ctag tags file
command! MakeTags !ctags -R .
command! MakeHaskellTags !hasktags --ctags .

set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set cmdheight=2

set signcolumn=yes


nnoremap &lt;leader&gt;t :call &lt;SID&gt;show_documentation()&lt;CR&gt;

" To make git_prompt_info works
 set ff=unix
 set cursorline
 set laststatus=2
 set showtabline=2

 if (has("termguicolors"))
    set termguicolors
 endif

" If Nord
"colorscheme nord
"let g:nord_cursor_line_number_background = 1

" colorscheme OceanicNext
colorscheme iceberg
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

"let g:tmuxcomplete#trigger = 'completefunc'
"let g:tmuxcomplete#trigger = ''

let g:ale_completion_enabled = 1

"let g:syntastic_vim_checkers = ['vint']

" Auto Cost Import
" augroup import_cost_auto_run
"    autocmd!
"    autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx ImportCost autocmd BufEnter *.js,*.jsx,*.ts,*.tsx ImportCost
"    autocmd CursorHold *.js,*.jsx,*.ts,*.tsx ImportCost
" augroup END

" autocmd QuickFixCmdPost *grep* cwindow

let g:ale_linters = {
   \ 'cs': ['OmniSharp'],
   \ }

" let g:ale_fixers = {
" \   'javascript': ['prettier'],
" \   'css': ['prettier'],
" \}

let g:ale_fixers = {}

" Specifing ale to use only OmniSharp
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_fix_on_save = 0

if has('ruby') == 1
   let g:ale_linters.ruby = ['standardrb']
   let g:ale_fixers = {'ruby': ['standardrb']}
   let g:ale_fix_on_save = 1
" elseif has('python') == 1
   " let g:ale_linters.ruby = ['pycodestyle']
   " let g:ale_fixers = {'python': ['pycodestyle']}
   " let g:ale_fix_on_save = 1
endif

if executable('standardrb') == 1
   "let call map(g:ale_linters, {'ruby': ['standardrb']})
   let g:ale_linters.ruby = ['standardrb']
   let g:ale_fixers = {'ruby': ['standardrb']}
   let g:ale_fix_on_save = 1
endif

" Automate line numbers
autocmd InsertEnter * silent! setlocal norelativenumber
autocmd InsertLeave * silent! setlocal relativenumber

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType ruby setlocal omnifunc=syntaxcompelete#Complete
" autocmd FileType elixir setlocal omnifunc=syntaxcompelete#Complete

""""""""""""
" TagBar
""""""""""""
"let g:tmuxcomplete#asyncomplete_source_options = {
"            \ 'name':      'tmuxcomplete',
"            \ 'whitelist': ['*'],
"            \ 'config': {
"            \     'splitmode':      'words',
"            \     'filter_prefix':   1,
"            \     'show_incomplete': 1,
"            \     'sort_candidates': 0,
"            \     'scrollback':      0,
"            \     'truncate':        0
"            \     }
"            \ }

" NerdComment configs
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" Fix for FloatTerm leaves empty window with Startify
autocmd User Startified setlocal buflisted

" Coc
source $HOME/.config/nvim/coc.vim

" LightLine
source $HOME/.config/nvim/lightline.vim

" C#/Omnisharp
source $HOME/.config/nvim/csharp.vim

" Elixir
source $HOME/.config/nvim/elixir.vim

" Haskell
source $HOME/.config/nvim/haskell.vim

" PureScript
source $HOME/.config/nvim/purescript.vim

" Limelight & Goyo
source $HOME/.config/nvim/limelight_goyo.vim

" Other languages
source $HOME/.config/nvim/langs.vim

" NerdTree
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR> nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Show Discord Presence
nnoremap <leader>qq :DiscordUpdatePresence<CR>

let g:python3_host_skip_check = 1
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

" Fold
" Handling created fold blocks to be presisted
augroup remember_folds
   autocmd!
    " au BufWinLeave ?* mkview 1
    " au BufWinEnter ?* silent loadview 1
   autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
   autocmd BufWinEnter ?* silent! loadview
augroup END

" autocmd BufWinLeave ?* mkview 1 | filetype detect
" autocmd BufWinEnter ?* silent loadview 1 | filetype detect

set foldcolumn=2
hi Folded guifg=LightRed
hi FoldColumn guifg=LightRed
set viewoptions=folds,cursor
" set sessionoptions=folds,blank,buffers,curdir,folds,help,options,tabpages,winsize
set sessionoptions=folds,options,tabpages
" hi Folded ctermfg=216

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" Testing Section
nnoremap <leader>FF :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
   " if &foldcolumn
   " if foldclosed() == 0
   "    setlocal foldcolumn=0
   " else
   "    setlocal foldcolumn=4
   " endif
      " echom &foldcolumn
   " foldclosed({lnum})
   " echom iflnum
endfunction

" function CheckIfFileExists(filename)
"   if filereadable(a:filename)
"     return 1
"   endif
"
"   return 0
" endfunction

hi diffAdded   ctermfg=green
hi diffRemoved ctermfg=red

"Setting for TagBar
" nnoremap <leader>tj :TagbarOpen j<CR>
nnoremap <silent><expr> <Leader>tj bufname() =~# '.Tagbar.' ? "\<C-w>\<C-p>" : ":TagbarOpen j<CR>"
hi TagbarKind term=bold ctermfg=Green
hi TagbarNestedKind ctermfg=126
hi TagbarScope term=bold ctermfg=208
hi TagbarType ctermfg=28
hi TagbarSignature ctermfg=21


" This section handle change terminal background
" color that remain aroud the borders
" function GetCurrentBG()
"     return fnameescape(synIDattr(hlID("normal"), "bg"))
" endfunction
"
" let g:shell_pid = substitute(system('ps -oppid= -p `ps -oppid= $$`'), '\n\| ', '', 'g')
"
" function WriteEscapeSequence(seq)
"     let shell_fd = '/proc/' . g:shell_pid . '/fd/0'
"     let command = '!printf "' . a:seq . '\007" >' . shell_fd
"     exe command
" endfunction
"
" augroup theme
"    au!
"    " Change terminal bg according to theme bg
"    autocmd VimEnter * silent! :call WriteEscapeSequence("\e]11;" . GetCurrentBG())
"    autocmd VimLeave * silent! :call WriteEscapeSequence("\e]46;" . fnameescape(g:terminal_bg))
"    autocmd ColorScheme * silent! :call WriteEscapeSequence("\e]11;" . GetCurrentBG())
" augroup END

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
