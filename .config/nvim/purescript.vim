" PureScript "
""""""""""""""
nm <buffer> <silent> <leader>pL  :Plist<CR>
nm <buffer> <silent> <leader>pl  :Pload!<CR>
nm <buffer> <silent> <leader>pr  :Prebuild!<CR>
nm <buffer> <silent> <leader>pf  :PaddClause<CR>
nm <buffer> <silent> <leader>pt  :PaddType<CR>
nm <buffer> <silent> <leader>pa  :Papply<CR>
nm <buffer> <silent> <leader>pA  :Papply!<CR>
nm <buffer> <silent> <leader>pC  :Pcase!<CR>
nm <buffer> <silent> <leader>pi  :Pimport<CR>
nm <buffer> <silent> <leader>pqa :PaddImportQualifications<CR>
nm <buffer> <silent> <leader>pg  :Pgoto<CR>
nm <buffer> <silent> <leader>pp  :Pursuit<CR>
nm <buffer> <silent> <leader>pT  :Ptype<CR>
let g:psc_ide_log_level = 3

command! -nargs=0  OrganizeImports :call CocAction('runCommand', 'editor.action.organizeImport')
nmap  <leader>o  :OrganizeImports<cr>
