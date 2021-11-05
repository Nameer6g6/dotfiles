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

" Exiting Terminal mode remapping
:tnoremap <C-\><C-\> <C-\><C-n>


" Show Discord Presence
nnoremap <leader>qq :DiscordUpdatePresence<CR>
" nnoremap <leader>qq :lua Presence:update()<CR>

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

" set termguicolors " this variable must be enabled for colors to be applied properly
"
" " a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=blue


hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap

" lua  << EOF
"   if hl and end_row >= line then
"       a.nvim_buf_set_extmark(buf, ns, start_row, start_col,
"       { end_line = end_row, end_col = end_col,
"       hl_group = hl,
"       ephemeral = true,
"     })
"     else
"       return
"     end
" EOF
"
" " Setting fsharp files type manually
" au BufRead,BufNewFile *.fs		set filetype=fsharp

" inserting date
nnoremap <leader>td "=strftime("%Y-%m-%d")<CR>P
inoremap <leader>td <C-R>=strftime("%Y-%m-%d")<CR>

lua << EOF
require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9, -- Height of the terminal window
        width = 0.9, -- Width of the terminal window
        -- x = 0.5, -- X axis of the terminal window
        -- y = 0.5, -- Y axis of the terminal window
    },
})

-- Example keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
EOF

nnoremap <leader>S :lua require('spectre').open()<CR>
" search current word
nnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s :lua require('spectre').open_visual()<CR>
" search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" NOTE: Config for calendar
" Calendar.vim integrating with goolge
" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1
" source ~/.cache/calendar.vim/credentials.vim


" NOTE: config for Orgmode
lua << EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})
EOF
