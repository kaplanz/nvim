-- File:        aerial.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     20 May 2024
-- SPDX-License-Identifier: MIT

-- Code outline window
return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    layout = {
      -- These control the width of the aerial window.
      -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- min_width and max_width can be a list of mixed types.
      -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
      max_width = { 40, 0.2 },
      width = nil,
      min_width = 25,
    },

    -- Determines how the aerial window decides which buffer to display symbols for
    --   window - aerial window will display symbols for the buffer in the window from which it was opened
    --   global - aerial window will display symbols for the current window
    attach_mode = "global",
  },
  keys = {
    {
      "<Leader>a",
      function() require("aerial").toggle({ focus = false }) end,
      desc = "Toggle aerial",
    },
    {
      "<Leader>A",
      function() require("aerial").open() end,
      desc = "Focus aerial"
    },
  },
}
