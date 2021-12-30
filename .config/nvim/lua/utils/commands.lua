-- Create ctag tags file
vim.cmd("command! MakeTags !ctags -R .")
vim.cmd("command! MakeHaskellTags !hasktags --ctags .")
