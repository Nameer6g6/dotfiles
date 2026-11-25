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
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    config = true,
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
}
