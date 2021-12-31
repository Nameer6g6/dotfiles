require "plugins"
require "utils"
require "status_line"
require "telescope"
require "lsp"
require "langs"


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

-- NOTE: orgmode configs
-- require('orgmode').setup({
--   org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
--   org_default_notes_file = '~/Dropbox/org/refile.org',
-- })

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

-- " Setting for TagBar
-- " nnoremap <leader>tj :TagbarOpen j<CR>
-- nnoremap <silent><expr> <Leader>tj bufname() =~# '.Tagbar.' ? "\<C-w>\<C-p>" : ":TagbarOpen j<CR>"
-- hi TagbarKind term=bold ctermfg=Green
-- hi TagbarNestedKind ctermfg=126
-- hi TagbarScope term=bold ctermfg=208
-- hi TagbarType ctermfg=28
-- hi TagbarSignature ctermfg=21
