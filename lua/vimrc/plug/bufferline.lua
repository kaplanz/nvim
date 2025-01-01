-- File:        bufferline.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Aug 2021
-- SPDX-License-Identifier: MIT

-- Snazzy bufferline
return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  opts = {
    options = {
      mode = "tabs",
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "NvimTree",
          text = "Finder",
          highlight = "Directory",
        },
      },
    },
  },
}
