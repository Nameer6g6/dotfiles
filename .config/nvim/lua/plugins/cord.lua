return {
  {
    "vyfor/cord.nvim",
    enabled = true,
    lazy = true,
    cmd = { "Cord" },
    keys = {
      { "<leader>uC", "<cmd>Cord status<cr>", desc = "Cord Status" },
    },
    opts = {
      text = {
        workspace = "",
      },
    },
  },
}
