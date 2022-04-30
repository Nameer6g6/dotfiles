require "plugins"
require "notify_configs"
require "dap_configs"
require "neorg_configs"
require "utils"
require "cmp_configs"
require "telescope"
require "lsp"
require "langs"
require "status_line"
-- require "nvim_tree"
require "treesitter"
require "keymap"

-- NOTE: Config for calendar.vim
vim.cmd([[
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
source ~/.cache/calendar.vim/credentials.vim
]])

-- Limelight & Goyo
-- vim.cmd('source $HOME/.config/nvim/limelight_goyo.vim')

-- WhichKey
-- local wk = require("which-key")
-- wk.register(mappings, opts)
