-- File:        ui.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Sep 2023
-- SPDX-License-Identifier: MIT

return {
  -- UI for nvim-lsp progress
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  -- Better quickfix window in Neovim
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },
  -- Show colorcolumn dynamically
  {
    "Bekaboo/deadcolumn.nvim",
    opts = {
      modes = true,
      scope = "visible",
    },
  },
  -- Improve the default vim.ui interfaces
  "stevearc/dressing.nvim",
}
