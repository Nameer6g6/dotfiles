require('plugins')
require('lsp')

-- vim.cmd('set nocompatible')

-- let g:rehash256 = 1
vim.opt.encoding = 'UTF-8'
vim.opt.mouse = 'a'
vim.opt.expandtab = true
vim.opt.smarttab = true
local indent = 3
vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.softtabstop = indent
vim.opt.list = true

vim.cmd('noswapfile')
vim.cmd('set nu')
vim.cmd('set numberwidth=1')
vim.cmd('set splitbelow')
vim.cmd('set splitright')
vim.cmd('set wrap')
vim.cmd('set ruler')
vim.cmd('syntax enable')

-- Find file with `find`
vim.cmd('set path+=**')
vim.cmd('set wildmenu')

-- NOTE: colorscheme
vim.cmd('let g:tokyonight_italic_functions = 1')
vim.cmd('let g:tokyonight_italic_variables = 1')
vim.cmd('let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]')
vim.cmd('colorscheme tokyonight')
vim.cmd('let g:spacegray_underline_search = 1')
vim.cmd('let g:spacegray_italicize_comments = 1')
-- let g:tokyonight_style = "day"


-- NOTE: treesitter configs
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ensure_installed = {'org'}, -- Or run :TSUpdate org
  -- ignore_install = { "javascript", "python" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    --disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    --additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  indent= {
     enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

-- Enable folding with treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

--  FIX: need working
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

-- Example keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

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


-- statusline
-- source $HOME/.config/nvim/evilline.vim
require('statusline')


-- WARNING: need working
-- vim.g.ale_fix_on_save = true
-- vim.g.ale_fixers = {}
-- if has('ruby') == 1
--    let g:ale_linters.ruby = ['standardrb']
--    let g:ale_fixers = {'ruby': ['standardrb']}
--    let g:ale_fix_on_save = 1
-- " elseif has('python') == 1
--    " let g:ale_linters.ruby = ['pycodestyle']
--    " let g:ale_fixers = {'python': ['pycodestyle']}
--    " let g:ale_fix_on_save = 1
-- endif
--
-- if executable('standardrb') == 1
--    "let call map(g:ale_linters, {'ruby': ['standardrb']})
--    let g:ale_linters.ruby = ['standardrb']
--    let g:ale_fixers = {'ruby': ['standardrb']}
--    let g:ale_fix_on_save = 1
-- endif

-- conigs in vim
vim.cmd('source $HOME/.config/nvim/utils.vim')

-- Coc
-- vim.cmd('source $HOME/.config/nvim/coc.vim')

-- C#/Omnisharp
-- vim.cmd('source $HOME/.config/nvim/csharp.vim')

-- Elixir
-- vim.cmd('source $HOME/.config/nvim/elixir.vim')

-- Haskell
-- vim.cmd('source $HOME/.config/nvim/haskell.vim')

-- PureScript
-- vim.cmd('source $HOME/.config/nvim/purescript.vim')

-- Limelight & Goyo
-- vim.cmd('source $HOME/.config/nvim/limelight_goyo.vim')

-- Other languages
-- vim.cmd('source $HOME/.config/nvim/langs.vim')


-- NOTE: Navigator.nvim settings
require('Navigator').setup({
    auto_save = 'current',
    disable_on_zoom = true
})

-- Keybindings
--local map = vim.api.nvim_set_keymap
--local opts = { noremap = true, silent = true }

-- NOTE: Navigator config
require('Navigator').setup({
    auto_save = 'current',
    disable_on_zoom = true
})

map('n', "<A-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
map('n', "<A-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
map('n', "<A-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
map('n', "<A-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
map('n', "<A-p>", "<CMD>lua require('Navigator').previous()<CR>", opts)

-- NvimTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)

-- WhichKey
-- local wk = require("which-key")
-- wk.register(mappings, opts)

-- Disable arrow movement, resize splits instead.
vim.api.nvim_set_keymap('n', '<Up>', ':resize +2<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Down>', ':resize -2<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Right>', ':vertical resize -2<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Left>', ':vertical resize +2<CR>', { noremap = true, silent = true})
-- nnoremap <Up>    :resize +2<CR>
-- nnoremap <Down>  :resize -2<CR>
-- nnoremap <Right> :vertical resize -2<CR>
-- nnoremap <Left>  :vertical resize +2<CR>
