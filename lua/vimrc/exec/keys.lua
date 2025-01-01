-- File:        keys.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     12 Sep 2020
-- SPDX-License-Identifier: MIT

---------------
-- Mapleader --
---------------

-- Change mapleader
vim.g.mapleader = ","
-- Bypass mapleader action
vimrc.fn.keymap("n", "<Leader><Leader>", "<Leader>", nil, "Perform mapleader action")
-- Toggle quickfix
vimrc.fn.keymap("n", "<Leader>q", function()
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
end, nil, "Toggle quickfix window")

---------------
--  Actions  --
---------------

-- Write to file
vimrc.fn.keymap("n", "<C-s>", "<Cmd>update<CR>", nil, "Save buffer")
