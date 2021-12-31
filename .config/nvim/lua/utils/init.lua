require('utils.options')
require('utils.keymap')
require('utils.treesitter')
require('utils.cmp')
require('utils.colorscheme')
require('utils.blank_line')
require('utils.commands')
require('utils.auto_pairs')
require('utils.git_signs')
require('utils.numb')
require('utils.formatter')
require('utils.zen_mode')
require('utils.twilight')
-- require('utils.nvim_tree');


-- WARNING: need checking
vim.cmd("hi diffAdded   ctermfg=green")
vim.cmd("hi diffRemoved ctermfg=red")


-- WARNING: reserved and need to be worked later
-- Keep Eye
-- let g:keepeye_features = ['bell', 'notification', 'statusline']
-- " let g:keepeye_features = ['bell', 'notification']
-- let g:keepeye_autostart = 1
-- let g:keepeye_timer = 900
-- let g:keepeye_message = 'SAVE YOUR EYES, DRINK WATER, TAKE A BREAK'

require'nvim-lastplace'.setup {
    -- lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
    -- lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
    -- lastplace_open_folds = true
}
