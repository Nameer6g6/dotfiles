return {
  {
    -- <leader>cs is the outline below, not LazyVim's Trouble symbols
    "folke/trouble.nvim",
    keys = { { "<leader>cs", false } },
  },
  {
    -- Symbols sidebar; maintained successor of symbols-outline.nvim (archived,
    -- broken on nvim 0.12)
    "hedyhli/outline.nvim",
    cmd = "Outline",
    keys = { { "<leader>cs", "<cmd>Outline<cr>", desc = "Symbols Outline" } },
    opts = {
      outline_window = { position = "right", width = 50, relative_width = true, auto_close = false },
      preview_window = { auto_preview = false },
      symbol_folding = { auto_unfold = { hovered = true } },
      keymaps = {
        up_and_jump = "<C-p>",
        down_and_jump = "<C-n>",
        close = { "<Esc>", "q" },
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
      },
    },
  },
  {
    "liuchengxu/vista.vim",
    keys = {
      { "<Space>tv", ":Vista<CR>" },
    },
  },
}
