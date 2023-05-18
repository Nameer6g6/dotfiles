local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  vim.notify "Error: IndentBlank is not working"
  return
end

vim.cmd [[
  highlight IndentBlanklineIndent1              guifg=#E06C75 gui=nocombine
  " highlight IndentBlanklineIndent2              guifg=#E5C07B gui=nocombine
  " highlight IndentBlanklineIndent3              guifg=#98C379 gui=nocombine
  " highlight IndentBlanklineIndent4              guifg=#56B6C2 gui=nocombine
  " highlight IndentBlanklineIndent5              guifg=#61AFEF gui=nocombine
  " highlight IndentBlanklineIndent6              guifg=#C678DD gui=nocombine
  " highlight IndentBlanklineContextChar          guifg=#00FF00 gui=nocombine
  " highlight IndentBlanklineContextStart         guisp=#00FF00 gui=underline
  " highlight IndentBlanklineChar                 guifg=#00FF00 gui=nocombine
  " highlight IndentBlanklineSpaceChar            guifg=#00FF00 gui=nocombine
  " highlight IndentBlanklineSpaceCharBlankline   guifg=#00FF00 gui=nocombine
]]

indent_blankline.setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = true,
  indent_blankline_show_current_context = true,
  indent_blankline_char_highlight_list = { "Error", "Function" },
  -- indent_blankline_char = 'x',
  indent_blankline_char_list = { "|", "¦", "┆", "┊" },
  -- indent_blankline_space_char_blankline = ' ',
  indent_blankline_use_treesitter = true,
  indent_blankline_indent_level = 4,
  indent_blankline_max_indent_increase = 1,
  indent_blankline_show_first_indent_level = true,
  indent_blankline_show_end_of_line = true,
  indent_blankline_filetype = {},
  indent_blankline_filetype_exclude = { "help" },
  indent_blankline_buftype_exclude = { "terminal" },
  indent_blankline_bufname_exclude = { "README.md", ".*\\.py" },
  indent_blankline_context_char = "┃",
  indent_blankline_context_char_list = { "┃", "║", "╬", "█" },
  indent_blankline_context_highlight_list = { "Error", "Warning" },
  indent_blankline_context_patterns = { "^if", "class", "function", "method" },

  -- char_highlight_list = {
  --   "IndentBlanklineIndent1",
  --   "IndentBlanklineIndent2",
  --   "IndentBlanklineIndent3",
  --   "IndentBlanklineIndent4",
  --   "IndentBlanklineIndent5",
  --   "IndentBlanklineIndent6",
  -- },
}
