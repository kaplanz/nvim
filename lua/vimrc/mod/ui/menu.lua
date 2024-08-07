-- File:        menu.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     18 Jul 2022
-- SPDX-License-Identifier: MIT

local mini = {
  clue = require("mini.clue"),
}

-- Create mouse popup menu
vim.cmd([[
  aunmenu *
  vnoremenu PopUp.Cut                     "+x
  vnoremenu PopUp.Copy                    "+y
  anoremenu PopUp.Paste                   "+gP
  vnoremenu PopUp.Paste                   "+P
  vnoremenu PopUp.Delete                  "_x
  nnoremenu PopUp.Select                  viw
  inoremenu PopUp.Select                  <C-O>viw
  nnoremenu PopUp.Select\ All             ggVG
  vnoremenu PopUp.Select\ All             gg0oG$
  inoremenu PopUp.Select\ All             <C-Home><C-O>VG
]])

-- Create next key clues
mini.clue.setup {
  -- Array of extra clues to show
  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    mini.clue.gen_clues.builtin_completion(),
    mini.clue.gen_clues.g(),
    mini.clue.gen_clues.marks(),
    mini.clue.gen_clues.registers {
      show_contents = true,
    },
    mini.clue.gen_clues.windows {
      submode_move = false,
      submode_navigate = false,
      submode_resize = true,
    },
    mini.clue.gen_clues.z(),
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
