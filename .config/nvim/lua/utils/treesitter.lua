local status_ok, configs = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

-- require('nvim-treesitter.install').compilers = { "clang++" }
require('nvim-treesitter.configs').setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

require "nvim-treesitter.parsers".get_parser_configs {
  org = {
    install_info = {
      url = 'https://github.com/milisims/tree-sitter-org',
      revision = 'main',
      files = {'src/parser.c', 'src/scanner.cc'},
    },
    filetype = 'org',
  },
  haskell = {
    install_info = {
      url = "~/path/to/tree-sitter-haskell",
      files = {"src/parser.c", "src/scanner.cc"}
    }
  }
}
