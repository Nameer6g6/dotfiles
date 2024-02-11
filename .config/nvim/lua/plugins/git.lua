return {
  {
    "tpope/vim-fugitive",
  },
  {
    "TimUntersberger/neogit",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {

        add = { hl = "GitSignsAdd", text = "追", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "変", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "削", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },

        topdelete = { hl = "GitSignsDelete", text = "削", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "交", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,

      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win

        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {

      "nvim-lua/plenary.nvim",
    },
  },
  {
    "sindrets/diffview.nvim",
  },
  {
    "akinsho/git-conflict.nvim",
    opts = {
      default_mappings = false, -- disable buffer local mapping created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = "DiffText",
        current = "DiffAdd",
      },
    },
  },
  {
    "ruifm/gitlinker.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    -- BUG: configuration is not working
    -- opts = {
    --   opts = {
    --     remote = nil, -- force the use of a specific remote
    --     -- adds current line nr in the url for normal mode
    --     add_current_line_on_normal_mode = true,
    --     -- callback for what to do with the url
    --     action_callback = require("gitlinker.actions").copy_to_clipboard,
    --     -- print the url after performing the action
    --     print_url = true,
    --   },
    --   callbacks = {
    --     ["github.com"] = require("gitlinker.hosts").get_github_type_url,
    --     ["gitlab.com"] = require("gitlinker.hosts").get_gitlab_type_url,
    --     ["try.gitea.io"] = require("gitlinker.hosts").get_gitea_type_url,
    --     ["codeberg.org"] = require("gitlinker.hosts").get_gitea_type_url,
    --     ["bitbucket.org"] = require("gitlinker.hosts").get_bitbucket_type_url,
    --     ["try.gogs.io"] = require("gitlinker.hosts").get_gogs_type_url,
    --     ["git.sr.ht"] = require("gitlinker.hosts").get_srht_type_url,
    --     ["git.launchpad.net"] = require("gitlinker.hosts").get_launchpad_type_url,
    --     ["repo.or.cz"] = require("gitlinker.hosts").get_repoorcz_type_url,
    --     ["git.kernel.org"] = require("gitlinker.hosts").get_cgit_type_url,
    --     ["git.savannah.gnu.org"] = require("gitlinker.hosts").get_cgit_type_url,
    --   },
    --   -- default mapping to call url generation with action_callback
    --   mappings = "<leader>gy",
    -- },
  },
}
