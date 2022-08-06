-- require "neorg_configs.icons"

local neorg_ok, neorg = pcall(require, "neorg")
if not neorg_ok then
  return
end

neorg.setup {
  -- Tell Neorg what modules to load
  load = {
    ["core.neorgcmd"] = {},
    ["core.ui"] = {},
    ["core.norg.qol.toc"] = {},
    ["core.presenter"] = {},
    ["core.highlights"] = {},
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.concealer"] = {
      config = {
        -- markup_preset = "dimmed", -- Options are: safe, dimmed, and brave
        -- dim_code_blocks = true,
        conceal = true,
        preset = "diamond",
        -- icon = require("neorg_configs.icons") -- BUG: doesn't allow to load module
      }
    }, -- Allows for use of icons
    -- BUG: telescope module is not working
    -- ["core.integrations.telescope"] = {}, -- Enable the telescope module
    ["core.keybinds"] = { -- Configure core.keybinds
      config = {
        default_keybinds = true, -- Generate the default keybinds
        neorg_leader = "<Leader>o" -- This is the default if unspecified
      }
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
      config = {
        workspaces = {
          my_workspace = "~/Documents/Neorg/",
          gtd = "~/Documents/Neorg/gtd",
        },
        autochdir = true, -- Automatically change the directory to the current workspace's root every time
        index = "index.norg", -- The name of the main (root) .norg file
        last_workspace = vim.fn.stdpath("cache") .. "/neorg_last_workspace.txt" -- The location to write and read the workspace cache file
      }
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "gtd",
        default_lists = {
          inbox = "inbox.norg",
        },
        exclude = {"example.norg"},
        syntax = {
          context = "#contexts",
          start = "#time.start",
          due = "#time.due",
          waiting = "#waiting.for",
        },
        projects = {
          show_completed_projects = false,
          show_projects_without_tasks = false,
        },
        custom_tag_completion = true,
      },
    },
    -- ["core.gtd.ui"] = {},
    -- ["core.gtd.queries"] = {},
    ["core.norg.journal"] = {
      config = { -- Note that this table is optional and doesn't need to be provided
        workspace = "my_workspace",
        journal_folder = "Journal",
        use_folders = true,
      }
}
  },
  highlight = { enable = true, },
}

--- Loads the Neorg completion module
local function load_completion()
    neorg.modules.load_module("core.norg.completion", nil, {
        engine = "nvim-cmp" -- Choose your completion engine here
    })
end
-- If Neorg is loaded already then don't hesitate and load the completion
if neorg.is_loaded() then
    load_completion()
else -- Otherwise wait until Neorg gets started and load the completion module then
    neorg.callbacks.on_event("core.started", load_completion)
end

local neorg_callbacks = require("neorg.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { "<C-s>", "core.integrations.telescope.find_linkable" },
        },

        i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}
