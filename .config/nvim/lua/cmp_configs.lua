local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local lspkind = require('lspkind')

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    -- WARNING: lspkind not working currently
    -- format = lspkind.cmp_format({
    --   with_text = false, -- do not show text alongside icons
    --   maxwidth = 100, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    --   -- The function below will be called before any actual modifications from lspkind
    --   -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
    --   before = function (entry, vim_item)
    --     -- Kind icons
    --     vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
    --     -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
    --     vim_item.menu = ({
    --       nvim_lsp = "[LSP]",
    --       luasnip = "[Snippet]",
    --       buffer = "[Buffer]",
    --       path = "[Path]",
    --       latex_symbols = "[LaTeX]",
    --       spell = "[Spell]",
    --       treesitter = "[Treesitter]",
    --       clac = "[Clac]",
    --       emoji = "[Emoji]",
    --       nvim_lua = "[Lua]",
    --       tags = "[Tags]",
    --     })[entry.source.name]
    --     return vim_item
    --   end
    -- })
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
        latex_symbols = "[LaTeX]",
        spell = "[Spell]",
        treesitter = "[Treesitter]",
        clac = "[Clac]",
        emoji = "[Emoji]",
        nvim_lua = "[Lua]",
        tags = "[Tags]",
        neorg = "[Neorg]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = "luasnip" },
    { name = 'nvim_lsp_document_symbol' },
    { name = "latex_symbols" },
    { name = "buffer" },
    { name = "path" },
    { name = 'treesitter' },
    { name = 'calc' },
    { name = 'emoji' },
    { name = 'spell' },
    { name = 'nvim_lua' },
    { name = 'tags' },
    { name = 'neorg' },
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    }
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
}

require'cmp'.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
})
require'cmp'.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})
