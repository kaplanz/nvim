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
      vim.cmd.colorscheme "deku"
      -- vim.cmd[[highlight Normal ctermbg=none guibg=none]]
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
  { "rose-pine/neovim",       lazy = true, name = "rose-pine" },
}
