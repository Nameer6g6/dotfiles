local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local lang_List = { "norg", "norg_meta", "norg_table", "haskell", "cpp", "c", "javascript", "markdown", "ruby", "nix", "lua", "rust", "go", "html", "css", "toml", "yaml" }

configs.setup {
  -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = lang_List,
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent= {
     enable = true,
     disable = { "yaml" },
  },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  rainbow = {
    enable = true,
    disable = {},
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

require "nvim-treesitter.parsers".get_parser_configs {
  haskell = {
    install_info = {
      url = "~/path/to/tree-sitter-haskell",
      files = {"src/parser.c", "src/scanner.cc"}
    }
  },
  norg = {
    install_info = {
      url = "https://github.com/nvim-neorg/tree-sitter-norg",
      files = { "src/parser.c", "src/scanner.cc" },
      branch = "main"
    },
  },
  norg_meta = {
    install_info = {
      url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
      files = { "src/parser.c" },
      branch = "main"
    },
  },
  norg_table = {
    install_info = {
      url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
      files = { "src/parser.c" },
      branch = "main"
    },
  }
}
