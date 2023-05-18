-- Mason setup
local status, mason = pcall(require, "mason")
if not status then
  vim.notify "Error: mason isn't working"
  return
end
mason.setup()

-- mason_lspconfig setup
local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
  vim.notify "Error: mason_lspconfig isn't working"
  return
end
mason_lspconfig.setup()

local status3, lsp = pcall(require, "lspconfig")
if not status3 then
  vim.notify "Error: lspconfig isn't working"
  return
end

local protocl = require "vim.lsp.protocol"

local on_attach = function(client, bufnr)
  if client.server_capabailities.documentFormattingProvier then
    vim.api.nvim_command [[ augroup Format]]
    vim.api.nvim_command [[ autocmd! * <buffer> ]]
    vim.api.nvim_command [[ autocmd bufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync() ]]
    vim.api.nvim_command [[ augroup END ]]
  end
end

lsp.tsserver.setup {
  on_attach = on_attach,
  file_types = { "typescript", "typescriptreact", "typescript.txs" },
  cmd = { "typescript-language-server", "--stdio" },
}

lsp.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lsp.hls.setup {
  on_attach = on_attach,
  filetypes = { "haskell", "lhaskell", "cabal" },
  settings = {
    haskell = {
      cabalFormattingProvider = "cabalfmt",
      formattingProvider = "ormolu",
    },
  },
  cmd = { "haskell-language-server-wrapper", "--lsp" },
  -- root_dir = function(filepath)
  --   return (
  --     util.root_pattern("hie.yaml", "stack.yaml", "cabal.project")(filepath)
  --     or util.root_pattern("*.cabal", "package.yaml")(filepath)
  --   )
  -- end,
  single_file_support = true,
}

lsp.purescriptls.setup {
  cmd = { "purescript-language-server", "--stdio" },
  file_types = { "purescript" },
  -- root_dir = root_pattern("spago.dhall", "psc-package.json", "bower.json", "flake.nix", "shell.nix"),
}

lsp.omnisharp.setup {
  -- cmd = { "dotnet", "/path/to/omnisharp/OmniSharp.dll" },

  -- Enables support for reading code style, naming convention and analyzer
  -- settings from .editorconfig.
  enable_editorconfig_support = true,

  -- If true, MSBuild project system will only load projects for files that
  -- were opened in the editor. This setting is useful for big C# codebases
  -- and allows for faster initialization of code navigation features only
  -- for projects that are relevant to code that is being edited. With this
  -- setting enabled OmniSharp may load fewer projects and may thus display
  -- incomplete reference lists for symbols.
  enable_ms_build_load_projects_on_demand = false,

  -- Enables support for roslyn analyzers, code fixes and rulesets.
  enable_roslyn_analyzers = false,

  -- Specifies whether 'using' directives should be grouped and sorted during
  -- document formatting.
  organize_imports_on_format = false,

  -- Enables support for showing unimported types and unimported extension
  -- methods in completion lists. When committed, the appropriate using
  -- directive will be added at the top of the current file. This option can
  -- have a negative impact on initial completion responsiveness,
  -- particularly for the first few completion sessions after opening a
  -- solution.
  enable_import_completion = false,

  -- Specifies whether to include preview versions of the .NET SDK when
  -- determining which version to use for project loading.
  sdk_include_prereleases = true,

  -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
  -- true
  analyze_open_documents_only = false,
  -- FIX: root_pattern is not working
  -- root_dir = root_pattern ".sln" or root_pattern ".csproj",
}

lsp.pyright.setup {}

lsp.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ["rust-analyzer"] = {},
  },
}
