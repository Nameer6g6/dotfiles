-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name local keymap = vim.api.nvim_set_keymap

-- vim.g.mapleader = " "

function keymapper(mode, shortcut, command, opt)
  opt = opt or {}
  vim.keymap.set(mode, shortcut, command, opt)
end

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)

-- FTerm
keymapper("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
keymapper("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymapper("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd "so"
end)

-- NvimTree
keymapper("n", "<C-o>", ":NvimTreeToggle<CR>", opts)
keymapper("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
keymapper("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)

local builtin = require "telescope.builtin"
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", function()
  builtin.grep_string { search = vim.fn.input "Grep > " }
end)

-- Do not yank with x
keymapper("n", "x", '"_x')

-- Increment/Decrement
keymapper("n", "+", "<C-a>")
keymapper("n", "-", "<C-x>")

-- Delete word backword
-- keymapper("n", "dw", 'vb"_d')

-- Select all
keymapper("n", "<C-a>", "gg<S-v>G", opts)

-- New tab
keymapper("n", "te", ":tabedit<CR>", opts)

-- Split window
keymapper("n", "ss", ":split<Return><C-w>w", opts)
keymapper("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Resize windows
keymapper("n", "<left>", "<C-w><", opts)
keymapper("n", "<right>", "<C-w>>", opts)
keymapper("n", "<up>", "<C-w>+", opts)
keymapper("n", "<down>", "<C-w>-", opts)

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

-- print(vim.fn.has "Linux")
