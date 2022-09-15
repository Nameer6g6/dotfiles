local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NOTE: Normal mapping
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Lsp extensions
keymap("n", "<leader>T", ":lua require'lsp_extensions'.inlay_hints()<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- FTerm
keymap('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
keymap('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

-- NvimTree
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)

-- Go to tab by number
keymap('n', '<leader>1', '1gt', opts)
keymap('n', '<leader>2', '2gt', opts)
keymap('n', '<leader>3', '3gt', opts)
keymap('n', '<leader>4', '4gt', opts)
keymap('n', '<leader>5', '5gt', opts)
keymap('n', '<leader>6', '6gt', opts)
keymap('n', '<leader>7', '7gt', opts)
keymap('n', '<leader>8', '8gt', opts)
keymap('n', '<leader>9', '9gt', opts)
keymap('n', '<leader>0', ':tablast<CR>', opts)

-- Gitsigns keymaps
keymap('n', '<Space>g]', '<Cmd>Gitsigns prev_hunk<CR>', opts)
keymap('n', '<Space>g[', '<Cmd>Gitsigns next_hunk<CR>', opts)
keymap('n', '<Space>gd', '<Cmd>Gitsigns diffthis<CR>', opts)
keymap('n', '<Space>ga', '<Cmd>Gitsigns stage_hunk<CR>', opts)
keymap('n', '<Space>gu', '<Cmd>Gitsigns undo_stage_hunk<CR>', opts)
keymap('n', '<Space>gr', '<Cmd>Gitsigns reset_hunk<CR>', opts)
keymap('n', '<Space>gs', '<Cmd>Gitsigns select_hunk<CR>', opts)
keymap('n', '<Space>gb', '<Cmd>Gitsigns toggle_current_line_blame<CR>', opts)

-- Git-Conflict keymaps
keymap('n', 'co', '<Plug>(git-conflict-ours)', opts)
keymap('n', 'ct', '<Plug>(git-conflict-theirs)', opts)
keymap('n', 'cb', '<Plug>(git-conflict-both)', opts)
keymap('n', 'c0', '<Plug>(git-conflict-none)', opts)
keymap('n', 'c]', '<Plug>(git-conflict-prev-conflict)', opts)
keymap('n', 'c[', '<Plug>(git-conflict-next-conflict)', opts)

-- Comment Frame keymaps
keymap('n', '<Space>cc', ":lua require('nvim-comment-frame').add_comment()<CR>", opts)
keymap('n', '<Space>C', ":lua require('nvim-comment-frame').add_multiline_comment()<CR>", opts)

-- Clean trailing spaces and lines
keymap('n', "<leader>es", [[<Cmd>%s/\s\+$//e<CR> | <Cmd>%s/\n\+\%$//e<CR>]], opts)

-- inserting date
keymap('n', "<leader>td", "<C-R>=strftime(\"%Y-%m-%d\")", opts)

-- Tagbar
keymap('n', "<F8>", ":TagbarToggle<CR>", opts)
vim.cmd([[
  nnoremap <leader>tj :TagbarOpen j<CR>
  nnoremap <silent><expr> <Leader>tj bufname() =~# '.Tagbar.' ? "\<C-w>\<C-p>" : ":TagbarOpen j<CR>"]])

-- Zen-mode
keymap('n', "<Space>z", ":ZenMode<CR>", opts)

-- BUG: not working
if (vim.bo.filetype == "markdown" or vim.bo.filetype == "tex") then
  keymap('n', "<F5>", ":lua require('nabla').action()<CR>", opts)
  keymap('n', "<leader>p", ":lua require('nabla').popup()<CR> ", opts) -- " Customize with popup({border = ...})  : `single` (default), `double`, `rounded`
end

-- Calendar
keymap('n', '<leader>cal', '<cmd>Calendar<CR>', opts)

-- Dap
keymap('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>', opts)
keymap('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>', opts)
keymap('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>', opts)
keymap('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>', opts)
keymap('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
keymap('n', '<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
keymap('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
keymap('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>', opts)
keymap('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>', opts)

-- open link
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

-- Neorg
keymap('n', '<Space>ngv', ':Neorg gtd views<CR>', opts)
keymap('n', '<Space>nge', ':Neorg gtd edit<CR>', opts)
keymap('n', '<Space>ngc', ':Neorg gtd capture<CR>', opts)
keymap('n', '<Space>nj', ':Neorg journal today<CR>', opts)
keymap('n', '<Space>nt', ':Neorg toc split<CR>', opts)
keymap('n', '<Space>nc', ':Neorg toc close<CR>', opts)


-- NOTE: Insert mapping
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
-- inserting date
-- nnoremap <leader>td "=strftime("%Y-%m-%d")<CR>P
-- inoremap <leader>td <C-R>=strftime("%Y-%m-%d")<CR>
keymap('i', "<leader>td", "<C-R>=strftime(\"%Y-%m-%d\")<CR>", opts)

-- NOTE: Visual mapping
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)


-- NOTE: Visual Block mapping
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- NOTE: Terminal mapping
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Exiting Terminal mode remapping
keymap("t", "<C-\\><C-\\>", "<C-\\><C-N>", term_opts)
--:tnoremap <C-\><C-\> <C-\><C-n>

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)
