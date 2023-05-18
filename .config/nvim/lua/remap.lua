-- keymap("n", "<leader>pv", vim.cmd.Ex)

local opts = { noremap = true, silent = true }
local opts_nowait = { noremap = true, silent = true, nowait = true }

-- local term_opts = { silent = true }

-- vim.g.mapleader = " "

-- Shorten function to local keymap
local keymap = vim.keymap.set

-- keymap("n", "<leader>pv", vim.cmd.Ex)
keymap("n", "J", ":m '>+1<CR>gv=gv")

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
keymap("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)

-- FTerm
keymap("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
keymap("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
keymap("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

-- greatest remap ever
keymap("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

keymap({ "n", "v" }, "<leader>d", [["_d]])

keymap("i", "<C-c>", "<Esc>")

keymap("n", "Q", "<nop>")
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap("n", "<leader>f", vim.lsp.buf.format)

keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
keymap("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

keymap("n", "<leader><leader>", function()
  vim.cmd "so"
end)

-- NvimTree
keymap("n", "<C-o>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)

local builtin = require "telescope.builtin"
keymap("n", "<leader>ff", builtin.find_files, {})
keymap("n", "<leader>fg", builtin.live_grep, {})
keymap("n", "<leader>fb", builtin.buffers, {})
keymap("n", "<leader>fh", builtin.help_tags, {})
keymap("n", "<C-p>", builtin.git_files, {})
keymap("n", "<leader>fs", function()
  builtin.grep_string { search = vim.fn.input "Grep > " }
end)

-- Do not yank with x
keymap("n", "x", '"_x')

-- Increment/Decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Delete word backword
-- keymapper("n", "dw", 'vb"_d')

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- New tab
keymap("n", "te", ":tabedit<CR>", opts)

-- Split window
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Resize windows
keymap("n", "<left>", "<C-w><", opts)
keymap("n", "<right>", "<C-w>>", opts)
keymap("n", "<up>", "<C-w>+", opts)
keymap("n", "<down>", "<C-w>-", opts)

-- Copy to clipboard
vim.api.nvim_set_keymap("v", "<space>y", '"+y', opts)
vim.api.nvim_set_keymap("n", "<space>Y", '"+yg_', opts)
vim.api.nvim_set_keymap("n", "<space>y", '"+y', opts)
vim.api.nvim_set_keymap("n", "<space>yy", '"+yy', opts)

-- Paste from clipboard
vim.api.nvim_set_keymap("n", "<space>p", '"+p', opts)
vim.api.nvim_set_keymap("n", "<space>P", '"+P', opts)
vim.api.nvim_set_keymap("v", "<space>p", '"+p', opts)
vim.api.nvim_set_keymap("v", "<space>P", '"+P', opts)

-- NeoWell
keymap("n", "<space>\\", function()
  vim.cmd "NeoWellToggle"
end, opts_nowait)
keymap("n", "<space>/", function()
  vim.cmd "NeoWellAppend"
end, opts_nowait)
-- FIX: bug with NeoWellJump being missing
keymap("n", "<CR>", function()
  -- vim.cmd "NeoZoomToggle" -- remove this if you don't know what it is
  vim.cmd "NeoWellJump"
end, opts_nowait)
keymap("n", "<Leader>r", function()
  vim.cmd "NeoWellEdit"
end, opts_nowait)
keymap("n", "<Leader>d", function()
  vim.cmd "NeoWellOut"
end, opts_nowait)
keymap("n", "<Leader>D", function()
  vim.cmd "NeoWellWipeOut"
end, opts_nowait)

-- Gitsigns
keymap("n", "<Space>g]", "<Cmd>Gitsigns prev_hunk<CR>", opts)
keymap("n", "<Space>g[", "<Cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "<Space>gd", "<Cmd>Gitsigns diffthis<CR>", opts)
keymap("n", "<Space>ga", "<Cmd>Gitsigns stage_hunk<CR>", opts)
keymap("n", "<Space>gu", "<Cmd>Gitsigns undo_stage_hunk<CR>", opts)
keymap("n", "<Space>gr", "<Cmd>Gitsigns reset_hunk<CR>", opts)
keymap("n", "<Space>gs", "<Cmd>Gitsigns select_hunk<CR>", opts)
keymap("n", "<Space>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>", opts)

-- inserting date
keymap("n", "<leader>td", '<C-R>=strftime("%Y-%m-%d")', opts)

-- open link
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

-- Exiting Terminal mode remapping
keymap("t", "<C-\\><C-\\>", "<C-\\><C-N>", opts)
