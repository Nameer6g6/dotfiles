require'nvim-treesitter.install'.compilers = { "clang++" }
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ensure_installed = {'org'}, -- Or run :TSUpdate org
  -- ignore_install = { "javascript", "python" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    --disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    --additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  indent= {
     enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}


-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
if (vim.bo.filetype == "haskell") then
  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  parser_config.haskell = {
    install_info = {
      url = "~/path/to/tree-sitter-haskell",
      files = {"src/parser.c", "src/scanner.cc"}
    }
  }
else
  require "nvim-treesitter.parsers".get_parser_configs {
    org = {
      install_info = {
        url = 'https://github.com/milisims/tree-sitter-org',
        revision = 'main',
        files = {'src/parser.c', 'src/scanner.cc'},
      },
      filetype = 'org',
    },
  }
end
