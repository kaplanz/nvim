-- File:        dial.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     03 Aug 2022
-- SPDX-License-Identifier: MIT

-- Enhanced increment/decrement
return {
  "monaqa/dial.nvim",
  config = function()
    local dial   = require("dial.map")
    local augend = require("dial.augend")
    local config = require("dial.config")

    -- Register augends
    config.augends:register_group {
      default = {
        -- Numbers
        augend.integer.alias.binary,
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,
        augend.integer.alias.octal,
        -- -- Date
        augend.date.alias["%H:%M"],
        augend.date.alias["%H:%M:%S"],
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%Y/%m/%d"],
        augend.date.alias["%d/%m/%Y"],
        augend.date.new {
          pattern = "%d %b %Y",
          default_kind = "day",
          only_valid = true,
        },
        -- Constant
        augend.constant.alias.Alpha,
        augend.constant.alias.alpha,
        augend.constant.alias.bool,
        augend.constant.new {
          elements = { "and", "or" },
          word     = true,
          cyclic   = true,
        },
        augend.constant.new {
          elements = { "&&", "||" },
          word     = false,
          cyclic   = true,
        },
        -- Hexcolor
        augend.hexcolor.new {
          case = "lower",
        },
        -- Semver
        augend.semver.alias.semver,
        -- Misc
        augend.misc.alias.markdown_header,
      },
    }

    -- Increment
    vim.keymap.set("n", "<C-a>", dial.inc_normal(), {
      desc = "Add [count] to the value at the cursor"
    })
    vim.keymap.set("v", "<C-a>", dial.inc_visual(), {
      desc = "Add [count] to the value at the cursor"
    })
    vim.keymap.set("v", "g<C-a>", dial.inc_gvisual(), {
      desc = "Add [count] to the value at the cursor"
    })
    -- Decrement
    vim.keymap.set("n", "<C-x>", dial.dec_normal(), {
      desc = "Subtract [count] to the value at the cursor"
    })
    vim.keymap.set("v", "<C-x>", dial.dec_visual(), {
      desc = "Subtract [count] to the value at the cursor"
    })
    vim.keymap.set("v", "g<C-x>", dial.dec_gvisual(), {
      desc = "Subtract [count] to the value at the cursor"
    })
  end,
}
