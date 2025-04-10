-- File:        luals.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     09 Apr 2025
-- SPDX-License-Identifier: MIT

---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        library = vim.api.nvim_get_runtime_file("", true)
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
