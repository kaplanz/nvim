-- File:        pack.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Sep 2023
-- SPDX-License-Identifier: MIT

return {
  -- Portable package manager for Neovim
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    }
  },
}
