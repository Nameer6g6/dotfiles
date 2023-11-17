-- Utilities for creating configurations

local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    javascript = {
      function(parser)
        if not parser then
          return {
            exe = "prettier",
            args = {
              "--stdin-filepath",
              util.escape_path(util.get_current_buffer_file_path()),
            },
            stdin = true,
            try_node_modules = true,
          }
        end

        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--parser",
            parser,
          },
          stdin = true,
          try_node_modules = true,
        }
      end,
    },
    json = {
      function(parser)
        if not parser then
          return {
            exe = "prettier",
            args = {
              "--stdin-filepath",
              util.escape_path(util.get_current_buffer_file_path()),
            },
            stdin = true,
            try_node_modules = true,
          }
        end

        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--parser",
            parser,
          },
          stdin = true,
          try_node_modules = true,
        }
      end,
    },
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    -- lua = {
    --   -- "formatter.filetypes.lua" defines default configurations for the
    --   -- "lua" filetype
    --   require("formatter.filetypes.lua").stylua,
    --
    --   -- You can also define your own configuration
    --   function()
    --     -- Supports conditional formatting
    --     if util.get_current_buffer_file_name() == "special.lua" then
    --       return nil
    --     end
    --
    --     -- Full specification of configurations is down below and in Vim help
    --     -- files
    --     return {
    --       exe = "stylua",
    --       args = {
    --         "--search-parent-directories",
    --         "--stdin-filepath",
    --         util.escape_path(util.get_current_buffer_file_path()),
    --         "--",
    --         "-",
    --       },
    --       stdin = true,
    --     }
    --   end,
    -- },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}

---- vim.api.nvim_exec([[
--   augroup FormatAutogroup
--     autocmd!
--     autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
--   augroup END
--   ]], true)
-- vim.cmd [[
--   let g:neoformat_try_node_exe = 1
--   " Haskell
--   let g:neoformat_enabled_haskell = ['ormolu']
--   let g:ormolu_ghc_opt=["TypeApplications", "RankNTypes"]
--
--   " PureScript
--   let g:neoformat_enabled_purescript = ['purstidy']
--   let g:shfmt_opt="-ci"
--   augroup fmt
--     autocmd!
--     autocmd BufWritePre * undojoin | Neoformat
--   augroup END
-- ]]
-- Utilities for creating configurations
-- local util = require "formatter.util"
--
-- -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
-- require("formatter").setup {
--     -- Enable or disable logging
--     logging = true,
--     -- Set the log level
--     log_level = vim.log.levels.WARN,
--     -- All formatter configurations are opt-in
--     filetype = {
--         -- Formatter configurations for filetype "lua" go here
--         -- and will be executed in order
--         lua = {
--             -- "formatter.filetypes.lua" defines default configurations for the
--             -- "lua" filetype
--             require("formatter.filetypes.lua").stylua,
--
--             -- You can also define your own configuration
--             function()
--               -- Supports conditional formatting
--               if util.get_current_buffer_file_name() == "special.lua" then
--                 return nil
--               end
--
--               -- Full specification of configurations is down below and in Vim help
--               -- files
--               return {
--                   exe = "stylua",
--                   args = {
--                       "--search-parent-directories",
--                       "--stdin-filepath",
--                       util.escape_path(util.get_current_buffer_file_path()),
--                       "--",
--                       "-",
--                   },
--                   stdin = true,
--               }
--             end,
--         },
--
--         -- Use the special "*" filetype for defining formatter configurations on
--         -- any filetype
--         ["*"] = {
--             -- "formatter.filetypes.any" defines default configurations for any
--             -- filetype
--             require("formatter.filetypes.any").remove_trailing_whitespace,
--         },
--     },
-- }
--

