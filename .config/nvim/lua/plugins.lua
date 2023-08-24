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
  vim.notify "packer didn't work."
  return
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Utility
  use "wbthomason/packer.nvim" -- Packer can manage itself
  use "rstacruz/vim-closer" -- Simple plugins can be specified as strings

  -- Lazy loading: Load on specific commands
  use { "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } }
  use { "andymass/vim-matchup", event = "VimEnter" } -- Load on an autocommand event
  use "nvim-lua/plenary.nvim"
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use "nvim-treesitter/playground"
  use "nvim-pack/nvim-spectre"
  use "windwp/nvim-autopairs"
  use "nacro90/numb.nvim"
  use "haringsrob/nvim_context_vt"
  use "rcarriga/nvim-notify"
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use "tpope/vim-surround"
  use "christoomey/vim-sort-motion"
  use "NFrid/due.nvim"
  -- use "ludovicchabant/vim-gutentags"
  use "akinsho/bufferline.nvim"
  use "lukas-reineke/indent-blankline.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "nvim-neorg/neorg-telescope"
  -- use 'luc-tielen/telescope_hoogle'

  -- File explorer
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"

  -- Generic Programming
  use "mbbill/undotree"
  use "chr4/nginx.vim"
  use "sbdchd/neoformat"
  use "vmchale/dhall-vim"
  use "mhartington/formatter.nvim"
  use "ethanholz/nvim-lastplace"

  -- Distraction free
  use "folke/zen-mode.nvim"
  use "Pocco81/true-zen.nvim"
  use "folke/twilight.nvim"
  -- use "junegunn/goyo.vim"
  -- use "junegunn/limelight.vim"

  -- Frontend
  use "mattn/emmet-vim"
  use "AndrewRadev/tagalong.vim"
  use "cakebaker/scss-syntax.vim"
  use "othree/html5.vim"
  use "mechatroner/rainbow_csv"
  -- use "ap/vim-css-color"

  -- Erlang
  use { "vim-erlang/vim-erlang-tags", opt = true, ft = "erlang" }

  -- Elixir
  use { "brendalf/mix.nvim", ft = { "elixir", "eelixir" } }
  -- use 'slashmili/alchemist.vim'
  -- use 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
  -- use {'slashmili/alchemist.vim', ft = {"elixir", "eelixir"}}
  -- use { "BjRo/vim-extest", ft = { "elixir", "eelixir" } }
  -- use { "avdgaag/vim-phoenix", ft = { "elixir", "eelixir" } }
  -- use { "elixir-lang/vim-elixir", ft = { "elixir", "eelixir" } }
  -- use { "frost/vim-eh-docs", ft = { "elixir", "eelixir" } }
  -- use { "jadercorrea/elixir_generator.vim", ft = { "elixir", "eelixir" } }
  -- use { "mattreduce/vim-mix", ft = { "elixir", "eelixir" } }
  -- use { "mhinz/vim-mix-format", ft = { "elixir", "eelixir" } }
  -- use { "mmorearty/elixir-ctags", ft = { "elixir", "eelixir" } }
  -- use { "tpope/vim-endwise", ft = { "elixir", "eelixir" } }

  -- Haskell Support
  -- use {'neovimhaskell/haskell-vim', ft = 'haskell'}
  use { "sdiehl/vim-ormolu", ft = "haskell" }
  use { "monkoose/fzf-hoogle.vim", ft = "haskell" }
  use { "mrcjkb/haskell-tools.nvim" }
  -- use 'Twinside/vim-haskellFold'
  -- use 'enomsg/vim-haskellConcealPlus'

  -- PureScript Support
  use { "purescript-contrib/purescript-vim", opt = true, ft = "purescript" }
  -- use 'frigoeu/psc-ide-vim'
  -- use 'sriharshachilakapati/vimmer-ps'

  -- Rust Support
  use { "rust-lang/rust.vim", ft = "rust" }

  -- Vim Support
  use { "junegunn/vader.vim", ft = "vim" }

  -- Nix Support
  use { "LnL7/vim-nix", ft = "nix" }

  -- Markdown
  use { "iamcco/markdown-preview.nvim", ft = "markdown", run = "cd app && yarn install", cmd = "MarkdownPreview" }
  use { "npxbr/glow.nvim", ft = { "markdown", "text", "norg" }, run = ":GlowInstall", branch = "main" }
  use { "gabrielelana/vim-markdown", ft = "markdown" }

  -- latex
  use { "lervag/vimtex", ft = "tex" }
  use { "xuhdev/vim-latex-live-preview", ft = "tex" }
  use { "jbyuki/nabla.nvim", opt = true, ft = { "markdown", "tex", "norg" } }

  -- Git
  use "tpope/vim-fugitive"
  use "TimUntersberger/neogit"
  use "lewis6991/gitsigns.nvim"
  use {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }
  use "sindrets/diffview.nvim"
  use "akinsho/git-conflict.nvim"
  use { "ruifm/gitlinker.nvim", requires = "nvim-lua/plenary.nvim" }

  -- Commenting plugin
  use "numToStr/Comment.nvim"
  use {
    "danymat/neogen",
    config = function()
      require("neogen").setup {}
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    tag = "*",
  }
  use "folke/todo-comments.nvim"
  use "s1n7ax/nvim-comment-frame"

  -- Theme
  use "tjdevries/colorbuddy.vim"
  use "folke/tokyonight.nvim"
  use "norcalli/nvim-colorizer.lua"
  -- use "overcache/NeoSolarized"
  -- use {
  --   "rose-pine/neovim",
  --   as = "rose-pine",
  --   config = function()
  --     vim.cmd "colorscheme rose-pine"
  --   end,
  -- }

  -- Status bar
  -- use { "glepnir/galaxyline.nvim", branch = "main" }
  use "nvim-lualine/lualine.nvim"
  -- use "kyazdani42/nvim-web-devicons" -- lua
  use "SmiteshP/nvim-gps"

  -- Debugger
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "Pocco81/DAPInstall.nvim"

  -- Lsp
  use { "williamboman/mason.nvim", run = ":MasonUpdate" }
  use "williamboman/mason-lspconfig.nvim"
  use "mfussenegger/nvim-lint"
  use "nvim-lua/lsp_extensions.nvim"
  use "ray-x/lsp_signature.nvim"
  use "onsails/lspkind.nvim"
  use "nvimdev/lspsaga.nvim" -- LSP UI

  -- Completion
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim builtin LSP
  use "hrsh7th/cmp-nvim-lua"
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-buffer" -- buffer words completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "quangnguyen30192/cmp-nvim-tags"
  use "ray-x/cmp-treesitter"
  use "kdheepak/cmp-latex-symbols"
  use "hrsh7th/cmp-nvim-lsp-document-symbol"
  use "hrsh7th/cmp-calc"
  use "hrsh7th/cmp-emoji"
  -- use { "f3fora/cmp-spell", ft = { "markdown", "text", "norg" } }
  use "onsails/lspkind-nvim"
  use {
    "0styx0/abbreinder.nvim",
    requires = { { "0styx0/abbremand.nvim", module = "abbremand" } }, -- if want to lazy load
    config = function()
      require("abbreinder").setup()
    end,
    event = "BufRead", -- if want lazy load
  }

  use "folke/which-key.nvim"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "saadparwaiz1/cmp_luasnip"
  -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Note
  use {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
  }
  use "nyngwang/NeoWell.lua"
  use "stevearc/gkeep.nvim"

  -- Tags
  use "simrat39/symbols-outline.nvim"
  use "liuchengxu/vista.vim"
end)
