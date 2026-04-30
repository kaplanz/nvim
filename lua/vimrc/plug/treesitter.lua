-- File:        treesitter.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     06 Aug 2021
-- SPDX-License-Identifier: MIT

return {
  -- Treesitter configurations
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  dependencies = {
    -- Show code context
    "nvim-treesitter/nvim-treesitter-context",
    -- Syntax aware text-objects, select, move, swap, and peek support
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
      config = function()
        require("nvim-treesitter-textobjects").setup({
          select = {
            lookahead = true,
          },
          move = {
            set_jumps = true, -- whether to set jumps in the jumplist
          },
        })

        local select = require("nvim-treesitter-textobjects.select")
        local swap   = require("nvim-treesitter-textobjects.swap")
        local move   = require("nvim-treesitter-textobjects.move")

        -- Text object selection
        -- You can use the capture groups defined in textobjects.scm
        vim.keymap.set({ "x", "o" }, "aa", function()
          select.select_textobject("@parameter.outer", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "ia", function()
          select.select_textobject("@parameter.inner", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "ac", function()
          select.select_textobject("@class.outer", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "ic", function()
          select.select_textobject("@class.inner", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "af", function()
          select.select_textobject("@function.outer", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "if", function()
          select.select_textobject("@function.inner", "textobjects")
        end)

        -- Swap text objects
        vim.keymap.set("n", "<M-l>", function()
          swap.swap_next("@parameter.inner")
        end)
        vim.keymap.set("n", "<M-h>", function()
          swap.swap_previous("@parameter.inner")
        end)

        -- Go to next/previous text object
        vim.keymap.set({ "n", "x", "o" }, "]m", function()
          move.goto_next_start({ "@function.outer", "@class.outer" }, "textobjects")
        end)
        vim.keymap.set({ "n", "x", "o" }, "]M", function()
          move.goto_next_end({ "@function.outer", "@class.outer" }, "textobjects")
        end)
        vim.keymap.set({ "n", "x", "o" }, "[m", function()
          move.goto_previous_start({ "@function.outer", "@class.outer" }, "textobjects")
        end)
        vim.keymap.set({ "n", "x", "o" }, "[M", function()
          move.goto_previous_end({ "@function.outer", "@class.outer" }, "textobjects")
        end)
      end,
    },
  },
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    -- A list of parser names, or "all"
    ensure_installed = {},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = {},

    -- Consistent syntax highlighting
    highlight = {
      enable = true,
    },

    -- Declare modules (unused; required by LSP)
    modules = {},

    -- Incremental selection based on the named nodes from the grammar
    incremental_selection = {
      enable = true,
      -- Mappings for incremental selection (visual mappings)
      keymaps = {
        -- Init the node/scope selection
        init_selection    = "<M-w>",
        -- Increment to the upper named parent
        node_incremental  = "<M-w>",
        -- Increment to the upper scope (as defined in locals.scm)
        scope_incremental = "<M-C-w>",
        -- Decrement to the previous node
        node_decremental  = "<M-e>",
      },
    },

    -- Indentation based on treesitter for the `=` operator
    indent = {
      enable = true,
    },
  },
}
