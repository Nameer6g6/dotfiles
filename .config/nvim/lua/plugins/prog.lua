return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = function(_, opts)
      -- luarocks >= 3.12 keeps dkjson in luarocks/vendor, which luarocks.nvim
      -- doesn't add to the path: its loader fails and pops up a big error
      local share = vim.fn.stdpath("data") .. "/lazy/luarocks.nvim/.rocks/share/lua/5.1/"
      package.path = package.path .. ";" .. share .. "luarocks/vendor/?.lua"
      require("luarocks-nvim").setup(opts)
    end,
    opts = {
      -- fidget.nvim comes from lazy below: luarocks.org's manifest is now too
      -- big for luarocks' Lua 5.1 to load, so new rocks can't be resolved
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "krivahtoo/silicon.nvim",
    cmd = "Silicon",
    build = "./install.sh build",
    config = function()
      require("silicon").setup({
        -- put your customization here
        -- Output configuration for the saved image
        output = {
          -- (string) The full path of the file to save to.
          file = "",
          -- (boolean) Whether to copy the image to clipboard instead of saving to file.
          clipboard = true,
          -- (string) Where to save images, defaults to the current directory.
          --  e.g. /home/user/Pictures
          path = ".",
          -- (string) The filename format to use. Can include placeholders for date and time.
          -- https://time-rs.github.io/book/api/format-description.html#components
          format = "silicon_[year][month][day]_[hour][minute][second].png",
        },

        -- Font and theme configuration for the screenshot.
        font = "Fira Code", -- (string) The font and font size to use for the screenshot.
        -- (string) The color theme to use for syntax highlighting.
        -- It can be a theme name or path to a .tmTheme file.
        theme = "Dracula",

        -- Background and shadow configuration for the screenshot
        background = "#eff", -- (string) The background color for the screenshot.
        shadow = {
          blur_radius = 0.0, -- (number) The blur radius for the shadow, set to 0.0 for no shadow.
          offset_x = 0, -- (number) The horizontal offset for the shadow.
          offset_y = 0, -- (number) The vertical offset for the shadow.
          color = "#555", -- (string) The color for the shadow.
        },

        pad_horiz = 100, -- (number) The horizontal padding.
        pad_vert = 80, -- (number) The vertical padding.
        line_number = false, -- (boolean) Whether to show line numbers in the screenshot.
        line_pad = 2, -- (number) The padding between lines.
        line_offset = 1, -- (number) The starting line number for the screenshot.
        tab_width = 4, -- (number) The tab width for the screenshot.
        gobble = false, -- (boolean) Whether to trim extra indentation.
        highlight_selection = false, -- (boolean) Whether to capture the whole file and highlight selected lines.
        round_corner = true,
        window_controls = true, -- (boolean) Whether to show window controls (minimize, maximize, close) in the screenshot.
        window_title = nil, -- (function) A function that returns the window title as a string.

        -- Watermark configuration for the screenshot
        -- watermark = {
        --   text = "Nameer", -- (string) The text to use as the watermark, set to nil to disable.
        --   color = "#222", -- (string) The color for the watermark text.
        --   -- (string) The style for the watermark text, possible values are:
        --   -- 'bold', 'italic', 'bolditalic', or anything else defaults to 'regular'.
        --   style = "bold",
        -- },
      })
    end,
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    build = false,
    dependencies = {
      "luarocks.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          if not vim.tbl_contains(opts.ensure_installed, "http") then
            table.insert(opts.ensure_installed, "http")
          end
        end,
      },
    },
  },
  {
    "chr4/nginx.vim",
  },
  {
    "dnlhc/glance.nvim",
    config = function()
      require("glance").setup()
    end,
    keys = {
      { "<leader>vD", "<CMD>Glance definitions<CR>", desc = "Glance Definitions" },
      { "<leader>vR", "<CMD>Glance references<CR>", desc = "Glance References" },
      { "<leader>vY", "<CMD>Glance type_definitions<CR>", desc = "Glance Type Definitions" },
      { "<leader>vI", "<CMD>Glance implementations<CR>", desc = "Glance Implementations" },
    },
  },
  {
    "goerz/jupytext.nvim",
    version = "0.2.0",
    opts = function()
      local jupytext = require("jupytext")
      return {
        jupytext = "jupytext",
        format = "markdown",
        update = true,
        filetype = jupytext.get_filetype,
        new_template = jupytext.default_new_template(),
        sync_patterns = { "*.md", "*.py", "*.jl", "*.R", "*.Rmd", "*.qmd" },
        autosync = true,
        handle_url_schemes = true,
      }
    end,
  },
  {
    "Vigemus/iron.nvim",
    cmd = { "IronRepl", "IronFocus", "IronHide", "IronRestart" },
    -- <space>i…: <space>s… is Lspsaga's diagnostics
    keys = {
      { "<space>ir", desc = "Iron REPL toggle" },
      { "<space>iR", desc = "Iron REPL restart" },
      { "<space>if", "<cmd>IronFocus<cr>", desc = "Iron focus" },
      { "<space>ih", "<cmd>IronHide<cr>", desc = "Iron hide" },
      { "<space>ic", mode = { "n", "v" }, desc = "Iron send" },
      { "<space>ia", desc = "Iron send file" },
      { "<space>il", desc = "Iron send line" },
      { "<space>ip", desc = "Iron send paragraph" },
      { "<space>iu", desc = "Iron send until cursor" },
      { "<space>im", desc = "Iron send mark" },
      { "<space>ib", desc = "Iron send code block" },
      { "<space>in", desc = "Iron send code block and move" },
    },
    config = function()
      local iron = require("iron.core")
      local view = require("iron.view")
      local common = require("iron.fts.common")

      iron.setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            sh = { command = { "zsh" } },
            python = {
              command = { "python3" },
              format = common.bracketed_paste_python,
              block_dividers = { "# %%", "#%%" },
              env = { PYTHON_BASIC_REPL = "1" },
            },
          },
          repl_filetype = function(_, ft)
            return ft
          end,
          dap_integration = true,
          repl_open_cmd = view.bottom(40),
        },
        keymaps = {
          toggle_repl = "<space>ir",
          restart_repl = "<space>iR",
          send_motion = "<space>ic",
          visual_send = "<space>ic",
          send_file = "<space>ia",
          send_line = "<space>il",
          send_paragraph = "<space>ip",
          send_until_cursor = "<space>iu",
          send_mark = "<space>im",
          send_code_block = "<space>ib",
          send_code_block_and_move = "<space>in",
          mark_motion = "<space>mc",
          mark_visual = "<space>mc",
          remove_mark = "<space>md",
          cr = "<space>i<cr>",
          interrupt = "<space>i<space>",
          exit = "<space>iq",
          clear = "<space>ix",
        },
        highlight = { italic = true },
        ignore_blank_lines = true,
      })
    end,
  },
}

-- NOTE: Check later
-- "vmchale/dhall-vim"
-- "mbbill/undotree"
