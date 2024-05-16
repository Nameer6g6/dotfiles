return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
  },
  {
    "ethanholz/nvim-lastplace",
  },
  {
    "chr4/nginx.vim",
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR 'ibhagwan/fzf-lua',
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "dnlhc/glance.nvim",
    config = function()
      require("glance").setup()
    end,
    keys = {
      vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>"),
      vim.keymap.set("n", "gR", "<CMD>Glance references<CR>"),
      vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>"),
      vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>"),
    },
  },
}

-- NOTE: Check later
-- "vmchale/dhall-vim"
-- "mbbill/undotree"
