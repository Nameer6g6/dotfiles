require("lsp.dart")
require("lsp.purescript")

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)


local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap("n", "<localleader>w=", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 100)<CR>", opts)
  buf_set_keymap('n', '<localleader>wa', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<localleader>wd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<localleader>wr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<localleader>ww', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', '<localleader>wW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  buf_set_keymap('n', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- --[[ buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts) ]]
  -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  -- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- --[[ buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts) ]]
  -- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  -- --[[ buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts) ]]
  -- buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

local servers = {"hls", "purescriptls", "csharp_ls", "tsserver", "sumneko_lua"}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    single_file_support = true,
    flags = {debounce_text_changes = 150}
  }
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}


--
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
-- 	vim.lsp.diagnostic.on_publish_diagnostics, {
--     virtual_text = false,
-- 		underline = true,
-- 		signs = true,
--     update_in_insert = false
-- 	}
-- )
--
-- local signs = {Error = "▮", Warning = "▮", Hint = "▯", Information = "▯"}
--
-- for type, icon in pairs(signs) do
--   local hl = "LspDiagnosticsSign" .. type
--   vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
-- end



-- rust-tools
-- require('rust-tools').setup {
--     tools = {
--         autoSetHints = false,
--         hover_with_actions = false,
--         runnables = {use_telescope = false},
--         inlay_hints = {
--             parameter_hints_prefix = "» ",
--             other_hints_prefix = "« "
--         },
--         hover_actions = {auto_focus = false}
--     },
--     server = {
--       on_attach = on_attach,
--       flags = {debounce_text_changes = 150}
--     }
-- }

-- trouble
-- require("trouble").setup {
--     height = 7,
--     icons = false,
--     mode = "lsp_workspace_diagnostics",
--     fold_open = "v",
--     fold_closed = ">",
--     auto_open = false,
--     auto_close = true,
--     auto_preview = true,
--     auto_fold = true,
--     use_lsp_diagnostic_signs = true
-- }


-- -- lsp Mappings.
-- local function nkeymap(key, map)
--    keymap('n', key, map, opts)
-- end
--
-- nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
-- nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
-- nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
-- nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
-- nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
-- nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
-- nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
-- nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
-- nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
-- nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
-- nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
--
-- local nvim_lsp = require('lspconfig')
--
-- -- Keybindings
-- local opts = { noremap = true, silent = true }
-- local map = vim.api.nvim_set_keymap
--
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--
--   -- Enable completion triggered by <c-x><c-o>
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
--   buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--   buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
--   buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
--   buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
-- end
--
-- local lspconfig = require('lspconfig')
--
--
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
--     capabilities.textDocument.completion.completionItem.snippetSupport = true
--     capabilities.textDocument.completion.completionItem.resolveSupport = {
--       properties = {
--         'documentation',
--         'detail',
--         'additionalTextEdits',
--    }
-- }
--
-- nvim_lsp.hls.setup {}
--
-- -- lspconfig.hls.setup {
-- --         on_attach = on_attach,
-- --         capabilities = capabilities,
-- --         settings = {
-- --             haskell = {
-- --                 hlintOn = false,
-- --             }
-- --         }
-- -- }
--
--
--
--
-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end
