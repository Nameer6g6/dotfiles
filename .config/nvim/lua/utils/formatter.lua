-- vim.api.nvim_exec([[
--   augroup FormatAutogroup
--     autocmd!
--     autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
--   augroup END
--   ]], true)
vim.cmd([[
  let g:neoformat_try_node_exe = 1
  augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END
]])
