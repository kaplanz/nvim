-- File:        blink.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     09 Apr 2025
-- SPDX-License-Identifier: MIT

return {
  "saghen/blink.cmp",
  dependencies = {
    -- Plugins
    {
      'saghen/blink.compat',
      lazy = true,
      opts = {},
    },
    -- Sources
    "ribru17/blink-cmp-spell",
    "hrsh7th/cmp-calc",
    -- Snippets
    "rafamadriz/friendly-snippets",
  },
  -- use a release tag to download pre-built binaries
  version = "1.*",

  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    -- "default" (recommended) for mappings similar to built-in completions (C-y to accept)
    -- "super-tab" for mappings similar to vscode (tab to accept)
    -- "enter" for enter to accept
    -- "none" for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset      = "default",
      -- Don't overwrite digraph
      ["<C-k>"]   = { "fallback" },
      -- Accept on enter
      ["<CR>"]    = { "accept", "fallback" },
      -- Select on tab
      ["<Tab>"]   = { "snippet_forward", "select_next", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
    },

    -- Behaviour on command-line
    cmdline = {
      completion = {
        list = {
          selection = {
            preselect = false,
          },
        },
        menu = {
          auto_show = true,
        },
      },
    },

    -- Completion behaviour
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        window = {
          border = "solid",
        },
      },
      ghost_text = {
        enabled = true,
      },
      list = {
        selection = {
          auto_insert = false,
          preselect = true,
        },
      },
      menu = { border = "none" },
    },

    -- Signatures help support
    signature = {
      enabled = true,
    },

    -- Completion sources
    sources = {
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
        "spell",
        "calc",
      },
      providers = {
        -- builtin spellcheck
        spell = { module = "blink-cmp-spell" },
        -- express calculator
        calc = { name = "calc", module = "blink.compat.source" },
      },
    },
  },
  opts_extend = { "sources.default" }
}
