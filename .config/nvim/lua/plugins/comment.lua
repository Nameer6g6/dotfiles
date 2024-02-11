return {
  {
    "numToStr/Comment.nvim",
    opts = {
      padding = true, -- Add a space b/w comment and the line

      sticky = true, -- Whether the cursor should stay at its position

      ignore = nil, -- Lines to be ignored while (un)comment

      toggler = { --LHS of toggle mappings in NORMAL mode
        line = "gcc", -- Line-comment toggle keymap
        block = "gbc", -- Block-comment toggle keymap
      },
      opleader = { --LHS of operator-pending mappings in NORMAL and VISUAL mode
        line = "gc", -- Line-comment keymap

        block = "gb", -- Block-comment keymap
      },
      extra = { -- LHS of extra mappings
        above = "gcO", -- Add comment on the line above

        below = "gco", -- Add comment on the line below
        eol = "gcA", -- Add comment at the end of line
      },
      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        basic = true, -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        extra = true, -- Extra mapping; `gco`, `gcO`, `gcA`

        extended = false, -- Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
      },
      pre_hook = nil, -- Function to call before (un)comment
      post_hook = nil, -- Function to call after (un)comment
    },
  },
  {
    "danymat/neogen",
    config = function()
      require("neogen").setup({})
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    version = "*",
  },
  {
    "folke/todo-comments.nvim",
  },
  {
    "s1n7ax/nvim-comment-frame",
    opts = {
      -- adds custom keymap
      keymap = "<Space>cc",
      multiline_keymap = "<Space>C",

      -- if true, <leader>cf keymap will be disabled
      disable_default_keymap = false,

      -- start the comment with this string

      start_str = "//",

      -- end the comment line with this string
      end_str = "//",

      -- fill the comment frame border with this character

      fill_char = "-",

      -- width of the comment frame
      frame_width = 70,

      -- wrap the line after 'n' characters
      line_wrap_len = 50,

      -- automatically indent the comment frame based on the line
      auto_indent = true,

      -- add comment above the current line
      add_comment_above = true,

      -- configurations for individual language goes here
      languages = {

        -- configuration for Lua programming language
        -- @NOTE global configuration will be overridden by language level
        -- configuration if provided
        lua = {
          -- start the comment with this string
          start_str = "--[[",

          -- end the comment line with this string
          end_str = "]]--",

          -- fill the comment frame border with this character
          fill_char = "*",

          -- width of the comment frame
          frame_width = 100,

          -- wrap the line after 'n' characters

          line_wrap_len = 70,

          -- automatically indent the comment frame based on the line
          auto_indent = false,

          -- add comment above the current line
          add_comment_above = false,
        },
      },
    },
  },
  {
    "LudoPinelli/comment-box.nvim",
  },
}
