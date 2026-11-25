return {
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Gedit", "GBrowse", "Gclog", "Gllog" },
  },
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    opts = {},
  },
  {
    "f-person/git-blame.nvim",
    cmd = {
      "GitBlameToggle",
      "GitBlameEnable",
      "GitBlameDisable",
      "GitBlameOpenCommitURL",
      "GitBlameCopyCommitURL",
      "GitBlameOpenFileURL",
      "GitBlameCopyFileURL",
      "GitBlameCopySHA",
    },
    config = function()
      require("gitblame").setup({
        --Note how the `gitblame_` prefix is omitted in `setup`
        enabled = false,
        message_when_not_committed = "Oh please, commit this !",
        -- display_virtual_text = 0
        -- ignored_filetypes = ['lua', 'c']
        -- delay = 1000 --  default is 250
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<Space>g]", "<Cmd>Gitsigns nav_hunk next<CR>", desc = "Next hunk" },
      { "<Space>g[", "<Cmd>Gitsigns nav_hunk prev<CR>", desc = "Prev hunk" },
      { "<Space>gd", "<Cmd>Gitsigns diffthis<CR>" },
      { "<Space>ga", "<Cmd>Gitsigns stage_hunk<CR>", desc = "Stage/unstage hunk" },
      -- stage_hunk toggles now (undo_stage_hunk is deprecated)
      { "<Space>gu", "<Cmd>Gitsigns stage_hunk<CR>", desc = "Stage/unstage hunk" },
      { "<Space>gr", "<Cmd>Gitsigns reset_hunk<CR>" },
      { "<Space>gs", "<Cmd>Gitsigns select_hunk<CR>" },
      { "<Space>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>" },
    },
    opts = {
      signs = {
        add = { text = "追" },
        change = { text = "変" },
        delete = { text = "削" },
        topdelete = { text = "除" },
        changedelete = { text = "交" },
        untracked = { text = "無" },
      },
      signs_staged = {
        add = { text = "追" },
        change = { text = "変" },
        delete = { text = "削" },
        topdelete = { text = "除" },
        changedelete = { text = "交" },
        untracked = { text = "無" },
      },
      -- signs = {
      --
      --   add = { hl = "GitSignsAdd", text = "追", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      --   change = { hl = "GitSignsChange", text = "変", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      --   delete = { hl = "GitSignsDelete", text = "削", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      --
      --   topdelete = { hl = "GitSignsDelete", text = "削", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      --   changedelete = { hl = "GitSignsChange", text = "交", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      -- },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        -- interval = 1000,
        follow_files = true,
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,  -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      -- yadm = {
      --   enable = false,
      -- },
    },
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR 'ibhagwan/fzf-lua',
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
  },
  {
    "akinsho/git-conflict.nvim",
    event = "BufReadPre",
    opts = {
      -- co/ct/cb/c0 and ]x/[x, mapped only in buffers that have conflicts
      -- (global maps would break ct, cb and c0 in every file)
      default_mappings = true,
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      highlights = {               -- They must have background color, otherwise the default color will be used
        incoming = "DiffText",
        current = "DiffAdd",
      },
    },
  },

  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
      { "<Space>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<Space>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link in browser" },
    },
  },
}
