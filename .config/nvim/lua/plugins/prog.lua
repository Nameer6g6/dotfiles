return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua", "fidget.nvim" },
    },
  },
  {
    "krivahtoo/silicon.nvim",
    build = "./install.sh build",
    config = function()
      require("silicon").setup({
        -- put your customization here
        -- Output configuration for the saved image
        output = {
          -- (string) The full path of the file to save to.
          file = "",
          -- (boolean) Whether to copy the image to clipboard instead of saving to file.
          clipboard = true,
          -- (string) Where to save images, defaults to the current directory.
          --  e.g. /home/user/Pictures
          path = ".",
          -- (string) The filename format to use. Can include placeholders for date and time.
          -- https://time-rs.github.io/book/api/format-description.html#components
          format = "silicon_[year][month][day]_[hour][minute][second].png",
        },

        -- Font and theme configuration for the screenshot.
        font = "Fira Code", -- (string) The font and font size to use for the screenshot.
        -- (string) The color theme to use for syntax highlighting.
        -- It can be a theme name or path to a .tmTheme file.
        theme = "Dracula",

        -- Background and shadow configuration for the screenshot
        background = "#eff", -- (string) The background color for the screenshot.
        shadow = {
          blur_radius = 0.0, -- (number) The blur radius for the shadow, set to 0.0 for no shadow.
          offset_x = 0,      -- (number) The horizontal offset for the shadow.
          offset_y = 0,      -- (number) The vertical offset for the shadow.
          color = "#555",    -- (string) The color for the shadow.
        },

        pad_horiz = 100,             -- (number) The horizontal padding.
        pad_vert = 80,               -- (number) The vertical padding.
        line_number = false,         -- (boolean) Whether to show line numbers in the screenshot.
        line_pad = 2,                -- (number) The padding between lines.
        line_offset = 1,             -- (number) The starting line number for the screenshot.
        tab_width = 4,               -- (number) The tab width for the screenshot.
        gobble = false,              -- (boolean) Whether to trim extra indentation.
        highlight_selection = false, -- (boolean) Whether to capture the whole file and highlight selected lines.
        round_corner = true,
        window_controls = true,      -- (boolean) Whether to show window controls (minimize, maximize, close) in the screenshot.
        window_title = nil,          -- (function) A function that returns the window title as a string.

        -- Watermark configuration for the screenshot
        -- watermark = {
        --   text = "Nameer", -- (string) The text to use as the watermark, set to nil to disable.
        --   color = "#222", -- (string) The color for the watermark text.
        --   -- (string) The style for the watermark text, possible values are:
        --   -- 'bold', 'italic', 'bolditalic', or anything else defaults to 'regular'.
        --   style = "bold",
        -- },
      })
    end,
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    build = false,
    dependencies = {
      "luarocks.nvim",
      {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          if not vim.tbl_contains(opts.ensure_installed, "http") then
            table.insert(opts.ensure_installed, "http")
          end
        end,
      },
    },
  },
  {
    "ethanholz/nvim-lastplace",
  },
  {
    "chr4/nginx.vim",
  },
  {
    "dnlhc/glance.nvim",
    config = function()
      require("glance").setup()
    end,
    keys = {
      { "gD", "<CMD>Glance definitions<CR>",      desc = "Glance Definitions" },
      { "gR", "<CMD>Glance references<CR>",       desc = "Glance References" },
      { "gY", "<CMD>Glance type_definitions<CR>", desc = "Glance Type Definitions" },
      { "gM", "<CMD>Glance implementations<CR>",  desc = "Glance Implementations" },
    },
  },
}

-- NOTE: Check later
-- "vmchale/dhall-vim"
-- "mbbill/undotree"
