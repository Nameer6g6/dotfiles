-- Vim-Alchemist Mappings
-- vim.cmd([[
--   autocmd FileType elixir nnoremap <buffer> <leader>h :call alchemist#exdoc()<CR>
--   autocmd FileType elixir nnoremap <buffer> <leader>d :call alchemist#exdef()<CR>
-- ]])

-- Elixir Tagbar Configuration
vim.g.tagbar_type_elixir = {
  ctagstype = 'elixir',
  kinds = {
    'f:functions',
    'functions:functions',
    'c:callbacks',
    'd:delegates',
    'e:exceptions',
    'i:implementations',
    'a:macros',
    'o:operators',
    'm:modules',
    'p:protocols',
    'r:records',
    't:tests',
  }
}

-- vim-mix-format options
-- vim.g.mix_format_options = '--check-equivalent'
-- vim.g.mix_format_on_save = true

-- let g:mix_format_on_save = 1
-- let g:mix_format_options = '--check-equivalent'
