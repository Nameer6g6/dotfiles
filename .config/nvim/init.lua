require "plugins"
require "notify_configs"
require "dap_configs"
require "neorg_configs"
require "cmp_configs"
require "utils"
require "telescope"
require "lsp"
require "langs"
require "status_line"
-- require "nvim_tree"
require "treesitter"
require "keymap"


-- NOTE: Todo configs
 require("todo-comments").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

-- NOTE: FTerm configs
require'FTerm'.setup {
    border = 'double',
    dimensions  = {
        height = 0.9, -- Height of the terminal window
        width = 0.9, -- Width of the terminal window
        -- x = 0.5, -- X axis of the terminal window
        -- y = 0.5, -- Y axis of the terminal window
    },
}

-- NOTE: Config for calendar
-- Calendar.vim integrating with goolge
-- let g:calendar_google_calendar = 1
-- let g:calendar_google_task = 1
-- source ~/.cache/calendar.vim/credentials.vim

-- Limelight & Goyo
-- vim.cmd('source $HOME/.config/nvim/limelight_goyo.vim')

-- WhichKey
-- local wk = require("which-key")
-- wk.register(mappings, opts)
