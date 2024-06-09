-- File:        aerial.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     20 May 2024
-- SPDX-License-Identifier: MIT

local aerial = require("aerial")

aerial.setup {
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
}

-- You probably also want to set a keymap to toggle aerial
vimrc.map("n", "<Leader>a", aerial.toggle)
