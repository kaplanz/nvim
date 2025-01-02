-- File:        snacks.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     19 Dec 2024
-- SPDX-License-Identifier: MIT

---@diagnostic disable: undefined-doc-name
---@diagnostic disable: undefined-global
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- Your configuration comes here or leave it empty to use the default
  -- settings refer to the configuration section below.
  ---@type snacks.Config
  opts = {
    -- Efficient animations including over 45 easing functions (library)
    animate      = { enabled = false },
    -- Deal with big files
    bigfile      = { enabled = true },
    -- Delete buffers without disrupting window layout
    bufdelete    = { enabled = true },
    -- Beautiful declarative dashboards
    ---@class snacks.dashboard.Config
    dashboard    = {
      -- These settings are used by some built-in sections
      preset = {
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find",
            action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New",
            action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Grep",
            action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recents",
            action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config",
            action = function()
              Snacks.dashboard.pick("files", {
                cwd = vim.fn.stdpath('config'),
                follow = true
              })
            end },
          { icon = " ", key = "s", desc = "Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy",
            action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit",
            action = ":qa" },
        },
      },
    },
    -- Pretty inspect & backtraces for debugging
    debug        = { enabled = false },
    -- Focus on the active scope by dimming the rest
    dim          = { enabled = true },
    -- Git utilities
    git          = { enabled = false },
    -- Open the current file, branch, commit, or repo in a browser (e.g. GitHub,
    -- GitLab, Bitbucket)
    gitbrowse    = { enabled = true },
    -- Indent guides and scopes
    indent       = { enabled = true },
    -- Better vim.ui.input
    input        = { enabled = true },
    -- Open LazyGit in a float, auto-configure colorscheme and integration with
    -- Neovim
    lazygit      = { enabled = false },
    -- Pretty vim.notify
    notifier     = { enabled = true },
    -- Utility functions to work with Neovim's vim.notify
    notify       = { enabled = false },
    -- Neovim lua profiler
    profiler     = { enabled = false },
    -- When doing nvim somefile.txt, it will render the file as quickly as
    -- possible, before loading your plugins.
    quickfile    = { enabled = true },
    -- LSP-integrated file renaming with support for plugins like neo-tree.nvim
    -- and mini.files.
    rename       = { enabled = true },
    -- Scope detection, text objects and jumping based on treesitter or indent
    scope        = { enabled = false },
    -- Scratch buffers with a persistent file
    scratch      = { enabled = true },
    -- Smooth scrolling
    scroll       = { enabled = false },
    -- Pretty status column
    statuscolumn = { enabled = true },
    -- Create and toggle floating/split terminals
    terminal     = { enabled = false },
    -- Toggle keymaps integrated with which-key icons / colors
    toggle       = { enabled = false },
    -- Utility functions for Snacks (library)
    util         = { enabled = false },
    -- Create and manage floating windows or splits
    win          = { enabled = false },
    -- Auto-show LSP references and quickly navigate between them
    words        = { enabled = true },
    -- Zen mode • distraction-free coding
    zen          = { enabled = true },
  },
  keys = {
    -- bufdelete
    {
      "<Leader>bd",
      function() Snacks.bufdelete() end,
      desc = "Delete buffer",
    },
    -- gitbrowse
    {
      "<Leader>gB",
      function() Snacks.gitbrowse() end,
      desc = "Git browse",
      mode = { "n", "v" },
    },
    -- notifier
    {
      "<Leader>un",
      function() Snacks.notifier.hide() end,
      desc = "Dismiss all notifications"
    },
    -- rename
    {
      "<Leader>cR",
      function() Snacks.rename.rename_file() end,
      desc = "Rename file"
    },
    -- scratch
    {
      "<Leader>.",
      function() Snacks.scratch() end,
      desc = "Toggle scratch buffer"
    },
    {
      "<Leader>S",
      function() Snacks.scratch.select() end,
      desc = "Select scratch buffer"
    },
    -- words
    {
      "]]",
      function() Snacks.words.jump(vim.v.count1) end,
      desc = "Next reference",
      mode = { "n", "t" }
    },
    {
      "[[",
      function() Snacks.words.jump(-vim.v.count1) end,
      desc = "Prev reference",
      mode = { "n", "t" }
    },
    -- zen
    {
      "<Leader>z",
      function() Snacks.zen() end,
      desc = "Toggle zen mode"
    },
    {
      "<Leader>Z",
      function() Snacks.zen.zoom() end,
      desc = "Toggle zen zoom"
    },
  },
}
