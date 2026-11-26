return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- options for vim.diagnostic.config()
      ---@type vim.diagnostic.Opts
      diagnostics = {
        underline = true,
        update_in_insert = false,
        -- virtual_lines = true,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
          },
        },
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = true,
      },
      -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the code lenses.
      codelens = {
        enabled = false,
      },
      -- Enable lsp cursor word highlighting
      document_highlight = {
        enabled = true,
      },
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        -- From the dotfiles flake (nix profile), not Mason
        pyright = { mason = false },
        nil_ls = { mason = false },
        -- C# is Roslyn (roslyn.nvim below): much faster on big solutions
        omnisharp = { enabled = false },
        vtsls = { mason = false },
        -- The dotnet extra also sets up F#, which isn't used
        fsautocomplete = { enabled = false },
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          ---@type LazyKeysSpec[]
          -- keys = {},
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Replace",
              },
              doc = {
                privateName = { "^_" },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
            },
          },
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(lang)
        return lang ~= "fsharp"
      end, opts.ensure_installed)
    end,
  },
  {
    -- C#: Microsoft's Roslyn language server (what VS Code uses), from Mason.
    -- Opens the nearest .sln/.csproj; :Roslyn target switches solutions
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    opts = {
      filewatching = "roslyn",
      lock_target = true, -- keep the chosen solution for the session
      -- A project in several solutions: take the one with the most projects,
      -- so references cover the whole codebase, not one small service
      choose_target = function(targets)
        local function count(sln)
          local n = 0
          for line in io.lines(sln) do
            if line:match("^Project%(") or line:match("<Project ") then
              n = n + 1
            end
          end
          return n
        end
        table.sort(targets, function(a, b)
          return count(a) > count(b)
        end)
        return targets[1]
      end,
    },
    init = function()
      -- A leftover "X - Backup.csproj" next to the real one gets picked as the
      -- file's project; it's in no solution, so nothing loads properly. Patched
      -- here, before the plugin starts its first client (this loads it early)
      local discovery = require("roslyn.sln.discovery")
      local find_project = discovery.find_project
      discovery.find_project = function(bufnr)
        local found = vim.fs.find(function(name)
          return name:match("%.csproj$") and not name:lower():match("backup")
        end, { upward = true, path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)), limit = 1 })
        return found[1] or find_project(bufnr)
      end
      -- Roslyn itself runs on .NET 10 (the dotfiles flake's), even inside a
      -- project's `nix develop` shell whose `dotnet` is older
      local dotnet = vim.fn.expand("~/.nix-profile/bin/dotnet")
      if vim.fn.executable(dotnet) == 0 then
        dotnet = "dotnet"
      end
      vim.lsp.config("roslyn", {
        cmd = {
          dotnet,
          vim.fn.stdpath("data") .. "/mason/packages/roslyn/libexec/roslyn-language-server.dll",
          "--logLevel=Information",
          "--extensionLogDirectory=" .. vim.fs.joinpath(vim.fn.stdpath("log"), "roslyn"),
          "--stdio",
        },
        settings = {
          -- Diagnostics only for open files: whole-solution analysis keeps a
          -- big solution busy; find references still searches everything
          ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "openFiles",
            dotnet_compiler_diagnostics_scope = "openFiles",
          },
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            dotnet_enable_inlay_hints_for_parameters = true,
          },
          ["csharp|completion"] = {
            dotnet_show_completion_items_from_unimported_namespaces = true,
          },
        },
      })
    end,
  },
  {
    -- "N reference(s)" as virtual text after functions, methods, classes...
    -- :ReferencerToggle hides it, :ReferencerUpdate refreshes
    "romus204/referencer.nvim",
    event = "LspAttach",
    opts = {
      enable = true,
      format = "  %d ref",
      show_no_reference = true,
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    keys = {
      --   -- -- Floating terminal
      { mode = { "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>" },

      -- LSP finder - Find the symbol's definition
      --  If there is no definition, it will instead be hidden
      --  When you use an action in finder like "open vsplit",
      --  you can use <C-t> to jump back
      { "gh", "<cmd>Lspsaga finder<CR>" },

      -- Code action
      { mode = { "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>" },

      { mode = { "n", "v" }, "<leader>k", "<cmd>Lspsaga signature_help<CR>" },

      -- Keep standard `gr` for references from LazyVim, expose rename on leader.
      { "<leader>cr", "<cmd>Lspsaga rename<CR>" },

      -- Peek definition
      -- You can edit the file containing the definition in the floating window
      -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
      -- It also supports tagstack
      -- Use <C-t> to jump back
      { "gp", "<cmd>Lspsaga peek_definition<CR>" },

      -- WARN: Check if this valid
      -- { "gv", "<cmd>Lspsaga preview_definition<CR>"},

      -- Go to definition
      { "gd", "<cmd>Lspsaga goto_definition<CR>" },

      -- Peek type definition
      -- You can edit the file containing the type definition in the floating window
      -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
      -- It also supports tagstack
      -- Use <C-t> to jump back
      { "gT", "<cmd>Lspsaga peek_type_definition<CR>" },

      -- Go to type definition
      -- { "gt", "<cmd>Lspsaga goto_type_definition<CR>" },

      -- Show line diagnostics
      -- You can pass argument ++unfocus to
      -- unfocus the show_line_diagnostics floating window
      { "<space>sl", "<cmd>Lspsaga show_line_diagnostics<CR>" },

      -- Show buffer diagnostics
      { "<space>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>" },

      -- Show workspace diagnostics
      { "<space>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>" },

      -- Show cursor diagnostics
      { "<space>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
      { "<space>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>" },

      -- Diagnostic jump
      -- You can use <C-o> to jump back to your previous location
      { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
      { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>" },

      -- Diagnostic jump with filters such as only jumping to an error
      {
        "[E",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
      },
      {
        "]E",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
      },

      -- Toggle outline
      { "<leader>o", "<cmd>Lspsaga outline<CR>" },

      -- Hover Doc
      -- If there is no hover doc,
      -- there will be a notification stating that
      -- there is no information available.
      -- To disable it just use ":Lspsaga hover_doc ++quiet"
      -- Pressing the key twice will enter the hover window
      { "K", "<cmd>Lspsaga hover_doc<CR>" },

      -- If you want to keep the hover window in the top right hand corner,
      -- you can pass the ++keep argument
      -- Note that if you use hover with ++keep, pressing this key again will
      -- close the hover window. If you want to jump to the hover window
      -- you should use the wincmd command "<C-w>w"
      -- { "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

      -- Call hierarchy
      { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>" },
      { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>" },
    },
  },
}
