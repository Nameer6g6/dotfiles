return {
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && yarn install",
    cmd = "MarkdownPreview",
  },
  {
    "npxbr/glow.nvim",
    ft = { "markdown", "text", "norg" },
    build = ":GlowInstall",
  },
  {
    "gabrielelana/vim-markdown",
    ft = "markdown",
  },
}
