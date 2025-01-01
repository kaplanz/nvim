-- File:        ui.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Sep 2023
-- SPDX-License-Identifier: MIT

return {
  -- UI for nvim-lsp progress
  {
    "j-hui/fidget.nvim",
    opts = {}
  },
  -- Better quickfix window in Neovim
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf"
  },
  -- Dim inactive windows
  {
    "levouh/tint.nvim",
    opts = {}
  },
  -- Show vertical lines for indent
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  -- Hiding colorcolumn when unneeded
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      disabled_filetypes = {
        "help", "lazy", "mason",
      }
    }
  },
  -- Improve the default vim.ui interfaces
  "stevearc/dressing.nvim",
}
