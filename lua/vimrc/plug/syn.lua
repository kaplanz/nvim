-- File:        syn.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Sep 2023
-- SPDX-License-Identifier: MIT

return {
  -- Treesitter configurations
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", dependencies = {
    -- Show code context
    "nvim-treesitter/nvim-treesitter-context",
    -- Syntax aware text-objects
    "nvim-treesitter/nvim-treesitter-textobjects",
  } },
}
