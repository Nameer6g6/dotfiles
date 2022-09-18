require("dap_configs.dap_virtual_text")
require("dap_configs.dapui")

local dap_ok, _ = pcall(require, "dap")
if not dap_ok then
  vim.notify("Error: Dap is not working.")
  return
end

local ui, dap = require "dapui", require "dap"
dap.listeners.after.event_initialized["dapui_config"] = function()
  ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  ui.close()
end

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
    }
  },
  cs = {
    {
      type = "coreclr",
      name = "launch - netcoredbg",
      request = "launch",
      program = function()
        if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
          vim.g.dotnet_build_project()
        end
        return vim.g.dotnet_get_dll_path()
      end,
    },
  }
}

dap.adapters = {
  haskell = {
    type = 'executable';
    command = 'haskell-debug-adapter';
    args = {'--hackage-version=0.0.33.0'};
  },
  coreclr = {
    type = 'executable',
    command = 'netcoredbg',
    args = {'--interpreter=vscode'}
  }
}
