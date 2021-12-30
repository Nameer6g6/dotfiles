require('utils.options');
require('utils.keymap');
require('utils.treesitter');
require('utils.cmp');
require('utils.colorscheme');
require('utils.blank_line');
require('utils.commands');


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
