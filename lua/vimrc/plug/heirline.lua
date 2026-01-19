-- File:        heirline.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Aug 2021
-- SPDX-License-Identifier: MIT

return {
  "rebelot/heirline.nvim",
  dependencies = {
    "nvim-mini/mini.icons",
  },
  event = "BufEnter",
  opts = {
    -- winbar
    winbar = {
      init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
      fallthrough = false,
    },
  },
}
