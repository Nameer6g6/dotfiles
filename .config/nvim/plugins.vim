call plug#begin('~/.vim/plugins')

" Utility
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'KabbAmine/zeavim.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'kovetskiy/sxhkd-vim'                         "sxhkd is X hotkey daemon
Plug 'christoomey/vim-sort-motion'
" Plug 'soywod/vim-keepeye'
Plug 'numToStr/Navigator.nvim'

" File bar
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'romgrk/barbar.nvim'
" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'


" Status bar
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'                   " lua
Plug 'ryanoasis/vim-devicons'                         " vimscript

" Debugger plugin
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
" Plug 'Kethku/neovide'
" Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

" Commenting out plugin
Plug 'scrooloose/nerdcommenter'

" Generic Programming Support
Plug 'majutsushi/tagbar'
Plug 'Townk/vim-autoclose'
Plug 'w0rp/ale'
Plug 'honza/vim-snippets'
Plug 'mbbill/undotree'
Plug 'chr4/nginx.vim'
Plug 'sbdchd/neoformat'

" Neovim Plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'wbthomason/packer.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug 'glepnir/dashboard-nvim'

" Frontend Support
Plug 'mattn/emmet-vim'
Plug 'chemzqm/vim-cssfmt'
" Plug 'ap/vim-css-color'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'othree/html5.vim'

"Plug 'LanguageTool'
Plug 'reedes/vim-pencil'
Plug 'vimwiki/vimwiki'

" Markdown Support
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall','branch':'main'}
Plug 'gabrielelana/vim-markdown'

" Git Support
Plug 'gregsexton/gitv'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'jreybert/vimagit'
Plug 'pwntester/octo.nvim'
" Plug 'jaxbot/github-issues.vim'

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
Plug 'sdiehl/vim-ormolu'
Plug 'luc-tielen/telescope_hoogle'
Plug 'monkoose/fzf-hoogle.vim'
" Plug 'Twinside/vim-haskellFold'
" Plug 'enomsg/vim-haskellConcealPlus'
" Plug 'calebsmith/vim-lambdify'

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
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'sbdchd/neoformat'

" Python Support
Plug 'psf/black', { 'branch': 'stable' }

" TypeScript Support
Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim'

" Ruby Support
" Plug 'tpope/vim-rails'
" Plug 'vim-ruby/vim-ruby'
" Plug 'sovetnik/vim-hanami'

" Go Support
" Plug 'fatih/vim-go'
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

" Nix Support
Plug 'LnL7/vim-nix'

" Theme / Interface
Plug 'cocopon/iceberg.vim'
Plug 'gkeep/iceberg-dark'
Plug 'folke/tokyonight.nvim'

" Tmux
" Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'tmux-plugins/vim-tmux'
" Plug 'tpope/vim-obsession'
" Plug 'wellle/tmux-complete.vim

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Discord presence
Plug 'ObserverOfTime/discord.nvim', {'do': ':UpdateRemotePlugins'}
" Plug 'andweeb/presence.nvim'

call plug#end()
