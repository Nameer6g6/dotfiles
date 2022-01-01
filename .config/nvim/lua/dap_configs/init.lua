local dap_install = require("dap-install")

dap_install.setup({
  installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

local status_ok, dap = pcall(require, "dap")
if not status_ok then
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
