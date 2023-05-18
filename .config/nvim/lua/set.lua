vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true

vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent

vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.backspace = "start,eol,indent"

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")
vim.opt.ignorecase = false

vim.opt.inccommand = "split"

vim.opt.updatetime = 50

-- Highlights
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.wildoptions = "pum" -- display autocomplete vertically?
vim.opt.pumblend = 5

-- vim.opt.colorcolumn = "80"
