require "plugins"
require "remap"
require "set"

-- Required by nvim tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_linux = has "Linux"
local is_soydows = has "win32"

if is_soydows then
  require "windows"
end
if is_linux then
  require "linux"
end
