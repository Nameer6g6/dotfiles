require "plugins"
require "notify_configs"
require "dap_configs"
require "neorg_configs"
require "utils"
require "cmp_configs"
require "telescope"
require "lsp"
require "langs"
require "status_line"
require "nvim_tree"
require "treesitter"
require "keymap"

-- NOTE: Config for calendar.vim
vim.cmd([[
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
source ~/.cache/calendar.vim/credentials.vim
]])



-- local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
--   vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "scala", "sbt", "java" },
--     callback = function()
--       require("metals").initialize_or_attach({})
--     end,
--     group = nvim_metals_group,
--   })


-- local metals_config = require("metals").bare_config()
--
-- -- Example of settings
-- metals_config.settings = {
--   showImplicitArguments = true,
--   excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
-- }
--
-- -- *READ THIS*
-- -- I *highly* recommend setting statusBarProvider to true, however if you do,
-- -- you *have* to have a setting to display this in your statusline or else
-- -- you'll not see any messages from metals. There is more info in the help
-- -- docs about this
-- metals_config.init_options.statusBarProvider = "on"
--
-- -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- metals_config.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
--
-- -- Limelight & Goyo
-- -- vim.cmd('source $HOME/.config/nvim/limelight_goyo.vim')
--
-- -- WhichKey
-- -- local wk = require("which-key")
-- -- wk.register(mappings, opts)
-- --
-- -- Autocmd that will actually be in charging of starting the whole thing
-- local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
--   -- NOTE: You may or may not want java included here. You will need it if you
--   -- want basic Java support but it may also conflict if you are using
--   -- something like nvim-jdtls which also works on a java filetype autocmd.
--   pattern = { "scala", "sbt", "java" },
--   callback = function()
--     require("metals").initialize_or_attach(metals_config)
--   end,
--   group = nvim_metals_group,
-- })
