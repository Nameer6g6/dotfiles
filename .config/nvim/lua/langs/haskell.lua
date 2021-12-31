-- if executable('ghci')
--    command! -nargs=0 Ghci :vs|term!ghci
-- endif


-- if executable('stack')
--    command! -nargs=0 StackInstall :tabe|term stack install
--    command! -nargs=0 StackInstallWatch :tabe|term stack install --file-watch
-- endif

if vim.fn.executable('lushtags') == true then
  vim.g.tagbar_type_haskell = {
    ctagsbin = 'lushtags',
    ctagsargs = '--ignore-parse-error --',
    kinds = {
      'm:module:0',
      'e:exports:1',
      'i:imports:1',
      't:declarations:0',
      'd:declarations:1',
      'n:declarations:1',
      'f:functions:0',
      'c:constructors:0'
    },
    sro =  '.',
    kind2scope = {
      d = 'data',
      n = 'newtype',
      c = 'constructor',
      t = 'type'
    },
    scope2kind = {
      data = 'd',
      newtype =  'n',
      constructor = 'c',
      type = 't'
    },
  }
end
-- if executable('lushtags')
--        let g:tagbar_type_haskell = {
--                \ 'ctagsbin' : 'lushtags',
--                \ 'ctagsargs' : '--ignore-parse-error --',
--                \ 'kinds' : [
--                    \ 'm:module:0',
--                    \ 'e:exports:1',
--                    \ 'i:imports:1',
--                    \ 't:declarations:0',
--                    \ 'd:declarations:1',
--                    \ 'n:declarations:1',
--                    \ 'f:functions:0',
--                    \ 'c:constructors:0'
--                \ ],
--                \ 'sro' : '.',
--                \ 'kind2scope' : {
--                    \ 'd' : 'data',
--                    \ 'n' : 'newtype',
--                    \ 'c' : 'constructor',
--                    \ 't' : 'type'
--                \ },
--                \ 'scope2kind' : {
--                    \ 'data' : 'd',
--                    \ 'newtype' : 'n',
--                    \ 'constructor' : 'c',
--                    \ 'type' : 't'
--                \ }
--            \ }
--     endif

-- " Haskell conealer
-- " syn on
-- " set conceallevel=0
-- " set concealcursor=nciv
-- " set formatprg=brittany
-- " set formatprg=stylish-haskell
-- " let hscoptions="↱hCcls"
-- " let hscoptions="↱bls"
-- " let hscoptions="⇒⇔rb↱iRw-I"
-- " let hscoptions="↱"

-- " Disable GHC linter if in a Haskell Stack project
-- if (CheckIfFileExists("./stack.yaml") == 1)
--   let g:ale_linters = {
--   \   'haskell': ['stack-build'], " you can include any other linters in this list too
--   \}
-- endif

-- let g:ormolu_command="fourmolu"
vim.g.ormolu_command = "fourmolu"
-- let g:ormolu_options=["-o -XTypeApplications -o -XTemplateHaskell -o -XImportQualifiedPost 2>/dev/null"]
vim.g.ormolu_options = {"-o -XTypeApplications -o -XTemplateHaskell -o -XImportQualifiedPost 2>/dev/null"}
vim.cmd("autocmd BufWritePre *.hs :call RunOrmolu()")

-- let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
-- let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
-- let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
-- let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
-- let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
-- let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
-- let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
