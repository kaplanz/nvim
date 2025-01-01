-- File:        lualine.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     06 Aug 2021
-- SPDX-License-Identifier: MIT

-- Blazing fast statusline
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  opts = {
    options = {
      component_separators = "│",
      section_separators = "",
      globalstatus = true,
    },
  },
}
