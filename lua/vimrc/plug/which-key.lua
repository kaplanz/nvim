-- File:        which-key.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     02 Jan 2025
-- SPDX-License-Identifier: MIT

-- Create key bindings that stick.
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  -- Your configuration comes here or leave it empty to use the default
  -- settings refer to the configuration section below.
  opts = {
    win = {
      width  = { max = 80 },
      height = { min = 4  },
      col    = math.huge,
      border = "rounded",
    },
  },
}
