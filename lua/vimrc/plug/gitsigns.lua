-- File:        gitsigns.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     19 Oct 2021
-- SPDX-License-Identifier: MIT

-- Git integration for buffers
return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    -- Set symbols in the sign column.
    signcolumn = true,
    -- Set line number highlights.
    numhl      = false,
    -- Callback called when attaching to a buffer.
    on_attach  = function(bufnr)
      local gs = package.loaded.gitsigns

      -- Set up keymaps
      local function map(mode, lhs, rhs, opts, hint)
        opts = opts or { desc = hint }
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function() gs.next_hunk() end)
        return "<Ignore>"
      end, { expr = true }, "Go to next hunk")
      map("n", "[c", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function() gs.prev_hunk() end)
        return "<Ignore>"
      end, { expr = true }, "Go to previous hunk")

      -- Actions
      map({ "n", "v" }, "<Leader>gs", gs.stage_hunk, nil, "Stage hunk")
      map({ "n", "v" }, "<Leader>gr", gs.reset_hunk, nil, "Reset hunk")
      map("n", "<Leader>gS", gs.stage_buffer, nil, "Stage buffer")
      map("n", "<Leader>gu", gs.undo_stage_hunk, nil, "Stage hunk")
      map("n", "<Leader>gR", gs.reset_buffer, nil, "Reset buffer")
      map("n", "<Leader>gp", gs.preview_hunk, nil, "Preview hunk")
      map("n", "<Leader>gb", function()
        gs.blame_line { full = true }
      end, nil, "Blame line")
      map("n", "<Leader>gb", gs.toggle_current_line_blame, nil, "Toggle blame line")
      map("n", "<Leader>gd", gs.diffthis, nil, "Diff this file")
      map("n", "<Leader>gD", function()
        gs.diffthis("~")
      end, nil, "Diff last commit")
      map("n", "<Leader>gt", gs.toggle_deleted, nil, "Toggle deleted")

      -- Text object
      map({ "o", "x" }, "ih", gs.select_hunk, nil, "Select hunk")
    end,
  },
}
