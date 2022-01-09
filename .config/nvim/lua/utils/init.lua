require("utils.options")
-- require("utils.keymap")
-- require("utils.treesitter")
-- require("utils.cmp")
require("utils.colorscheme")
require("utils.blank_line")
require("utils.commands")
require("utils.auto_pairs")
require("utils.git_signs")
require("utils.numb")
require("utils.formatter")
require("utils.zen_mode")
require("utils.twilight")
require("utils.marks")
require("utils.tagbar")


-- WARNING: need checking
vim.cmd("hi diffAdded   ctermfg=green")
vim.cmd("hi diffRemoved ctermfg=red")


-- WARNING: reserved and need to be worked later
-- Keep Eye
-- let g:keepeye_features = ["bell", "notification", "statusline"]
-- " let g:keepeye_features = ["bell", "notification"]
-- let g:keepeye_autostart = 1
-- let g:keepeye_timer = 900
-- let g:keepeye_message = "SAVE YOUR EYES, DRINK WATER, TAKE A BREAK"

-- Last place config
require"nvim-lastplace".setup {
    -- lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
    -- lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
    -- lastplace_open_folds = true
}

-- Due time config
require("due_nvim").setup {
  prescript = "due: ",           -- prescript to due data
  prescript_hi = "Comment",      -- highlight group of it
  due_hi = "String",             -- highlight group of the data itself
  ft = "*.md",                   -- filename template to apply aucmds :)
  today = "TODAY",               -- text for today"s due
  today_hi = "Character",        -- highlight group of today"s due
  overdue = "OVERDUE",           -- text for overdued
  overdue_hi = "Error",          -- highlight group of overdued
  date_hi = "Conceal",           -- highlight group of date string
  pattern_start = "<",           -- start for a date string pattern
  pattern_end = ">",             -- end for a date string pattern
  use_clock_time = false,        -- allow due.nvim to calculate hours, minutes, and seconds
  default_due_time = "midnight", -- if use_clock_time == true, calculate time until option on specified date.
                                 --   Accepts "midnight", for 23:59:59, or noon, for 12:00:00
}
