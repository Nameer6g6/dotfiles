local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "追", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" }, -- short for 追加
    change = { hl = "GitSignsChange", text = "変", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" }, -- short for 変更
    delete = { hl = "GitSignsDelete", text = "削", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" }, -- short for 削除
    topdelete = { hl = "GitSignsDelete", text = "削", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" }, -- short for 削除
    changedelete = { hl = "GitSignsChange", text = "交", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" }, -- short for 交換
  },
  -- signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
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
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
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
}
