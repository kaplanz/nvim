-- File:        keys.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     12 Sep 2020
-- SPDX-License-Identifier: MIT

--
--- Leader
--

-- Change mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- Toggle quickfix
vim.keymap.set("n", "<Leader>q", function()
  -- Check if quickfix window is open
  local qfopen = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      qfopen = true
      break
    end
  end
  -- Toggle quickfix window
  if qfopen then
    vim.cmd.cclose()
  else
    vim.cmd.copen()
  end
end, { desc = "Toggle quickfix window" })

--
--- Actions
--

-- Write to file
vim.keymap.set("n", "<Leader>w", vim.cmd.update, { desc = "Save" })
