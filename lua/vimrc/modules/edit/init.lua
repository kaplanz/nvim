-- File:        init.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     20 Dec 2022
-- SPDX-License-Identifier: MIT

require("vimrc.modules.edit.dial")

local autopairs = require("nvim-autopairs")
local mini = {
  comment  = require("mini.comment"),
  move     = require("mini.move"),
  surround = require("mini.surround"),
}
local retrail   = require("retrail")

-- Super powerful autopairs
autopairs.setup {}

-- Fast and familiar per-line commenting
mini.comment.setup {}

-- Move any selection in any direction
mini.move.setup {}

-- Whitespace management
retrail.setup {}

-- Fast and feature-rich surround actions
mini.surround.setup {}
