local dap_virtual_text_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if dap_virtual_text_ok then
  dap_virtual_text.setup {
    enabled = true,                     -- enable this plugin (the default)
    enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,            -- show stop reason when stopped for exceptions
    commented = false,                  -- prefix virtual text with comment string
    -- experimental features:
    virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,
    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
  }
else
  vim.notify("Error: Dap Install is not working.")
end

-- local dap_install = require("dap-install")
local dap_install_ok, dap_install = pcall(require, "dap-install")
if dap_install_ok then
  dap_install.setup({
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
  })
end

local status_ok, dap = pcall(require, "dap")
if not status_ok then
  vim.notify("Error: Dap is not working.")
  return
end

-- WARNING: WIP for automating running C# debugger
-- local ddl_path = ""
-- local dot_bin_path = io.popen('find "'..'/bin/Debbug/'..'" -type f')  --Open directory look for files, save data in p. By giving '-type f' as parameter, it returns all files.
-- for l in dot_bin_path:lines() do                         --Loop through all files
--   ddl_path = l:match("*.dll")
-- end


dap.adapters = {
  go = {
    type = 'executable';
    command = 'node';
    args = {os.getenv('HOME') .. '/dev/golang/vscode-go/dist/debugAdapter.js'};
  },
  haskell = {
    type = 'executable';
    command = 'haskell-debug-adapter';
    args = {'--hackage-version=0.0.33.0'};
  },
  netcoredbg = {
    type = 'executable',
    command = '/usr/bin/netcoredbg',
    args = {'--interpreter=vscode'}
  },
  mix_task = {
    type = 'executable',
    command = os.getenv("HOME") .. '.local/share/nvim/lsp_servers/elixir/elixir-ls/debugger.sh', -- debugger.bat for windows
    args = {}
  }
}

dap.configurations = {
  go = {
    {
      type = 'go';
      name = 'Debug';
      request = 'launch';
      showLog = false;
      program = "${file}";
      dlvToolPath = vim.fn.exepath('dlv')  -- Adjust to where delve is installed
    },
  },
  haskell = {
    {
      type = 'haskell',
      request = 'launch',
      name = 'Debug',
      workspace = '${workspaceFolder}',
      startup = "${file}",
      stopOnEntry = true,
      logFile = vim.fn.stdpath('data') .. '/haskell-dap.log',
      logLevel = 'WARNING',
      ghciEnv = vim.empty_dict(),
      ghciPrompt = "λ: ",
      -- Adjust the prompt to the prompt you see when you invoke the stack ghci command below
      ghciInitialPrompt = "λ: ",
      ghciCmd= "stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show",
    },
  },
  cs = {
    {
      type = "netcoredbg",
      name = "launch - netcoredbg",
      request = "launch",
      program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
      end,
    },
  },
  elixir = {
    type = "mix_task",
    name = "mix test",
    task = 'test',
    taskArgs = {"--trace"},
    request = "launch",
    startApps = true, -- for Phoenix projects
    projectDir = "${workspaceFolder}",
    requireFiles = {
      "test/**/test_helper.exs",
      "test/**/*_test.exs"
    }
  },
}

local dap_ui_ok, dap_ui = pcall(require, "dapui")
if not dap_ui_ok then
  dap_ui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
    },
    sidebar = {
      -- You can change the order of elements in the sidebar
      elements = {
        -- Provide as ID strings or tables with "id" and "size" keys
        {
          id = "scopes",
          size = 0.25, -- Can be float or integer > 1
        },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 00.25 },
      },
      size = 40,
      position = "left", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
      elements = { "repl" },
      size = 10,
      position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = "single", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
  })
else
  vim.notify("Error: Dap UI is not working.")
end


local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
