return {
  {
    "monkoose/fzf-hoogle.vim",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  },
  {
    "Twinside/vim-haskellFold",
    enabled = false,
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  },
  {
    "enomsg/vim-haskellConcealPlus",
    enabled = false,
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  },
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3", -- Recommended
    -- ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    ft = { "haskell", "lhaskell" },
    lazy = true,
    config = function()
      local ht = require("haskell-tools")

      local group = vim.api.nvim_create_augroup("haskell-tools-keymaps", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = { "haskell", "lhaskell" },
        callback = function(event)
          local opts = { noremap = true, silent = true, buffer = event.buf }

          -- haskell-language-server relies heavily on codeLenses,
          -- so auto-refresh (see advanced configuration) is enabled by default
          vim.keymap.set("n", "<space>cl", vim.lsp.codelens.run, opts)
          -- Hoogle search for the type signature of the definition under the cursor
          vim.keymap.set("n", "<space>hs", ht.hoogle.hoogle_signature, opts)
          -- Evaluate all code snippets
          vim.keymap.set("n", "<space>ea", ht.lsp.buf_eval_all, opts)
          -- Toggle a GHCi repl for the current package
          vim.keymap.set("n", "<leader>rr", ht.repl.toggle, opts)
          -- Toggle a GHCi repl for the current buffer
          vim.keymap.set("n", "<leader>rf", function()
            ht.repl.toggle(vim.api.nvim_buf_get_name(event.buf))
          end, opts)
          vim.keymap.set("n", "<leader>rq", ht.repl.quit, opts)
        end,
      })
    end,
  },
}
