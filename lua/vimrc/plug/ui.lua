-- File:        ui.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Sep 2023
-- SPDX-License-Identifier: MIT

return {
  -- Snazzy bufferline
  { "akinsho/bufferline.nvim", dependencies = {
    "kyazdani42/nvim-web-devicons",
  } },
  -- Show next key clues
  "echasnovski/mini.clue",
  -- UI for nvim-lsp progress
  "j-hui/fidget.nvim",
  -- Better quickfix window in Neovim
  { "kevinhwang91/nvim-bqf", ft = "qf" },
  -- Ultra fold in Neovim
  { "kevinhwang91/nvim-ufo", dependencies = {
    "kevinhwang91/promise-async",
  }, opts = {} },
  -- Dim inactive windows
  { "levouh/tint.nvim", opts = {} },
  -- Show vertical lines for indent
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  -- Hiding colorcolumn when unneeded
  { "m4xshen/smartcolumn.nvim", opts = {
    disabled_filetypes = {
      "help", "lazy", "mason",
    }
  } },
  -- Blazing fast statusline
  { "nvim-lualine/lualine.nvim", dependencies = {
      "kyazdani42/nvim-web-devicons",
  } },
  -- Improve the default vim.ui interfaces
  "stevearc/dressing.nvim",
}
