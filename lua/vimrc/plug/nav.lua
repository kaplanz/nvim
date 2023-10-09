-- File:        nav.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Sep 2023
-- SPDX-License-Identifier: MIT

return {
  -- Navigate code with search labels
  { "folke/flash.nvim", opts = {} },
  -- File explorer written in lua
  { "kyazdani42/nvim-tree.lua", dependencies = {
    "kyazdani42/nvim-web-devicons",
  } },
  -- Fuzzy finder over lists
  { "nvim-telescope/telescope.nvim", dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  } },
}
