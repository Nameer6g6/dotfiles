call plug#begin('~/.vim/plugins')

" Utility
"Plug 'BufOnly.vim'
"Plug 'benmills/vimux'
"Plug 'gilsondev/searchtasks.vim'
"Plug 'godlygeek/tabular'
"Plug 'jeetsukumaran/vim-buffergator'
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'
Plug 'ObserverOfTime/discord.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'KabbAmine/zeavim.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'kovetskiy/sxhkd-vim'                         "sxhkd is X hotkey daemon

" Testing
" Plug 'liuchengxu/vim-clap'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'dominikduda/vim_timebox'
" Plug 'ervandew/supertab'
" Plug 'mileszs/ack.vim'
" Plug 'severin-lemaignan/vim-minimap'
" Plug 'thinca/vim-ref'
" Plug 'voldikss/vim-floaterm'
" Plug 'arcticicestudio/nord-vim'
" Plug 'junegunn/vim-emoji'
" Plug 'vifm/vifm.vim'

" Debugger plugin
" Plug 'puremourning/vimspector'
Plug 'Kethku/neovide'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

" Commenting out plugin
Plug 'scrooloose/nerdcommenter'

" Generic Programming Support
Plug 'Townk/vim-autoclose'
Plug 'ntpeters/vim-better-whitespace'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'DougBeney/pickachu'
"Plug 'janko-m/vim-test'
"Plug 'maksimr/vim-jsbeautify'
"Plug 'tobyS/vmustache'
" Plug 'honza/vim-snippets'
" Plug 'vim-syntastic/syntastic'

" Frontend Support
Plug 'mattn/emmet-vim'
Plug 'chemzqm/vim-cssfmt'
" Plug 'ap/vim-css-color'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'othree/html5.vim'

"Plug 'LanguageTool'
Plug 'reedes/vim-pencil'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'gabrielelana/vim-markdown'
" Plug 'tpope/vim-markdown'
Plug 'vimwiki/vimwiki'

" Git Support
Plug 'gregsexton/gitv'
" Plug 'jaxbot/github-issues.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'jreybert/vimagit'

" Testing
" Plug 'airblade/vim-gitgutter'
" Plug 'junegunn/vim-github-dashboard'
" Plug 'kablamo/vim-git-log'

" PHP Support
" Plug 'phpvim/phpcd.vim'
" Plug 'tobyS/pdv'

" Erlang Support
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'

" Elixir Support
" Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
" Plug 'slashmili/alchemist.vim'
Plug 'BjRo/vim-extest'
Plug 'avdgaag/vim-phoenix'
Plug 'elixir-lang/vim-elixir'
Plug 'frost/vim-eh-docs'
Plug 'jadercorrea/elixir_generator.vim'
Plug 'mattreduce/vim-mix'
Plug 'mhinz/vim-mix-format'
Plug 'mmorearty/elixir-ctags'
Plug 'tpope/vim-endwise'


" Haskell Support
Plug 'neovimhaskell/haskell-vim'
Plug 'Twinside/vim-haskellConceal'

" PureScript Support
Plug 'purescript-contrib/purescript-vim'
Plug 'frigoeu/psc-ide-vim'

" Crystal Support
Plug 'rhysd/vim-crystal'

" Javascript Support
Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
" Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'sbdchd/neoformat'

" TypeScript Support
Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim'

" Ruby Support
Plug 'tpope/vim-rails'
" Plug 'vim-ruby/vim-ruby'

" Go Support
Plug 'fatih/vim-go'
" Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugins/gocode/nvim/symlink.sh' }

" Elm Support
" Plug 'lambdatoast/elm.vim'
" Plug 'ElmCast/elm-vim'

" Dart & Flutter  Support
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'reisub0/hot-reload.vim'

" C# & .Net Support
Plug 'OmniSharp/omnisharp-vim'
" Plug 'OrangeT/vim-csharp'

" Theme / Interface
"Plug 'AnsiEsc.vim'
"Plug 'mkarmona/colorsbox'
"Plug 'Lokaltog/vim-distinguished'
Plug 'cocopon/iceberg.vim'
Plug 'gkeep/iceberg-dark'

" Testing
" Plug 'mhartington/oceanic-next'

" Tmux
" Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'tmux-plugins/vim-tmux'
" Plug 'tpope/vim-obsession'
"Plug 'wellle/tmux-complete.vim

" Completion
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

"Plug 'kbrw/elixir.nvim'
"Plug 'wellle/tmux-complete.vim'
"Plug 'Shougo/neco-vim'
"Plug 'racer-rust/vim-racer'  "  Rust code completion and navigation.
"Plug 'Shougo/denite.nvim'

call plug#end()

set nocompatible
filetype plugin indent on

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

""""""""
"" Coc "
""""""""
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set cmdheight=2

set signcolumn=yes

let g:coc_global_extensions = ['coc-solargraph',
\     'coc-css',
\     'coc-clangd',
\     'coc-css',
\     'coc-cssmodules',
\     'coc-elixir',
\     'coc-flutter',
\     'coc-html',
\     'coc-go',
\     'coc-prettier',
\     'coc-python']

nnoremap &lt;leader&gt;t :call &lt;SID&gt;show_documentation()&lt;CR&gt;

" To make git_prompt_info works
 set ff=unix
 set cursorline
 set laststatus=2
 set showtabline=2

 if (has("termguicolors"))
    set termguicolors
 endif

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"
" if !empty(s:languageservers)
"    call coc#config('languageserver', s:languageservers)
" endif


" inoremap <silent><expr> <TAB>
"          \ pumvisible() ? "\<C-n>" :
"          \ <SID>check_back_space() ? "\<TAB>" :
"          \ coc#rpc#request('doKeymap', 'snippets-expand')
"
" function! s:check_back_space() abort
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~# '\s'
" endfunction


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

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

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
" Elixir Tagbar Configuration
let g:tagbar_type_elixir = {
         \ 'ctagstype' : 'elixir',
         \ 'kinds' : [
         \ 'f:functions',
         \ 'functions:functions',
         \ 'c:callbacks',
         \ 'd:delegates',
         \ 'e:exceptions',
         \ 'i:implementations',
         \ 'a:macros',
         \ 'o:operators',
         \ 'm:modules',
         \ 'p:protocols',
         \ 'r:records',
         \ 't:tests'
         \ ]
         \ }

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


" Haskell "
"""""""""""
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
" let g:ale_haskell_stack_ghc_options = 'stack ghc'
" let g:ale_haskell_hie_executable = 'hie-wrapper'
if executable('stylish-haskell')
   command! -nargs=0 FmtHaskell :%!stylish-haskell
endif

" NerdComment configs
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Fix for FloatTerm leaves empty window with Startify
autocmd User Startified setlocal buflisted
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" LightLine
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline  = {
   \ 'colorscheme': 'icebergDark',
   \ 'component': {
	\     'lineinfo': ' %3l:%-2v',
   \},
   \ 'separator': { 'left': '⮀', 'right': '⮂' },
   \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:polyglot_disabled = ['css','ruby','javascript', 'haskell', 'cs']

let g:OmniSharp_lookup_metadata = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_diagnostic_showid = 1
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_popup = 0
let g:OmniSharp_popup_options = {
\ 'winblend': 30,
\ 'winhl': 'Normal:Normal'
\}
" let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
" let g:OmniSharp_timeout = 5
" let g:OmniSharp_proc_debug = 1

""""""""""""
" Mappings "
""""""""""""
" NerdTree
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Vim-Alchemist Mappings
set relativenumber
autocmd FileType elixir nnoremap <buffer> <leader>h :call alchemist#exdoc()<CR>
autocmd FileType elixir nnoremap <buffer> <leader>d :call alchemist#exdef()<CR>

" OmniSharp
nnoremap <leader>ou :OmniSharpFixUsings<cr>
nnoremap <leader>oa :OmniSharpGetCodeActions<cr>

" Flutter
"" Enable Flutter menu
" call FlutterMenu()
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Show Discord Presence
nnoremap <leader>qq :DiscordUpdatePresence<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""'
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()



" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" if has('patch8.1.1068')
"   " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    " call CocAction('doHover')
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=? Fold :call     CocActionAsync('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:python3_host_skip_check = 1

" PureScript "
""""""""""""""
nm <buffer> <silent> <leader>L :Plist<CR>
nm <buffer> <silent> <leader>l :Pload!<CR>
nm <buffer> <silent> <leader>r :Prebuild!<CR>
nm <buffer> <silent> <leader>f :PaddClause<CR>
nm <buffer> <silent> <leader>t :PaddType<CR>
nm <buffer> <silent> <leader>a :Papply<CR>
nm <buffer> <silent> <leader>A :Papply!<CR>
nm <buffer> <silent> <leader>C :Pcase!<CR>
nm <buffer> <silent> <leader>i :Pimport<CR>
nm <buffer> <silent> <leader>qa :PaddImportQualifications<CR>
nm <buffer> <silent> <leader>g :Pgoto<CR>
nm <buffer> <silent> <leader>p :Pursuit<CR>
nm <buffer> <silent> <leader>T :Ptype<CR>
let g:psc_ide_log_level = 3

let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python'

" Emoji "
"""""""""
" let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
" let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
" let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
" let g:gitgutter_sign_modified_removed = emoji#for('collision')

" for e in emoji#list()
"   call append(line('$'), printf('%s (%s)', emoji#for(e), e))
" replace emoji name to emoji
" %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g


" Fold
" Handling created fold blocks to be presisted
augroup remember_folds
    autocmd!
    autocmd BufWinLeave ?* mkview | filetype detect
    autocmd BufWinEnter ?* silent loadview | filetype detect
augroup END
set foldcolumn=2
hi Folded guifg=LightRed
hi FoldColumn guifg=LightRed
" hi Folded ctermfg=216


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
"
" ...
"
" " Disable GHC linter if in a Haskell Stack project
" if (CheckIfFileExists("./stack.yaml") == 1)
"   let g:ale_linters = {
"   \   'haskell': ['stack-build'], " you can include any other linters in this list too
"   \}
" endif
