local options = {
  -- :help options
  backup = false,                          -- creates a backup file
  -- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  -- conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  -- pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  --softtabstop = 2,
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                             -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  list = true,
  -- Enable folding with treesitter
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- listchars = 'tab:\·\ ,trail:.,extends:#,nbsp:.', -- Note: old vim option
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:append("tabs:\.") -- BUG: Check why not working
vim.opt.listchars:append("trail:.")
vim.opt.listchars:append("extends:#")
vim.opt.listchars:append("nbsp:.")

vim.opt.shortmess:append "c"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- Automate line numbers
vim.cmd "autocmd InsertEnter * silent! setlocal norelativenumber"
vim.cmd "autocmd InsertLeave * silent! setlocal relativenumber"

-- NerdComment configs
vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1
vim.g.NERDDefaultAlign = 'left'

-- Automatically deletes all trailing whitespace and newlines at end of file on save.
vim.cmd([[
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritepre * %s/\n\+\%$//e
]])

-- Find file with `find`
-- vim.cmd('set path+=**')
-- vim.cmd('set wildmenu')
-- vim.opt.list = true
-- vim.opt.shiftwidth = indent
-- let g:rehash256 = 1
-- vim.opt.encoding = 'UTF-8'
-- vim.cmd('noswapfile')
-- vim.cmd('set numberwidth=1')
-- vim.cmd('set ruler')
-- vim.cmd('syntax enable')

--  FIX: need checking
-- set hidden
-- set nobackup
-- set nowritebackup
-- set updatetime=300
-- set shortmess+=c
-- set cmdheight=2
-- set signcolumn=yes

-- " To make git_prompt_info works
--  set ff=unix
--  set cursorline
--  set laststatus=2
--  set showtabline=2
