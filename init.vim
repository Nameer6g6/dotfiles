call plug#begin('~/.vim/plugins')

" Utility
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

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'gabrielelana/vim-markdown'
Plug 'vimwiki/vimwiki'

" Git Support
Plug 'gregsexton/gitv'
" Plug 'jaxbot/github-issues.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'jreybert/vimagit'

" Erlang Support
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'

" Elixir Support
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
Plug 'mhartington/oceanic-next'
Plug 'cocopon/iceberg.vim'
Plug 'gkeep/iceberg-dark'

" Tmux
" Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'tmux-plugins/vim-tmux'
" Plug 'tpope/vim-obsession'
" Plug 'wellle/tmux-complete.vim

" Completion
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
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

" Markdown Syntax Support
augroup markdown
   au!
   au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

autocmd QuickFixCmdPost *grep* cwindow

=======
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

" autocmd QuickFixCmdPost *grep* cwindow

let g:ale_fixers = {}

" Specifing ale to use only OmniSharp
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_fix_on_save = 0

if executable('standardrb') == 1
   let g:ale_linters.ruby = ['standardrb']
   let g:ale_fixers = {'ruby': ['standardrb']}
   let g:ale_fix_on_save = 1
endif

" Automate line numbers
autocmd InsertEnter * silent! setlocal norelativenumber
autocmd InsertLeave * silent! setlocal relativenumber


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

" LightLine
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline  = {
   \ 'colorscheme': 'icebergDark',
   \ 'component': {
	\     'lineinfo': ' %3l:%-2v',
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

function! LightlineModified()
	return &modifiable && &modified ? '+' : ''
endfunction

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

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
