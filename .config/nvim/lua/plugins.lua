local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Utility
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	use 'tpope/vim-surround'
	use 'mhinz/vim-startify'
	use 'ryanoasis/vim-devicons'
	-- use 'KabbAmine/zeavim.vim'
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
	-- use 'Kethku/neovide'
	-- use 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemoteuseins' }

	-- Commenting out plugin
	use 'scrooloose/nerdcommenter'

	-- Generic Programming Support
	use 'majutsushi/tagbar'
	use 'Townk/vim-autoclose'
	-- Load on a combination of conditions: specific filetypes or commands
	-- Also run code after load (see the "config" key)
	use {
		'w0rp/ale',
		ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
		cmd = 'ALEEnable',
		config = 'vim.cmd[[ALEEnable]]'
	}

	use 'honza/vim-snippets'
	use 'mbbill/undotree'
	use 'chr4/nginx.vim'
	use 'sbdchd/neoformat'
	use 'vmchale/dhall-vim'

	-- Neovim useins
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'wbthomason/packer.nvim'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'numToStr/Navigator.nvim'
	--use { 'numtostr/FTerm.nvim', config = function() require'FTerm'.setup() end }
	use 'numtostr/FTerm.nvim'
	use 'windwp/nvim-spectre'
	use 'folke/todo-comments.nvim'
	-- use 'kyazdani42/nvim-tree.lua'

	-- use 'glepnir/dashboard-nvim'

	-- Frontend Support
	use 'mattn/emmet-vim'
	use 'AndrewRadev/tagalong.vim'
	-- use 'chemzqm/vim-cssfmt'
	use 'ap/vim-css-color'
	use 'cakebaker/scss-syntax.vim'
	use 'othree/html5.vim'

	--use 'LanguageTool'
	-- use 'reedes/vim-pencil'
	-- use 'vimwiki/vimwiki'

	-- Markdown Support
	use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
	use {'npxbr/glow.nvim', run = ':GlowInstall', branch = 'main'}
	use 'gabrielelana/vim-markdown'

	-- Git Support
	use 'gregsexton/gitv'
	use 'mhinz/vim-signify'
	use 'tpope/vim-fugitive'
	use 'rbong/vim-flog'
	use 'jreybert/vimagit'
	use 'pwntester/octo.nvim'
	-- use 'jaxbot/github-issues.vim'

	-- PHP Support
	-- use 'phpvim/phpcd.vim'
	-- use 'tobyS/pdv'

	-- Erlang Support
	use 'vim-erlang/vim-erlang-tags'
	-- use 'vim-erlang/vim-erlang-runtime'
	-- use 'vim-erlang/vim-erlang-compiler'

	-- Elixir Support
	-- use 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
	use 'slashmili/alchemist.vim'
	use 'BjRo/vim-extest'
	use 'avdgaag/vim-phoenix'
	use 'elixir-lang/vim-elixir'
	use 'frost/vim-eh-docs'
	use 'jadercorrea/elixir_generator.vim'
	use 'mattreduce/vim-mix'
	use 'mhinz/vim-mix-format'
	use 'mmorearty/elixir-ctags'
	use 'tpope/vim-endwise'

	-- Haskell Support
	use 'neovimhaskell/haskell-vim'
	use 'sdiehl/vim-ormolu'
	-- use 'luc-tielen/telescope_hoogle'
	use 'monkoose/fzf-hoogle.vim'
	-- use 'Twinside/vim-haskellFold'
	-- use 'enomsg/vim-haskellConcealPlus'
	-- use 'calebsmith/vim-lambdify'

	-- PureScript Support
	use 'purescript-contrib/purescript-vim'
	-- use 'frigoeu/psc-ide-vim'
	-- use 'sriharshachilakapati/vimmer-ps'

	-- Fsharp Support
	-- use 'lucasteles/fsi.vim'
	-- use 'yatli/fvim'

	-- Crystal Support
	-- use 'rhysd/vim-crystal'

	-- Rust Support
	-- use 'rust-lang/rust.vim'

	-- Vim Support
	use 'junegunn/vader.vim'

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
	-- use 'fatih/vim-go'
	-- use 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugins/gocode/nvim/symlink.sh' }

	-- Elm Support
	-- use 'lambdatoast/elm.vim'
	-- use 'ElmCast/elm-vim'

	-- Dart & Flutter  Support
	-- use 'dart-lang/dart-vim-plugin'
	-- use 'thosakwe/vim-flutter'
	-- use 'reisub0/hot-reload.vim'

	-- C# & .Net Support
	-- use 'OmniSharp/omnisharp-vim'
	use 'OrangeT/vim-csharp'

	-- Nix Support
	use 'LnL7/vim-nix'

	-- Databases Support
	use 'lifepillar/pgsql.vim'

	-- Theme / Interface
	-- use 'cocopon/iceberg.vim'
	-- use 'gkeep/iceberg-dark'
	use 'folke/tokyonight.nvim'

	-- Tmux
	-- use 'tmux-plugins/vim-tmux-focus-events'
	-- use 'tmux-plugins/vim-tmux'
	-- use 'tpope/vim-obsession'
	-- use 'wellle/tmux-complete.vim

	-- Completion
	-- use {'neoclide/coc.nvim', branch = 'release'}
   use 'neovim/nvim-lspconfig'
   use 'williamboman/nvim-lsp-installer'

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

	-- Discord presence
	-- use {'ObserverOfTime/discord.nvim', run = ':UpdateRemoteuseins'}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end

   -- Completion
   use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
   use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
   use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
   use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
   use 'L3MON4D3/LuaSnip' -- Snippets plugin
   -- use {
   --    "folke/trouble.nvim",
   --    requires = "kyazdani42/nvim-web-devicons",
   --    config = function()
   --       require("trouble").setup {
   --          -- your configuration comes here
   --          -- or leave it empty to use the default settings
   --          -- refer to the configuration section below
   --       }
   --    end
   -- }
end)

-- -- Simple plugins can be specified as strings
-- use '9mm/vim-closer'

-- -- Lazy loading:
-- -- Load on specific commands
-- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

-- -- Load on an autocommand event
-- use {'andymass/vim-matchup', event = 'VimEnter'}


-- -- Plugins can have dependencies on other plugins
-- use {
--   'haorenW1025/completion-nvim',
--   opt = true,
--   requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
-- }

-- -- Plugins can also depend on rocks from luarocks.org:
-- use {
--   'my/supercoolplugin',
--   rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
-- }

-- -- You can specify rocks in isolation
-- use_rocks 'penlight'
-- use_rocks {'lua-resty-http', 'lpeg'}

-- -- Local plugins can be included
-- use '~/projects/personal/hover.nvim'

-- -- Plugins can have post-install/update hooks

-- -- Post-install/update hook with neovim command
-- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

-- -- Post-install/update hook with call of vimscript function with argument
-- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

-- -- Use specific branch, dependency and run lua file after load
-- use {
--   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
--   requires = {'kyazdani42/nvim-web-devicons'}
-- }

-- -- Use dependency and run lua function after load
-- use {
--   'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
--   config = function() require('gitsigns').setup() end
-- }

-- -- You can specify multiple plugins in a single call
-- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

-- -- You can alias plugin names
-- use {'dracula/vim', as = 'dracula'}
