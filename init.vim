set nocompatible
filetype off

call plug#begin('~/.vim/plugins')
" Utility
Plug 'ObserverOfTime/discord.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'KabbAmine/zeavim.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'arcticicestudio/nord-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dominikduda/vim_timebox'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'liuchengxu/vim-clap'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'severin-lemaignan/vim-minimap'
Plug 'thinca/vim-ref'
Plug 'voldikss/vim-floaterm'
Plug 'Kethku/neovide'

" Debugger plugin
Plug 'puremourning/vimspector'

" Commenting out plugin
Plug 'scrooloose/nerdcommenter'

" Generic Programming Support
Plug 'Townk/vim-autoclose'
Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'KabbAmine/zeavim.vim'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

" Frontend Support
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
Plug 'chemzqm/vim-cssfmt'

" Markdown / Writting

"Plug 'reedes/vim-pencil'
Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'jtratner/vim-flavored-markdown'
Plug 'tpope/vim-markdown'
Plug 'vimwiki/vimwiki'

" Git Support
"Plug 'gregsexton/gitv'
"Plug 'jaxbot/github-issues.vim'
"Plug 'mhinz/vim-signify'
"Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-github-dashboard'
Plug 'kablamo/vim-git-log'
Plug 'tpope/vim-fugitive'

" PHP Support
Plug 'phpvim/phpcd.vim'
Plug 'tobyS/pdv'

" Erlang Support
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-compiler'

" Elixir Support
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'mmorearty/elixir-ctags'
Plug 'mattreduce/vim-mix'
Plug 'mhinz/vim-mix-format'
Plug 'BjRo/vim-extest'
Plug 'frost/vim-eh-docs'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-endwise'
Plug 'jadercorrea/elixir_generator.vim'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

" Haskell Support
Plug 'neovimhaskell/haskell-vim'

" PureScript Support
Plug 'purescript-contrib/purescript-vim'

" Crystal Support
Plug 'rhysd/vim-crystal'

" Javascript Support
Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
" Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'sbdchd/neoformat'

" TypeScript Support
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

" Ruby Support
Plug 'tpope/vim-rails'
" Plug 'vim-ruby/vim-ruby'

" Go Support
Plug 'fatih/vim-go'
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugins/gocode/nvim/symlink.sh' }

" Elm Support
Plug 'lambdatoast/elm.vim'
Plug 'ElmCast/elm-vim'

" Dart & Flutter  Support
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'reisub0/hot-reload.vim'

" C# & .Net Support
Plug 'OmniSharp/omnisharp-vim'
Plug 'OrangeT/vim-csharp'

" Theme / Interface
Plug 'junegunn/vim-emoji'
Plug 'mhartington/oceanic-next'

" Tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-obsession'
"Plug 'wellle/tmux-complete.vim

" Completion
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

"Plug 'kbrw/elixir.nvim'
"Plug 'wellle/tmux-complete.vim'
"Plug 'Shougo/neco-vim'
"Plug 'racer-rust/vim-racer'  "  Rust code completion and navigation.
"Plug 'Shougo/denite.nvim'

call plug#end()

filetype plugin indent on

set nowrap
set nu
set encoding=UTF-8
set ruler
set tabstop=3
set shiftwidth=3
set smarttab
set expandtab
" set noexpandtab
set wrap
set mouse=a
set numberwidth=1
set splitbelow
set list
set listchars=tab:\·\ ,trail:.,extends:#,nbsp:.
syntax on

"""""""
" Coc "
"""""""
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes
set cmdheight=2

nnoremap &lt;leader&gt;t :call &lt;SID&gt;show_documentation()&lt;CR&gt;

" To make git_prompt_info works
set ff=unix
set cursorline
set laststatus=2
set showtabline=2

if (has("termguicolors"))
   set termguicolors
endif

colorscheme OceanicNext
let g:airline_theme='oceanicnext'
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

" Markdown Syntax Support
augroup markdown
   au!
   au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Air
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


autocmd QuickFixCmdPost *grep* cwindow


let g:ale_linters = {
   \ 'cs': ['OmniSharp'],
   \ }

let g:ale_fixers = {}

" Specifing ale to use only OmniSharp
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_fix_on_save = 0

if has('ruby') == 1
   let g:ale_linters.ruby = ['standardrb']
   let g:ale_fixers = {'ruby': ['standardrb']}
   let g:ale_fix_on_save = 1
elseif has('python') == 1
   let g:ale_linters.ruby = ['pycodestyle']
   let g:ale_fixers = {'python': ['pycodestyle']}
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


"""""""""""
" Haskell "
"""""""""""
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords



" NerdComment configs
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Fix for FloatTerm leaves empty window with Startify
autocmd User Startified setlocal buflisted

" LightLine
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline  = {
   \ 'colorscheme': 'oceanicnext',
   \ 'active': {
      \ 'left': [ [ 'mode', 'paste' ],
         \ [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ]]
   \ },
   \ 'component_function': {
      \ 'cocstatus': 'coc#status',
      \ 'currentfunction':'CocCurrentFunction'
   \}
\}


let g:polyglot_disabled = ['css','ruby','javascript']

let g:OmniSharp_lookup_metadata = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_diagnostic_showid = 1
" let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
" let g:OmniSharp_timeout = 5
" let g:OmniSharp_proc_debug = 1

""""""""""""
" Mappings "
""""""""""""
" NerdTree
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>

" Vim-Alchemist Mappings
set relativenumber
autocmd FileType elixir nnoremap <buffer> <leader>h :call alchemist#exdoc()<CR>
autocmd FileType elixir nnoremap <buffer> <leader>d :call alchemist#exdef()<CR>

" OmniSharp
nnoremap <leader>of :OmniSharpFixUsings<cr>
nnoremap <leader>og :OmniSharpGetCodeActions<cr>

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
