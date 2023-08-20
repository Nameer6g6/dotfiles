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

-- Go to tab by number
keymap("n", "<leader>1", "1gt", opts)
keymap("n", "<leader>2", "2gt", opts)
keymap("n", "<leader>3", "3gt", opts)
keymap("n", "<leader>4", "4gt", opts)
keymap("n", "<leader>5", "5gt", opts)
keymap("n", "<leader>6", "6gt", opts)
keymap("n", "<leader>7", "7gt", opts)
keymap("n", "<leader>8", "8gt", opts)
keymap("n", "<leader>9", "9gt", opts)
keymap("n", "<leader>0", ":tablast<CR>", opts)

-- Telescope
local tel_status, telescope = pcall(require, "telescope")
local bui_status, builtin = pcall(require, "telescope.builtin")
if tel_status and bui_status then
  local function telescope_buffer_dir()
    return vim.fn.expand "%:p:h"
  end

  keymap("n", "<leader>ff", builtin.find_files, {})
  keymap("n", "<leader>fg", builtin.live_grep, {})
  keymap("n", "<leader>fb", builtin.buffers, {})
  keymap("n", "<leader>fh", builtin.help_tags, {})
  keymap("n", "<leader>fp", builtin.git_files, {})
  keymap("n", "<leader>fs", function()
    builtin.grep_string { search = vim.fn.input "Grep > " }
  end)
  vim.keymap.set("n", ";f", function()
    builtin.find_files {
      no_ignore = false,
      hidden = true,
    }
  end)
  vim.keymap.set("n", ";r", function()
    builtin.live_grep()
  end)
  vim.keymap.set("n", "\\\\", function()
    builtin.buffers()
  end)
  vim.keymap.set("n", ";t", function()
    builtin.help_tags()
  end)
  vim.keymap.set("n", ";;", function()
    builtin.resume()
  end)
  vim.keymap.set("n", ";e", function()
    builtin.diagnostics()
  end)
  vim.keymap.set("n", "sf", function()
    telescope.extensions.file_browser.file_browser {
      path = "%:p:h",
      cwd = telescope_buffer_dir(),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = true,
      initial_mode = "normal",
      layout_config = { height = 40 },
    }
  end)
end

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

-- Git-Conflict
keymap("n", "co", "<Plug>(git-conflict-ours)", opts)
keymap("n", "ct", "<Plug>(git-conflict-theirs)", opts)
keymap("n", "cb", "<Plug>(git-conflict-both)", opts)
keymap("n", "c0", "<Plug>(git-conflict-none)", opts)
keymap("n", "c]", "<Plug>(git-conflict-prev-conflict)", opts)
keymap("n", "c[", "<Plug>(git-conflict-next-conflict)", opts)

-- inserting date
keymap("n", "<leader>td", '<C-R>=strftime("%Y-%m-%d")', opts)

-- open link
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

-- Exiting Terminal mode remapping
keymap("t", "<C-\\><C-\\>", "<C-\\><C-N>", opts)

-- LSP
-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

keymap({ "n", "v" }, "<C-k>", "<cmd>Lspsaga signature_help<CR>")

-- Rename all occurrences of the hovered word for the entire file
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>")

-- WARN: Check if this valid
-- keymap("n", "gv", "<cmd>Lspsaga preview_definition<CR>")

-- Go to definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gT", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<space>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
keymap("n", "<space>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
keymap("n", "<space>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
keymap("n", "<space>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
keymap("n", "<space>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev { severity = vim.diagnostic.severity.ERROR }
end)
keymap("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next { severity = vim.diagnostic.severity.ERROR }
end)

-- Toggle outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
-- keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
