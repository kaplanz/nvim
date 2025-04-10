-- File:        rust_analyzer.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     09 Apr 2025
-- SPDX-License-Identifier: MIT

---@type vim.lsp.Config
return {
  cmd = { "rust-analyzer" },
  filetypes = {
    "Cargo.toml",
    "rust",
  },
  root_markers = {
    "build.rs",
    "Cargo.lock",
    "Cargo.toml",
  },
  settings = {
    ["rust_analyzer"] = {
      assist = {
        emitMustUse = true,
      },
      cargo = {
        features = "all",
      },
      check = {
        command = "clippy",
      },
      diagnostics = {
        styleLints = {
          enable = true,
        },
      },
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
    }
  }
}
