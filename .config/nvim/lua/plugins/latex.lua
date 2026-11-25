return {
  {
    "lervag/vimtex",
    ft = "tex",
  },
  {
    "xuhdev/vim-latex-live-preview",
    ft = "tex",
  },
  {
    -- LaTeX math drawn with text characters (works in any terminal)
    "jbyuki/nabla.nvim",
    ft = { "markdown", "tex", "norg" },
    keys = {
      { "<Space>mp", function() require("nabla").popup() end, ft = { "markdown", "tex", "norg" }, desc = "Math popup" },
      { "<Space>mv", function() require("nabla").toggle_virt() end, ft = { "markdown", "tex", "norg" }, desc = "Math inline toggle" },
    },
  },
}
