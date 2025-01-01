-- File:        colors.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Sep 2023
-- SPDX-License-Identifier: MIT

return {
  -- deku
  {
    "kaplanz/deku.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    init = function()
      vim.cmd.colorscheme("deku")
    end,
    lazy = true,
  },
  -- everforest
  { "sainnhe/everforest",     lazy = true },
  -- kanagawa
  { "rebelot/kanagawa.nvim",  lazy = true },
  -- nightfox
  { "EdenEast/nightfox.nvim", lazy = true },
  -- nordic
  { "AlexvZyl/nordic.nvim",   lazy = true },
  -- rose-pine
  { "rose-pine/neovim",       name = "rose-pine", lazy = true },
  -- sourcerer
  { "xero/sourcerer.vim",     lazy = true },
}
