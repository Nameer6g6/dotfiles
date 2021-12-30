-- local colorscheme = "default"
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("colorscheme " .. colorscheme .. " not found!")
--   return
-- end

-- vim.cmd [[
-- try
--   colorscheme darkplus
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]

vim.cmd('colorscheme tokyonight')
vim.cmd('let g:tokyonight_italic_functions = 1')
vim.cmd('let g:tokyonight_italic_variables = 1')
vim.cmd('let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]')
vim.cmd('let g:spacegray_underline_search = 1')
vim.cmd('let g:spacegray_italicize_comments = 1')
-- let g:tokyonight_style = "day"
