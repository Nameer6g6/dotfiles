local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lsp.lsp_installer")
require("lsp.handlers").setup()
require("lsp.settings.haskell")
require("lsp.settings.purescript")
-- require("lsp.dart")
-- require("lsp.purescript")

-- Lsp extensions
vim.cmd([[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"ChainingHint"}}]])

-- local signs = {Error = "▮", Warning = "▮", Hint = "▯", Information = "▯"}
-- for type, icon in pairs(signs) do
--   local hl = "LspDiagnosticsSign" .. type
--   vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
-- end
