require "plugins"
require "utils"
require "notify_configs"
require "dap_configs"
require "neorg_configs"
require "git"
require "tags"
require "cmp_configs"
require "telescope"
require "lsp"
require "langs"
require "status_line"
require "nvim_tree"
require "treesitter"
require "keymap"
require "comment"

vim.cmd([[
match ExtraBeginingLine /\%^\n\+$/
" FIXME: empty trailing lines are not highlighted
" match ExtraEndingLine /^\n\+\%$/
match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraEndingLine ctermbg=red guibg=red
highlight ExtraBeginingLine ctermbg=red guibg=red
]])

--
-- Config for calendar.vim
-- vim.cmd([[
-- let g:calendar_google_calendar = 1
-- let g:calendar_google_task = 1
-- source ~/.cache/calendar.vim/credentials.vim
-- ]])
