local lspconfig = require('lspconfig')

local on_attach = require("lsp.handlers").on_attach
local capabilities = require("lsp.handlers").capabilities

lspconfig.hls.setup {
         on_attach = on_attach,
         capabilities = capabilities,
         single_file_support = true,
         settings = {
             haskell = {
                 hlintOn = false,
             }
         }
 }

