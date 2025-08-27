-- File:        tree.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     08 Aug 2021
-- SPDX-License-Identifier: MIT

-- File explorer
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    { "MunifTanjim/nui.nvim", lazy = true },
    { "kyazdani42/nvim-web-devicons", lazy = true },
  },
  lazy = false, -- needed to hijack netrw
  -- Hijack netrw
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  ---@module "neo-tree"
  ---@type neotree.Config
  opts = {
    window = {
      width = 32,
    },
    ---@type table
    source_selector = {
      winbar = true,
      content_layout = "center",
    },
    filesystem = {
      hijack_netrw_behavior = "open_current",
    },
  },
  cmd = "Neotree",
  keys = {
    {
      "<Leader>e",
      function() vim.cmd.Neotree "toggle" end,
      desc = "Toggle explorer",
    },
    {
      "<Leader>o",
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd.Neotree "focus"
        end
      end,
      desc = "Focus explorer",
    },
  },
}
