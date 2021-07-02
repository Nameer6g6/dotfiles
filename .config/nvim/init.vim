set nocompatible


source $HOME/.config/nvim/plugins.vim

filetype plugin indent on

let g:rehash256 = 1
set encoding=UTF-8
set mouse=a
set expandtab
set smarttab
set tabstop=3
set shiftwidth=3
set list
set listchars=tab:\·\ ,trail:.,extends:#,nbsp:.

set noswapfile
set nu
set numberwidth=1
set splitbelow
set splitright
set wrap
set ruler
syntax enable

" Find file with `find`
set path+=**
set wildmenu

" Create ctag tags file
command! MakeTags !ctags -R .
command! MakeHaskellTags !hasktags --ctags .

set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set cmdheight=2

set signcolumn=yes


" nnoremap &lt;leader&gt;t :call &lt;SID&gt;show_documentation()&lt;CR&gt;

" To make git_prompt_info works
 set ff=unix
 set cursorline
 set laststatus=2
 set showtabline=2

 if (has("termguicolors"))
    set termguicolors
 endif

" If Nord
"colorscheme nord
"let g:nord_cursor_line_number_background = 1

" colorscheme OceanicNext
" colorscheme iceberg

" let g:tokyonight_style = "day"
let g:tokyonight_italic_functions = 1
let g:tokyonight_italic_variables = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
colorscheme tokyonight

let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

"let g:tmuxcomplete#trigger = 'completefunc'
"let g:tmuxcomplete#trigger = ''

let g:ale_completion_enabled = 1

"let g:syntastic_vim_checkers = ['vint']

" Auto Cost Import
" augroup import_cost_auto_run
"    autocmd!
"    autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx ImportCost autocmd BufEnter *.js,*.jsx,*.ts,*.tsx ImportCost
"    autocmd CursorHold *.js,*.jsx,*.ts,*.tsx ImportCost
" augroup END

" autocmd QuickFixCmdPost *grep* cwindow

let g:ale_linters = {
   \ 'cs': ['OmniSharp'],
   \ }

" let g:ale_fixers = {
" \   'javascript': ['prettier'],
" \   'css': ['prettier'],
" \}

let g:ale_fixers = {}

" Specifing ale to use only OmniSharp
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_fix_on_save = 0

if has('ruby') == 1
   let g:ale_linters.ruby = ['standardrb']
   let g:ale_fixers = {'ruby': ['standardrb']}
   let g:ale_fix_on_save = 1
" elseif has('python') == 1
   " let g:ale_linters.ruby = ['pycodestyle']
   " let g:ale_fixers = {'python': ['pycodestyle']}
   " let g:ale_fix_on_save = 1
endif

if executable('standardrb') == 1
   "let call map(g:ale_linters, {'ruby': ['standardrb']})
   let g:ale_linters.ruby = ['standardrb']
   let g:ale_fixers = {'ruby': ['standardrb']}
   let g:ale_fix_on_save = 1
endif

" Automate line numbers
autocmd InsertEnter * silent! setlocal norelativenumber
autocmd InsertLeave * silent! setlocal relativenumber

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType ruby setlocal omnifunc=syntaxcompelete#Complete
" autocmd FileType elixir setlocal omnifunc=syntaxcompelete#Complete

""""""""""""
" TagBar
""""""""""""
"let g:tmuxcomplete#asyncomplete_source_options = {
"            \ 'name':      'tmuxcomplete',
"            \ 'whitelist': ['*'],
"            \ 'config': {
"            \     'splitmode':      'words',
"            \     'filter_prefix':   1,
"            \     'show_incomplete': 1,
"            \     'sort_candidates': 0,
"            \     'scrollback':      0,
"            \     'truncate':        0
"            \     }
"            \ }

" NerdComment configs
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" Fix for FloatTerm leaves empty window with Startify
autocmd User Startified setlocal buflisted

" Coc
source $HOME/.config/nvim/coc.vim

" C#/Omnisharp
source $HOME/.config/nvim/csharp.vim

" Elixir
source $HOME/.config/nvim/elixir.vim

" Haskell
source $HOME/.config/nvim/haskell.vim

" PureScript
source $HOME/.config/nvim/purescript.vim

" Limelight & Goyo
source $HOME/.config/nvim/limelight_goyo.vim

" Other languages
source $HOME/.config/nvim/langs.vim

" statusline
" source $HOME/.config/nvim/evilline.vim
source $HOME/.config/nvim/statusline.vim

" Barbar
" source $HOME/.config/nvim/barbar.vim

" NerdTree
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>


" let g:python3_host_skip_check = 1
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

" Fold
" Handling created fold blocks to be presisted
augroup remember_folds
   autocmd!
    " au BufWinLeave ?* mkview 1
    " au BufWinEnter ?* silent loadview 1
   autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
   autocmd BufWinEnter ?* silent! loadview
augroup END

" autocmd BufWinLeave ?* mkview 1 | filetype detect
" autocmd BufWinEnter ?* silent loadview 1 | filetype detect

set foldcolumn=2
hi Folded guifg=LightRed
hi FoldColumn guifg=LightRed
set viewoptions=folds,cursor
" set sessionoptions=folds,blank,buffers,curdir,folds,help,options,tabpages,winsize
set sessionoptions=folds,options,tabpages
" hi Folded ctermfg=216

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" Testing Section
nnoremap <leader>FF :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
   " if &foldcolumn
   " if foldclosed() == 0
   "    setlocal foldcolumn=0
   " else
   "    setlocal foldcolumn=4
   " endif
      " echom &foldcolumn
   " foldclosed({lnum})
   " echom iflnum
endfunction

" function CheckIfFileExists(filename)
"   if filereadable(a:filename)
"     return 1
"   endif
"
"   return 0
" endfunction

hi diffAdded   ctermfg=green
hi diffRemoved ctermfg=red

"Setting for TagBar
" nnoremap <leader>tj :TagbarOpen j<CR>
nnoremap <silent><expr> <Leader>tj bufname() =~# '.Tagbar.' ? "\<C-w>\<C-p>" : ":TagbarOpen j<CR>"
hi TagbarKind term=bold ctermfg=Green
hi TagbarNestedKind ctermfg=126
hi TagbarScope term=bold ctermfg=208
hi TagbarType ctermfg=28
hi TagbarSignature ctermfg=21


" This section handle change terminal background
" color that remain aroud the borders
" function GetCurrentBG()
"     return fnameescape(synIDattr(hlID("normal"), "bg"))
" endfunction
"
" let g:shell_pid = substitute(system('ps -oppid= -p `ps -oppid= $$`'), '\n\| ', '', 'g')
"
" function WriteEscapeSequence(seq)
"     let shell_fd = '/proc/' . g:shell_pid . '/fd/0'
"     let command = '!printf "' . a:seq . '\007" >' . shell_fd
"     exe command
" endfunction
"
" augroup theme
"    au!
"    " Change terminal bg according to theme bg
"    autocmd VimEnter * silent! :call WriteEscapeSequence("\e]11;" . GetCurrentBG())
"    autocmd VimLeave * silent! :call WriteEscapeSequence("\e]46;" . fnameescape(g:terminal_bg))
"    autocmd ColorScheme * silent! :call WriteEscapeSequence("\e]11;" . GetCurrentBG())
" augroup END

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" mapping
nnoremap <Leader>rg :Grep<space>
" function to process fzf select
function! ProcessRgFzf(line)
    " line = FILE : COL : ROW : WORD
    let l:info = split(a:line, ":")
    execute "edit " .. l:info[0]
    call cursor(l:info[1], l:info[2])
    call feedkeys("*``", "n")
endfunction
" the command
command! -bang -nargs=* Grep
  \ call fzf#vim#grep(
  \   'rg -o -p --column --no-heading -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'sink': function('ProcessRgFzf')}), <bang>0)



" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
nnoremap <leader>fF <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fG <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fB <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fN <cmd>lua require('telescope.builtin').help_tags()<cr>


lua << EOF
local telescope = require('telescope')
telescope.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = { horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
telescope.load_extension('hoogle')
EOF


lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript", "python" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF


" Dashboard
let g:dashboard_default_executive ='fzf.vim'

" DAP
lua << EOF
   local dap = require('dap')
   dap.adapters.python = {
      type = 'executable';
      -- command = 'path/to/virtualenvs/debugpy/bin/python';
      command = 'python';
      args = { '-m', 'debugpy.adapter' };
   }
   vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
   vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})
EOF
nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <S-k> :lua require'dap'.step_out()<CR>
nnoremap <S-l> :lua require'dap'.step_into()<CR>
nnoremap <S-j> :lua require'dap'.step_over()<CR>
nnoremap <leader>dn :lua require'dap'.continue()<CR>
nnoremap <leader>d_ :lua require'dap'.run_last()<CR>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
nnoremap <leader>di :lua require'dap.ui.variables'.hover(function () return vim.fn.expand("<cexpr>") end)<CR>
vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
" nnoremap <leader>da :lua require'debugHelper'.attach()<CR>

" theHamsta/nvim-dap-virtual-text and mfussenegger/nvim-dap
" let g:dap_virtual_text = v:true


" Exiting Terminal mode remapping
:tnoremap <C-\><C-\> <C-\><C-n>


" Show Discord Presence
nnoremap <leader>qq :DiscordUpdatePresence<CR>
" nnoremap <leader>qq :lua Presence:update()<CR>

" Discord
" lua << EOF
" Presence = require("presence"):setup({
"     -- This config table shows all available config options with their default values
"     auto_update       = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua Presence:update()`)
"     editing_text      = "Editing %s",               -- Editing format string (either string or function(filename: string|nil, buffer: string): string)
"     workspace_text    = "Working on %s",            -- Workspace format string (either string or function(git_project_name: string|nil, buffer: string): string)
"     neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
"     main_image        = "file",                     -- Main image display (either "neovim" or "file")
"     -- client_id         = "793271441293967371",       -- Use your own Discord application client id (not recommended)
"     log_level         = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
"     debounce_timeout  = 5,                         -- Number of seconds to debounce TextChanged events (or calls to `:lua Presence:update(<buf>, true)`)
" })
" EOF


" Keep Eye
let g:keepeye_features = ['bell', 'notification', 'statusline']
" let g:keepeye_features = ['bell', 'notification']
let g:keepeye_autostart = 1
let g:keepeye_timer = 900
let g:keepeye_message = 'SAVE YOUR EYES, DRINK WATER, TAKE A BREAK'


" Navigator.nvim settings
lua << EOF
require('Navigator').setup({
    auto_save = 'current',
    disable_on_zoom = true
})

-- Keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', "<A-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
map('n', "<A-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
map('n', "<A-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
map('n', "<A-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
map('n', "<A-p>", "<CMD>lua require('Navigator').previous()<CR>", opts)
EOF

" let g:nvim_tree_side = 'right' "left by default
" let g:nvim_tree_width = 40 "30 by default
" let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
" let g:nvim_tree_gitignore = 1 "0 by default
" let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
" let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
" let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
" let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
" let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
" let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
" let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
" let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
" let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
" let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
" let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
" let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
" let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
" let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
" let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
" let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
" let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
" let g:nvim_tree_show_icons = {
"     \ 'git': 1,
"     \ 'folders': 0,
"     \ 'files': 0,
"     \ }
" "If 0, do not show the icons for one of 'git' 'folder' and 'files'
" "1 by default, notice that if 'files' is 1, it will only display
" "if nvim-web-devicons is installed and on your runtimepath
"
" " default will show icon by default if no icon is provided
" " default shows no icon by default
" let g:nvim_tree_icons = {
"     \ 'default': '',
"     \ 'symlink': '',
"     \ 'git': {
"     \   'unstaged': "✗",
"     \   'staged': "✓",
"     \   'unmerged': "",
"     \   'renamed': "➜",
"     \   'untracked': "★",
"     \   'deleted': "",
"     \   'ignored': "◌"
"     \   },
"     \ 'folder': {
"     \   'default': "",
"     \   'open': "",
"     \   'empty': "",
"     \   'empty_open': "",
"     \   'symlink': "",
"     \   'symlink_open': "",
"     \   },
"     \   'lsp': {
"     \     'hint': "",
"     \     'info': "",
"     \     'warning': "",
"     \     'error': "",
"     \   }
"     \ }
"
" nnoremap <C-n> :NvimTreeToggle<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
" " NvimTreeOpen and NvimTreeClose are also available if you need them
"
" set termguicolors " this variable must be enabled for colors to be applied properly
"
" " a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=blue


hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap


lua  << EOF
  if hl and end_row >= line then
      a.nvim_buf_set_extmark(buf, ns, start_row, start_col,
      { end_line = end_row, end_col = end_col,
      hl_group = hl,
      ephemeral = true,
    })
    else
      return
    end
EOF

" Setting fsharp files type manually
au BufRead,BufNewFile *.fs		set filetype=fsharp
