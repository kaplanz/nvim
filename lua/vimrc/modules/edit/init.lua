-- File:        init.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     20 Dec 2022
-- SPDX-License-Identifier: MIT

require("vimrc.modules.edit.dial")

local autopairs = require("nvim-autopairs")
local comment   = require("mini.comment")
local move      = require("mini.move")
local retrail   = require("retrail")
local surround  = require("mini.surround")

-- Super powerful autopairs
autopairs.setup {}

-- Fast and familiar per-line commenting
comment.setup {}

-- Move any selection in any direction
move.setup {}

-- Whitespace management
retrail.setup {}

-- Fast and feature-rich surround actions
surround.setup {}
