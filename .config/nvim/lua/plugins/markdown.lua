return {
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && yarn install",
    cmd = "MarkdownPreview",
  },
  {
    "antonk52/markdowny.nvim",
    ft = "markdown",
    config = function()
      require("markdowny").setup()
    end,
    keys = {
      {
        "<C-b>",
        function()
          require("markdowny").bold()
        end,
        mode = "v",
        desc = "Bold",
      },
      {
        "<C-i>",
        function()
          require("markdowny").italic()
        end,
        mode = "v",
        desc = "Italic",
      },
      {
        "<C-k>",
        function()
          require("markdowny").link()
        end,
        mode = "v",
        desc = "Link",
      },
      {
        "<C-e>",
        function()
          require("markdowny").code()
        end,
        mode = "v",
        desc = "Code",
      },
    },
  },
  {
    "hamidi-dev/org-list.nvim",
    dependencies = {
      "tpope/vim-repeat", -- for repeatable actions with '.'
    },
    config = function()
      require("org-list").setup({
        mapping = {
          key = "<leader>lt", -- nvim-orgmode users: you might want to change this to <leader>olt
          desc = "Toggle: Cycle through list types",
        },
        checkbox_toggle = {
          enabled = true,
          -- NOTE: for nvim-orgmode users, you should change the following mapping OR change the one from orgmode.
          -- If both mapping stay the same, the one from nvim-orgmode will "win"
          key = "<C-Space>",
          desc = "Toggle checkbox state",
          filetypes = { "org", "markdown" }, -- Add more filetypes as needed
        },
      })
    end,
  },
  {
    "Thiago4532/mdmath.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- Filetypes that the plugin will be enabled by default.
      filetypes = { "markdown" },
      -- Color of the equation, can be a highlight group or a hex color.
      -- Examples: 'Normal', '#ff0000'
      foreground = "Normal",
      -- Hide the text when the equation is under the cursor.
      anticonceal = true,
      -- Hide the text when in the Insert Mode.
      hide_on_insert = true,
      -- Enable dynamic size for non-inline equations.
      dynamic = true,
      -- Configure the scale of dynamic-rendered equations.
      dynamic_scale = 1.0,
      -- Interval between updates (milliseconds).
      update_interval = 400,

      -- Internal scale of the equation images, increase to prevent blurry images when increasing terminal
      -- font, high values may produce aliased images.
      -- WARNING: This do not affect how the images are displayed, only how many pixels are used to render them.
      --          See `dynamic_scale` to modify the displayed size.
      internal_scale = 1.0,
    },
    -- The build is already done by default in lazy.nvim, so you don't need
    -- the next line, but you can use the command `:MdMath build` to rebuild
    -- if the build fails for some reason.
    -- build = ':MdMath build'
  },
}
