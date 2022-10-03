local status_ok, tokyo_night = pcall(require, "tokyonight")
if not status_ok then
  vim.notify("colorscheme toykonight is not found!")
  return
end

vim.cmd('colorscheme tokyonight')

-- vim.cmd('let g:tokyonight_italic_functions = 1')
-- vim.cmd('let g:tokyonight_italic_variables = 1')
-- vim.cmd('let g:spacegray_underline_search = 1')
-- vim.cmd('let g:spacegray_italicize_comments = 1')
tokyo_night.setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  sidebars = { "qf", "help", "vista_kind", "terminal", "packer"},
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = true, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors)
  -- example how to change hint color
  --   colors.hint = colors.orange
  --   colors.error = "#ff0000"
  end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  -- example to make telescope borderless
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end
 })

-- Current avaialbe themes: day, storm, moon and night
-- NOTE: set colorscheme based on time
vim.cmd([[
  if strftime("%H") >= 5 && strftime("%H") < 18
    colorscheme tokyonight-day
  else
    colorscheme tokyonight-storm
  endif
]])
