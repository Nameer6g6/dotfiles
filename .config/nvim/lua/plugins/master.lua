-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "LazyVim/LazyVim",
    version = "*",
  },
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  {
    {
      "junegunn/fzf",
      dir = vim.fn.expand("~/.fzf"),
      enabled = vim.fn.isdirectory(vim.fn.expand("~/.fzf")) == 1,
      build = "./install --all",
    },
  },
  {
    "junegunn/fzf.vim",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- Roslyn (C# language server) is only in this community registry; nixpkgs
      -- builds it from source together with a whole .NET SDK
      opts.registries = { "github:mason-org/mason-registry", "github:Crashdummyy/mason-registry" }
      vim.list_extend(opts.ensure_installed, { "stylua", "shellcheck", "shfmt", "flake8", "roslyn" })
      -- Skip tools already on PATH (e.g. from the dotfiles flake) and F#
      opts.ensure_installed = vim.tbl_filter(function(tool)
        return tool ~= "fantomas" and vim.fn.executable(tool) == 0
      end, opts.ensure_installed)
    end,
  },

  -- Tab completion (supertab), on blink.cmp which LazyVim uses now
  {
    "saghen/blink.cmp",
    opts = { keymap = { preset = "super-tab" } },
  },
  {
    "epwalsh/pomo.nvim",
    version = "*", -- Recommended, use latest release instead of latest commit
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat" },
    dependencies = {
      -- Optional, but highly recommended if you want to use the "Default" timer
      "rcarriga/nvim-notify",
    },
    opts = {
    },
  },
}
