-- File:        telescope.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     06 Aug 2021
-- SPDX-License-Identifier: MIT

-- Fuzzy finder over lists
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "debugloop/telescope-undo.nvim",
  },
  event = "VeryLazy",
  config = function()
    local telescope = require("telescope")

    -- Load extensions
    telescope.load_extension("fzf")
    telescope.load_extension("undo")

    -- Require module setup
    telescope.setup {
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        -- Determines the direction "better" results are sorted towards.
        sorting_strategy = "ascending",
        -- Determines the default layout of Telescope pickers.
        layout_strategy = "flex",
        -- Determines the default configuration values for layout strategies.
        layout_config = {
          -- Horizontal layout has two columns, one for the preview and one for
          -- the prompt and results.
          horizontal = {
            prompt_position = "top",
          },
          -- Vertical layout stacks the items on top of each other.
          vertical = {
            mirror = true,
            prompt_position = "top",
          },
        },
        -- Configure winblend for telescope floating windows.
        winblend = 10,
        -- The character(s) that will be shown in front of Telescope's prompt.
        prompt_prefix = " ",
        -- The character(s) that will be shown in front of the current
        -- selection.
        selection_caret = "❯ ",
        -- Your mappings to override telescope's default mappings.
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            -- ["<C-h>"] = "which_key",
          },
        },
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- Please take a look at the readme of the extension you want to
        -- configure.
      },
    }

    -- Configure mappings
    do
      -- Set up keymaps
      vim.keymap.set("n", "<F1>",  function()
        require("telescope.builtin").help_tags()
      end, { desc = "List help tags" })
      vim.keymap.set("n", "<M-b>", function()
        require("telescope.builtin").buffers()
      end, { desc = "List buffers" })
      vim.keymap.set("n", "<M-f>", function()
        require("telescope.builtin").find_files()
      end, { desc = "List files" })
      vim.keymap.set("n", "<M-F>", function()
        require("telescope.builtin").find_files { hidden = true }
      end, { desc = "List hidden files" })
      vim.keymap.set("n", "<M-o>", function()
        require("telescope.builtin").oldfiles()
      end, { desc = "List oldfiles" })
      vim.keymap.set("n", "<M-g>", function()
        require("telescope.builtin").live_grep()
      end, { desc = "Live grep" })
      vim.keymap.set("n", "<M-s>", function()
        require("telescope.builtin").builtin()
      end, { desc = "Launch telescope" })
      vim.keymap.set("n", "<M-S>", function()
        require("telescope.builtin").resume()
      end, { desc = "Resume telescope" })
      vim.keymap.set("n", "<M-u>", function()
        require("telescope-undo").undo()
      end, { desc = "View undo tree" })
    end
  end,
}
