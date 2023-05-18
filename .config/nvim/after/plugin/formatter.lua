-- vim.api.nvim_exec([[
--   augroup FormatAutogroup
--     autocmd!
--     autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
--   augroup END
--   ]], true)
-- vim.cmd [[
--   let g:neoformat_try_node_exe = 1
--   " Haskell
--   let g:neoformat_enabled_haskell = ['ormolu']
--   let g:ormolu_ghc_opt=["TypeApplications", "RankNTypes"]
--
--   " PureScript
--   let g:neoformat_enabled_purescript = ['purstidy']
--   let g:shfmt_opt="-ci"
--   augroup fmt
--     autocmd!
--     autocmd BufWritePre * undojoin | Neoformat
--   augroup END
-- ]]