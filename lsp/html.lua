-- File:        ruff.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     20 May 2025
-- SPDX-License-Identifier: MIT

---@type vim.lsp.Config
return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  single_file_support = true,
  settings = {},
  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
    configurationSection = { "html", "css", "javascript" },
  },
}
