-- File:        dap.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     18 Aug 2022
-- SPDX-License-Identifier: MIT

local dap = require("dap")

-- Paths
local path = {
  concat = function(parts)
    return vim.fn.resolve(table.concat(parts, "/"))
  end,
}

local mason = path.concat{ vim.fn.stdpath("data"), "/mason/bin" }

-- Adapters
do
  -- CodeLLDB
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = path.concat { mason, "codelldb" },
      args = { "--port", "${port}" },
    },
  }

  -- debugpy
  dap.adapters.debugpy = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
  }
end

-- Configurations
do
  -- C/C++/Rust
  dap.configurations.c = {
    {
      type = "codelldb",
      name = "Launch file",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = true,
    },
  }
  dap.configurations.cpp  = dap.configurations.c
  dap.configurations.rust = dap.configurations.c
  -- Python
  dap.configurations.python = {
    {
      type = "debugpy",
      name = "Launch file",
      request = "launch",
      program = "${file}",
    },
  }
end

-- Keymaps
do
  vimrc.map("n", "<F5>",       dap.continue,          nil, "Continue")
  vimrc.map("n", "<F10>",      dap.step_over,         nil, "Step over")
  vimrc.map("n", "<F11>",      dap.step_into,         nil, "Step into")
  vimrc.map("n", "<F12>",      dap.step_out,          nil, "Step out")
  vimrc.map("n", "<Leader>b",  dap.toggle_breakpoint, nil, "Toggle breakpoint")
  vimrc.map("n", "<Leader>B",  function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
  end,                                                nil, "Set breakpoint condition")
  vimrc.map("n", "<Leader>lp", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  end,                                                nil, "Set log point message")
  vimrc.map("n", "<Leader>dr", dap.repl.open,         nil, "Open REPL")
  vimrc.map("n", "<Leader>dl", dap.run_last,          nil, "Run last")
end
