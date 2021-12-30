local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer didn't work.")
  return
end

-- Have packer use a popup window
-- packer.init {
--   display = {
--     open_fn = function()
--       -- return require("packer.util").split { border = "rounded" }
--     end,
--   },
-- }

-- return packer.startup(function(use)
--   -- My plugins here
--   use "wbthomason/packer.nvim" -- Have packer manage itself
--   use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
--   use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
--
--   -- Automatically set up your configuration after cloning packer.nvim
--   -- Put this at the end after all plugins
--   if PACKER_BOOTSTRAP then
--     require("packer").sync()
--   end
-- end)


-- Install your plugins here
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Utility
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'tpope/vim-surround'
  use 'mhinz/vim-startify'
  use 'ryanoasis/vim-devicons'
require "telescope"
  use 'junegunn/limelight.vim'
  use 'junegunn/goyo.vim'
  -- use 'kovetskiy/sxhkd-vim' -- sxhkd is X hotkey daemon
  use 'christoomey/vim-sort-motion'
  -- use 'soywod/vim-keepeye'
  -- use 'itchyny/calendar.vim'
  use 'dstein64/vim-startuptime'

  -- File bar
  -- use 'romgrk/barbar.nvim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- Status bar
  use {'glepnir/galaxyline.nvim' , branch= 'main' }
  use 'kyazdani42/nvim-web-devicons'   -- lua

  -- Debugger plugin
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'

  -- Commenting out plugin
  use 'scrooloose/nerdcommenter'

  -- Generic Programming Support
  use 'majutsushi/tagbar'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'mbbill/undotree'
  use 'chr4/nginx.vim'
  use 'sbdchd/neoformat'
  use 'vmchale/dhall-vim'
  use 'SmiteshP/nvim-gps'
  use 'mhartington/formatter.nvim'

  -- Neovim
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'numtostr/FTerm.nvim'
  use 'windwp/nvim-spectre'
  use 'folke/todo-comments.nvim'
  use 'windwp/nvim-autopairs'
  use 'tversteeg/registers.nvim'
  use 'nacro90/numb.nvim'

  -- use 'glepnir/dashboard-nvim'

  -- Frontend Support
  use 'mattn/emmet-vim'
  use 'AndrewRadev/tagalong.vim'
  -- use 'chemzqm/vim-cssfmt'
  use 'ap/vim-css-color'
  use 'cakebaker/scss-syntax.vim'
  use 'othree/html5.vim'
  use 'AndrewRadev/tagalong.vim'

  --use 'LanguageTool'
  -- use 'reedes/vim-pencil'

  -- Markdown Support
  use {'iamcco/markdown-preview.nvim', ft = "markdown", run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use {'npxbr/glow.nvim', ft = "markdown", run = ':GlowInstall', branch = 'main'}
  use {'gabrielelana/vim-markdown', ft = "markdown"}

  -- Git Support
  use 'gregsexton/gitv'
  -- use 'mhinz/vim-signify'
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'rbong/vim-flog'
  use 'jreybert/vimagit'
  use 'pwntester/octo.nvim'
  -- use 'jaxbot/github-issues.vim'

  -- Erlang Support
  use 'vim-erlang/vim-erlang-tags'
  -- use 'vim-erlang/vim-erlang-runtime'
  -- use 'vim-erlang/vim-erlang-compiler'

  -- Elixir Support
  -- use 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
  use {'slashmili/alchemist.vim', ft = {"elixir", "eelixir"}}
  use {'BjRo/vim-extest', ft = {"elixir", "eelixir"}}
  use {'avdgaag/vim-phoenix', ft = {"elixir", "eelixir"}}
  use {'elixir-lang/vim-elixir', ft = {"elixir", "eelixir"}}
  use {'frost/vim-eh-docs', ft = {"elixir", "eelixir"}}
  use {'jadercorrea/elixir_generator.vim', ft = {"elixir", "eelixir"}}
  use {'mattreduce/vim-mix', ft = {"elixir", "eelixir"}}
  use {'mhinz/vim-mix-format', ft = {"elixir", "eelixir"}}
  use {'mmorearty/elixir-ctags', ft = {"elixir", "eelixir"}}
  use {'tpope/vim-endwise', ft = {"elixir", "eelixir"}}

  -- Haskell Support
  -- use {'neovimhaskell/haskell-vim', ft = 'haskell'}
  use {'sdiehl/vim-ormolu', ft = 'haskell'}
  use {'monkoose/fzf-hoogle.vim', ft = 'haskell'}
  -- use 'luc-tielen/telescope_hoogle'
  -- use 'Twinside/vim-haskellFold'
  -- use 'enomsg/vim-haskellConcealPlus'
  -- use 'calebsmith/vim-lambdify'

  -- PureScript Support
  use {'purescript-contrib/purescript-vim', ft = "purescript"}
  -- use 'frigoeu/psc-ide-vim'
  -- use 'sriharshachilakapati/vimmer-ps'

  -- Fsharp Support
  use {'lucasteles/fsi.vim', ft = "fsharp"}
  use {'yatli/fvim', ft = "fsharp"}

  -- Crystal Support
  -- use 'rhysd/vim-crystal'

  -- Rust Support
  use {'rust-lang/rust.vim', ft = "rust"}

  -- Vim Support
  use {'junegunn/vader.vim', ft = "vim"}

  -- Javascript Support
  -- use 'pangloss/vim-javascript'
  -- use 'mxw/vim-jsx'
  -- use 'yardnsm/vim-import-cost', { 'do': 'npm install' }
  -- use 'styled-components/vim-styled-components', { 'branch': 'main' }
  -- use 'maxmellon/vim-jsx-pretty'
  -- use 'prettier/vim-prettier', { 'do': 'yarn install' }
  -- use 'sbdchd/neoformat'

  -- Python Support
  -- use {'psf/black', branch = 'stable' }

  -- TypeScript Support
  -- use 'leafgarland/typescript-vim'
  -- use 'HerringtonDarkholme/yats.vim'

  -- Ruby Support
  -- use 'tpope/vim-rails'
  -- use 'vim-ruby/vim-ruby'
  -- use 'sovetnik/vim-hanami'

  -- Go Support
  use {'fatih/vim-go', opt = true, ft = "go"}
  -- use 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugins/gocode/nvim/symlink.sh' }

  -- Elm Support
  -- use 'lambdatoast/elm.vim'
  -- use 'ElmCast/elm-vim'

  -- Dart & Flutter  Support
  use {'dart-lang/dart-vim-plugin', opt = true, ft = "dart"}
  use {'thosakwe/vim-flutter', opt = true, ft = "dart"}
  use {'reisub0/hot-reload.vim', opt = true, ft = "dart"}

  -- C# & .Net Support
  -- use 'OmniSharp/omnisharp-vim'
  use {'OrangeT/vim-csharp', ft = "sc"}

  -- Nix Support
  use {'LnL7/vim-nix', ft = "nix"}

  -- Databases Support
  use 'lifepillar/pgsql.vim'

  -- latex
  use {'lervag/vimtex',  ft = 'tex' }
  use {'xuhdev/vim-latex-live-preview', ft = 'tex' }

  -- Theme / Interface
  use 'folke/tokyonight.nvim'

  -- Tmux
  -- use 'tmux-plugins/vim-tmux-focus-events'
  -- use 'tmux-plugins/vim-tmux'
  -- use 'tpope/vim-obsession'
  -- use 'wellle/tmux-complete.vim

  -- Completion
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'nvim-lua/lsp_extensions.nvim'

  -- Key mapping
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }


  -- Completion
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lua'
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "quangnguyen30192/cmp-nvim-tags"
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'ray-x/cmp-treesitter'
  use 'p00f/nvim-ts-rainbow'
  use 'kdheepak/cmp-latex-symbols'
  use 'hrsh7th/cmp-calc'
  use 'hrsh7th/cmp-emoji'
  use {'f3fora/cmp-spell', opt = true, ft = {'markdown', 'text'}}
  use 'onsails/lspkind-nvim'


  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  -- use 'honza/vim-snippets'

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }


  -- Discord presence
  -- use {'ObserverOfTime/discord.nvim', run = ':UpdateRemoteuseins'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
