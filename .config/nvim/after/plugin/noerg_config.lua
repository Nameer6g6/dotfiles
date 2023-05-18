local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
  vim.notify "Warning: neorg is not working"
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    -- ["core.ui.calendar"] = {},
    -- ["core.summary"] = {},
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/Documents/Neorg/",
          index = "~/Documents/Neorg/gtd/",
          inbox = "~/Documents/Neorg/gtd/inbox.norg",
        },
      },
    },
  },
}
