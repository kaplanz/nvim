-- File:        tree.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     08 Aug 2021
-- SPDX-License-Identifier: MIT

-- File explorer written in lua
return {
  "kyazdani42/nvim-tree.lua",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  opts = {
    -- completely disable netrw
    disable_netrw       = false,
    -- hijack netrw windows
    hijack_netrw        = false,
    -- keeps the cursor on the first letter of the filename when moving in the tree
    hijack_cursor       = true,
    -- changes the tree root directory on `DirChanged` and refreshes the tree
    update_cwd          = true,
    -- update the focused file on `BufEnter`, un-collapses the folders recursively
    -- until it finds the file
    update_focused_file = {
      -- enable this feature
      enable      = true,
      -- update the root directory of the tree to the one of the folder containing
      -- the file if the file is not under the current root directory. Only
      -- relevant when `update_focused_file.enable` is `true`
      update_cwd  = false,
      -- list of buffer names and filetypes that will not update the root dir of
      -- the tree if the file isn't found under the current root directory. Only
      -- relevant when `update_focused_file.update_cwd` is `true` and
      -- `update_focused_file.enable` is `true`
      ignore_list = {}
    },
    -- show lsp diagnostics in the signcolumn
    diagnostics         = {
      enable = true,
    },
    -- git integration with icons and colors
    git                 = {
      -- ignore files based on `.gitignore`
      ignore = true,
    },
    -- UI rendering setup
    renderer            = {
      -- Appends a trailing slash to folder names
      add_trailing = true,
      -- Compact folders that only contain a single folder into one node in the
      -- file tree
      group_empty = true,
      -- Highlight icons and/or names for opened files
      highlight_opened_files = "icon",
      -- Configuration options for icons
      icons = {
        -- Used as a separator between symlinks' source and target
        symlink_arrow = " -> ",
      },
    },
    -- filtering options
    filters             = {
      -- custom list of string that will not be shown
      custom = { ".git", "node_modules" },
    },
  },
  keys = {
    {
      "<Leader>n",
      function() require("nvim-tree.api").tree.toggle { focus = false } end,
      desc = "Toggle tree",
    },
    {
      "<Leader>N",
      function() require("nvim-tree.api").tree.open() end,
      desc = "Focus tree",
    },
  },
}
