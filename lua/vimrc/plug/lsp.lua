-- File:        lsp.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Sep 2023
-- SPDX-License-Identifier: MIT

return {
  -- Lsp common configurations
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    }
  },
  -- Add pictograms to LSP
  "onsails/lspkind-nvim",
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    opts = {},
  }
}
