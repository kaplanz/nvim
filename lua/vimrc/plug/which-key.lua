-- File:        which-key.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     02 Jan 2025
-- SPDX-License-Identifier: MIT

-- Create key bindings that stick.
return {
  "folke/which-key.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  event = "VeryLazy",
  -- Your configuration comes here or leave it empty to use the default
  -- settings refer to the configuration section below.
  ---@module "which-key"
  ---@type wk.Opts
  opts = {
    preset = "modern",
    win = {
      width  = { max = 0.6 },
    },
    show_help = false,
  },
  init = function()
    require("which-key").add {
      { "<Leader>b", group = "Buffer" },
      { "<Leader>g", group = "Git" },
      { "<Leader>l", group = "LSP", icon = " " },
    }
  end,
}
