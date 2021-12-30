local lspconfig = require 'lspconfig'

local on_attach = require("lsp.handlers").on_attach
local capabilities = require("lsp.handlers").capabilities

lspconfig.purescriptls.setup {
         on_attach = on_attach,
         capabilities = capabilities,
}

