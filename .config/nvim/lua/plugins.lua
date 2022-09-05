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

-- Install your plugins here
packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Utility
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-telescope/telescope-media-files.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
      'numtostr/FTerm.nvim',
      config = function ()
        require'FTerm'.setup {
            border = 'double',
            dimensions  = {
              height = 0.9, -- Height of the terminal window
              width = 0.9, -- Width of the terminal window
              -- x = 0.5, -- X axis of the terminal window
              -- y = 0.5, -- Y axis of the terminal window
            },
          }
      end
    }
    use 'nvim-pack/nvim-spectre'
    use {
      'folke/todo-comments.nvim',
      config = function ()
        require("todo-comments").setup {}
      end
    }
    use 'windwp/nvim-autopairs'
    use 'tversteeg/registers.nvim'
    use 'nacro90/numb.nvim'
    use {
      'haringsrob/nvim_context_vt',
      config = function ()
        require('nvim_context_vt').setup()
      end
    }
  -- use {
  --   'goolord/alpha-nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons' },
  --   config = function ()
  --     require'alpha'.setup(require'alpha.themes.startify'.opts)
  --   end
  -- }
  -- use "glepnir/dashboard-nvim"
  -- use 'romgrk/barbar.nvim'
  use "rcarriga/nvim-notify"
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use "tpope/vim-surround"
  -- use 'mhinz/vim-startify'
  -- use 'kovetskiy/sxhkd-vim' -- sxhkd is X hotkey daemon
  use 'christoomey/vim-sort-motion'
  -- use 'soywod/vim-keepeye'
  use 'itchyny/calendar.vim'
  use {'dstein64/vim-startuptime', opt = true}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }
	-- WARNING: Disabled marks
  -- use 'chentoast/marks.nvim'
  use 'NFrid/due.nvim'
  -- use 'glepnir/dashboard-nvim'

  -- Status bar
  use {'glepnir/galaxyline.nvim' , branch= 'main' }
  use 'kyazdani42/nvim-web-devicons'   -- lua
  use 'SmiteshP/nvim-gps'

  -- Debugger plugin
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use "Pocco81/DAPInstall.nvim"

  -- Commenting out plugin
  use 'scrooloose/nerdcommenter'

  -- Generic Programming Support
  use 'majutsushi/tagbar'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'mbbill/undotree'
  use 'chr4/nginx.vim'
  use 'sbdchd/neoformat'
  use 'vmchale/dhall-vim'
  use 'mhartington/formatter.nvim'
  use 'ethanholz/nvim-lastplace'

  -- Distraction free
  use "folke/zen-mode.nvim"
  use "folke/twilight.nvim"
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'

  -- Frontend Support
  use 'mattn/emmet-vim'
  use 'AndrewRadev/tagalong.vim'
  use 'ap/vim-css-color'
  use 'cakebaker/scss-syntax.vim'
  use 'othree/html5.vim'
  -- use 'chemzqm/vim-cssfmt'

  --use 'LanguageTool'
  -- use 'reedes/vim-pencil'

  -- Markdown Support
  use {'iamcco/markdown-preview.nvim', ft = "markdown", run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use {'npxbr/glow.nvim', ft = {"markdown", "text", "norg"}, run = ':GlowInstall', branch = 'main'}
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
  use {'vim-erlang/vim-erlang-tags', opt = true, ft = "erlang"}
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
  use {'purescript-contrib/purescript-vim', opt = true, ft = "purescript"}
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
  use {
    'ray-x/go.nvim',
    opt = true,
    ft = "go",
    config = function ()
        require("which-key").setup()
    end
  }
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
  use {'jbyuki/nabla.nvim', opt = true, ft = {"markdown", "tex", "norg"}}

  -- Theme / Interface
  use 'folke/tokyonight.nvim'

  -- Tmux
  -- use 'tmux-plugins/vim-tmux-focus-events'
  -- use 'tmux-plugins/vim-tmux'
  -- use 'tpope/vim-obsession'
  -- use 'wellle/tmux-complete.vim

  -- Completion
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use({
    'scalameta/nvim-metals',
    requires = { "nvim-lua/plenary.nvim" },
  })
  use "nvim-lua/lsp_extensions.nvim"
  use "ray-x/lsp_signature.nvim"

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
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'hrsh7th/cmp-calc'
  use 'hrsh7th/cmp-emoji'
  use {'f3fora/cmp-spell', ft = {"markdown", "text", "norg"}}
  use 'onsails/lspkind-nvim'
  use {
    '0styx0/abbreinder.nvim',
    requires = {{'0styx0/abbremand.nvim', module = 'abbremand'}}, -- if want to lazy load
    config = function()
        require'abbreinder'.setup()
    end,
    event = 'BufRead', -- if want lazy load
  }

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
  use 'ObserverOfTime/nvimcord'
  --

  -- Note
  use "nvim-neorg/neorg"
  use "nvim-neorg/neorg-telescope"
  -- use {"nvim-neorg/neorg",
  --   requires = {"nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope"}
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
