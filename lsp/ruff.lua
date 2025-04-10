-- File:        ruff.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Apr 2025
-- SPDX-License-Identifier: MIT

---@type vim.lsp.Config
return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  single_file_support = true,
  settings = {},
}
