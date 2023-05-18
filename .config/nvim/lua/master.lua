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

local is_linux = has "linux"
local is_wsl = has "wsl"
local is_soydows = has "win32" or has "win64"

if is_soydows then
  require "os/windows"
elseif is_wsl then
  require "os/wsl"
elseif is_linux then
  require "os/linux"
end
