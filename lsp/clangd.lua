-- File:        clangd.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Apr 2025
-- SPDX-License-Identifier: MIT

---@type vim.lsp.Config
return {
  cmd = { "clangd" },
  filetypes = {
    "c",
    "cpp",
  },
  root_markers = {
    "compile_commands.json",
    ".clang",
  },
  single_file_support = true,
  settings = {},
}
