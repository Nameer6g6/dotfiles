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
" Plug 'aurieh/discord.nvim'
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
Plug 'christoomey/vim-sort-motion'


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
Plug 'w0rp/ale'
Plug 'DougBeney/pickachu'
Plug 'honza/vim-snippets'
Plug 'mbbill/undotree'
Plug 'chr4/nginx.vim'
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sheerun/vim-polyglot'
Plug 'sbdchd/neoformat'
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
Plug 'slashmili/alchemist.vim'
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
" Plug 'enomsg/vim-haskellConcealPlus'
Plug 'calebsmith/vim-lambdify'
" Plug 'sdiehl/vim-ormolu'

" PureScript Support
Plug 'purescript-contrib/purescript-vim'
Plug 'frigoeu/psc-ide-vim'
" Plug 'sriharshachilakapati/vimmer-ps'

" Fsharp Support
Plug 'lucasteles/fsi.vim'
Plug 'yatli/fvim'

" Crystal Support
Plug 'rhysd/vim-crystal'

" Rust Support
Plug 'rust-lang/rust.vim'

" Vim Support
Plug 'junegunn/vader.vim'

" Javascript Support
Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
" Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'sbdchd/neoformat'

" Python Support
Plug 'psf/black', { 'branch': 'stable' }

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'kbrw/elixir.nvim'
"Plug 'wellle/tmux-complete.vim'
"Plug 'Shougo/neco-vim'
"Plug 'racer-rust/vim-racer'  "  Rust code completion and navigation.
"Plug 'Shougo/denite.nvim'

call plug#end()
