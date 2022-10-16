local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', "<space>e", vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', "[d", vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', "]d", vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', "<space>q", vim.diagnostic.setloclist, bufopts)
  vim.keymap.set('n', "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
  vim.keymap.set('n', "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', "<space>f", function() vim.lsp.buf.format { async = true } end, bufopts)
  -- WARNING: Check if those deprecated
  -- vim.keymap.set('n', "<Space>wW", vim.lsp.buf.workspace_symbol(), bufopts)
  -- vim.keymap.set('n', "<Space>ww", vim.lsp.buf.document_symbol(), bufopts)
  -- vim.keymap.set('n', "<Space>w=", vim.lsp.buf.formatting_sync(nil, 100), bufopts)

end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end
  on_attach(client, bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
