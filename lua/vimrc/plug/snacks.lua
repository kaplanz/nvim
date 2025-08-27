-- File:        snacks.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     19 Dec 2024
-- SPDX-License-Identifier: MIT

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
          {
            icon = " ", key = "n", desc = "New File",
            action = function() vim.cmd.enew() end,
          },
          {
            icon = " ", key = "f", desc = "Find File",
            action = function() Snacks.picker.files() end,
          },
          {
            icon = "󰈭 ", key = "g", desc = "Find Word",
            action = function() Snacks.picker.grep() end,
          },
          {
            icon = " ", key = "o", desc = "Recents",
            action = function() Snacks.picker.recent() end,
          },
          {
            icon = " ", key = "'", desc = "Bookmarks", enabled = false,
            action = function() Snacks.picker.marks() end,
          },
          {
            icon = " ", key = "r", desc = "Restore",
            action = function() require("resession").load("last") end,
          },
          {
            icon = " ", key = "c", desc = "Settings",
            action = function() Snacks.dashboard.pick("files", {
                cwd = vim.fn.stdpath("config"), follow = true,
            }) end,
          },
          {
            icon = " ", key = "p", desc = "Plugins",
            action = function() vim.cmd.Lazy() end,
            enabled = package.loaded.lazy ~= nil,
          },
          {
            icon = " ", key = "q", desc = "Quit",
            action = function() vim.cmd.qall() end,
          },
        },
        -- Used by the `header` section
        header = table.concat({
        "          ▄▀▄     ▄▀▄          ",
        "         ▄█░░▀▀▀▀▀░░█▄         ",
        "     ▄▄  █░░░░░░░░░░░█  ▄▄     ",
        "    █▄▄█ █░░▀░░┬░░▀░░█ █▄▄█    ",
        "🮇🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀🮀▎",
        }, "\n"),
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
    zen          = {
      -- You can add any `Snacks.toggle` id here.
      -- Toggle state is restored when the window is closed.
      -- Toggle config options are NOT merged.
      ---@type table<string, boolean>
      toggles = { dim = true },
      --- Callback when the window is opened.
      ---@param win snacks.win
      on_open = function(win)
        -- Disable snacks indent
        vim.b[win.buf].snacks_indent_old = vim.b[win.buf].snacks_indent
        vim.b[win.buf].snacks_indent = false
      end,
      --- Callback when the window is closed.
      ---@param win snacks.win
      on_close = function(win)
        -- Restore snacks indent
        vim.b[win.buf].snacks_indent = vim.b[win.buf].snacks_indent_old
      end,
      win = {
        width = function()
          return math.min(120, math.floor(vim.o.columns * 0.75))
        end,
        height = 0.9,
        backdrop = {
          transparent = false,
          win = { wo = { winhighlight = "Normal:Normal" } },
        },
        wo = {
          number = false,
          relativenumber = false,
          signcolumn = "no",
          foldcolumn = "0",
          winbar = "",
          winblend = 0,
          list = false,
          showbreak = "NONE",
          winhighlight = "Normal:Normal",
        },
      },
    },
  },
  keys = {
    -- bufdelete
    {
      "<Leader>bd",
      function() Snacks.bufdelete() end,
      desc = "Delete buffer",
    },
    -- dashboard
    {
      "<Leader>h",
      function() Snacks.dashboard() end,
      desc = "Show launch screen",
    },
    -- gitbrowse
    {
      "<Leader>gB",
      function() Snacks.gitbrowse() end,
      mode = { "n", "v" },
      desc = "Git browse",
    },
    -- rename
    {
      "<Leader>R",
      function() Snacks.rename.rename_file() end,
      desc = "Rename file",
    },
    -- scratch
    {
      "<Leader>.",
      function() Snacks.scratch() end,
      desc = "Toggle scratch buffer",
    },
    {
      "<Leader>S",
      function() Snacks.scratch.select() end,
      desc = "Select scratch buffer",
    },
    -- words
    {
      "]]",
      function() Snacks.words.jump(vim.v.count1) end,
      mode = { "n", "t" },
      desc = "Next reference",
    },
    {
      "[[",
      function() Snacks.words.jump(-vim.v.count1) end,
      mode = { "n", "t" },
      desc = "Prev reference",
    },
    -- zen
    {
      "<Leader>z",
      function() Snacks.zen() end,
      desc = "Toggle zen mode",
    },
  },
}
