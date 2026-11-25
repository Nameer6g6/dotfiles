return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        zsh = { "shfmt" },
        bash = { "shfmt" },
        nix = { "alejandra", "nixfmt", "nixpkgsfmt", stop_after_first = true },
        rust = { "rustfmt" },
        elixir = { "mixformat" },
        eelixir = { "mixformat" },
        erlang = { "erlfmt" },
        haskell = { "fourmolu", "ormolu", "stylish-haskell", "hindent", stop_after_first = true },
        purescript = { "purs-tidy", "purty", stop_after_first = true },
        markdown = { "prettierd", "prettier", "mdformat", stop_after_first = true },
        json = { "biome", "prettierd", "prettier", "jq", stop_after_first = true },
        yaml = { "prettierd", "prettier", "yamlfmt", "yamlfix", stop_after_first = true },
        javascript = { "biome", "prettierd", "prettier", "eslint_d", stop_after_first = true },
        javascriptreact = { "biome", "prettierd", "prettier", "eslint_d", stop_after_first = true },
        typescript = { "biome", "prettierd", "prettier", "eslint_d", stop_after_first = true },
        typescriptreact = { "biome", "prettierd", "prettier", "eslint_d", stop_after_first = true },
        css = { "prettierd", "prettier", "stylelint", stop_after_first = true },
        scss = { "prettierd", "prettier", "stylelint", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-ci", "-s" },
        },
        fourmolu = {
          prepend_args = { "--stdin-input-file", "$FILENAME" },
        },
      },
    },
  },
  {
    "mhartington/formatter.nvim",
    enabled = false,
  },
  {
    "sbdchd/neoformat",
    enabled = false,
  },
}
