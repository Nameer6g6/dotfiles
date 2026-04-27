local function neoformat_filetype(buf)
  local ft = vim.bo[buf].filetype
  if ft == "" then
    return ""
  end
  return vim.split(ft, ".", { plain = true })[1] or ft
end

local function neoformat_enabled_formatters(ft)
  if ft == "" then
    return {}
  end

  local buf_var = "neoformat_enabled_" .. ft
  if vim.g[buf_var] then
    return vim.g[buf_var]
  end

  local enabled_fn = ("neoformat#formatters#%s#enabled"):format(ft)
  if vim.fn.exists("*" .. enabled_fn) == 1 then
    return vim.fn[enabled_fn]()
  end

  return {}
end

local function neoformat_definition(ft, formatter)
  local buf_var = ("neoformat_%s_%s"):format(ft, formatter)
  if vim.g[buf_var] then
    return vim.g[buf_var]
  end

  local formatter_fn = ("neoformat#formatters#%s#%s"):format(ft, formatter)
  if vim.fn.exists("*" .. formatter_fn) == 1 then
    return vim.fn[formatter_fn]()
  end
end

local function neoformat_executable(definition, buf)
  if type(definition) ~= "table" or type(definition.exe) ~= "string" or definition.exe == "" then
    return nil
  end

  if vim.fn.executable(definition.exe) == 1 then
    return definition.exe
  end

  if definition.try_node_exe == 1 and vim.g.neoformat_try_node_exe == 1 then
    local filename = vim.api.nvim_buf_get_name(buf)
    local search_root = filename ~= "" and vim.fs.dirname(filename) or vim.fn.getcwd()
    local local_exe = vim.fn.findfile("node_modules/.bin/" .. definition.exe, search_root .. ";")
    if local_exe ~= "" and vim.fn.executable(local_exe) == 1 then
      return local_exe
    end
  end
end

local function neoformat_sources(buf)
  local ft = neoformat_filetype(buf)
  local available = {}

  for _, formatter in ipairs(neoformat_enabled_formatters(ft)) do
    local definition = neoformat_definition(ft, formatter)
    if neoformat_executable(definition, buf) then
      available[#available + 1] = formatter
    end
  end

  return available
end

return {
  {
    "stevearc/conform.nvim",
    enabled = false,
  },
  {
    "mhartington/formatter.nvim",
    enabled = false,
  },
  {
    "sbdchd/neoformat",
    event = "LazyFile",
    keys = {
      { "<leader>cN", "<cmd>Neoformat<cr>", desc = "Neoformat Buffer" },
    },
    init = function()
      vim.g.neoformat_only_msg_on_error = 1
      vim.g.neoformat_try_node_exe = 1
      vim.g.neoformat_try_formatprg = 0
      vim.g.neoformat_run_all_formatters = 0
      vim.g.neoformat_basic_format_align = 0
      vim.g.neoformat_basic_format_retab = 1
      vim.g.neoformat_basic_format_trim = 1
      vim.g.neoformat_shfmt_opt = "-ci -s"
      vim.g.neoformat_haskell_fourmolu = {
        exe = "fourmolu",
        args = { "--stdin-input-file", "%:p" },
        stdin = 1,
      }

      local preferred = {
        lua = { "stylua" },
        sh = { "shfmt" },
        zsh = { "shfmt" },
        bash = { "shfmt" },
        nix = { "alejandra", "nixfmt", "nixpkgsfmt" },
        rust = { "rustfmt" },
        elixir = { "mixformat" },
        eelixir = { "mixformat" },
        erlang = { "erlfmt" },
        haskell = { "fourmolu", "ormolu", "stylishhaskell", "hindent" },
        purescript = { "purstidy", "purty" },
        markdown = { "prettierd", "prettier", "mdformat" },
        json = { "biome", "prettierd", "prettier", "jq" },
        yaml = { "prettierd", "prettier", "yamlfmt", "yamlfix" },
        javascript = { "biome", "prettierd", "prettier", "eslint_d" },
        javascriptreact = { "biome", "prettierd", "prettier", "eslint_d" },
        typescript = { "biome", "prettierd", "prettier", "eslint_d" },
        typescriptreact = { "biome", "prettierd", "prettier", "eslint_d" },
        css = { "prettierd", "prettier", "stylelint" },
        scss = { "prettierd", "prettier", "stylelint" },
        html = { "prettierd", "prettier" },
      }

      for ft, formatters in pairs(preferred) do
        vim.g["neoformat_enabled_" .. ft] = formatters
      end

      LazyVim.on_very_lazy(function()
        LazyVim.format.register({
          name = "neoformat",
          primary = true,
          priority = 200,
          format = function()
            vim.cmd("silent Neoformat")
          end,
          sources = neoformat_sources,
        })
      end)
    end,
  },
}
