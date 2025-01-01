-- File:        mini.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Sep 2023
-- SPDX-License-Identifier: MIT

return {
  -- Show next key clues
  {
    "echasnovski/mini.clue",
    config = function()
      local clue = require("mini.clue")
      clue.setup {
        -- Array of extra clues to show
        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          clue.gen_clues.builtin_completion(),
          clue.gen_clues.g(),
          clue.gen_clues.marks(),
          clue.gen_clues.registers {
            show_contents = true,
          },
          clue.gen_clues.windows {
            submode_move = false,
            submode_navigate = false,
            submode_resize = true,
          },
          clue.gen_clues.z(),
        },

        -- Array of opt-in triggers which start custom key query process.
        -- **Needs to have something in order to show clues**.
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },
          -- Built-in completion
          { mode = "i", keys = "<C-x>" },
          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },
          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },
          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },
          -- Window commands
          { mode = "n", keys = "<C-w>" },
          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },

        -- Clue window settings
        window = {
          -- Delay before showing clue window
          delay = 0,
        },
      }
    end,
  },
  -- Fast and familiar per-line commenting
  { "echasnovski/mini.comment",   opts = {} },
  -- Move any selection in any direction
  { "echasnovski/mini.move",      opts = {} },
  -- Split and join arguments
  { "echasnovski/mini.splitjoin", opts = {} },
  -- Fast and feature-rich surround actions
  { "echasnovski/mini.surround",  opts = {} },
}
