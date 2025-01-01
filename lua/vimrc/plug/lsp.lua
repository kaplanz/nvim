-- File:        lsp.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Sep 2023
-- SPDX-License-Identifier: MIT

-- Lsp common configurations
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "onsails/lspkind-nvim",
  }
}
