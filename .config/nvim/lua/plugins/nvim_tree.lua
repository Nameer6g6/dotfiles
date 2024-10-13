return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<C-o>",
        "<cmd>NvimTreeToggle<CR>",
        mode = { "n", "v" },
        desc = "Toggle open close nvim-tree",
      },
    },
    config = function()
      require("nvim-tree").setup({})
    end,
  },
}
