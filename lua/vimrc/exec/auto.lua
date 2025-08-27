-- File:        auto.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     12 Sep 2020
-- SPDX-License-Identifier: MIT

vimrc.fn.augroup("Vimrc", function(autocmd)
  -- Override formatoptions upon entering a new buffer
  autocmd({ "BufNewFile", "BufWinEnter" }, nil, function()
    vim.opt_local.formatoptions:remove("o")
  end)

  -- When editing a file, always jump to the last known cursor position. Don't
  -- do it when the position is invalid, when inside an event handler (happens
  -- when dropping a file on gvim) and for a commit message (it's likely a
  -- different one than last time).
  autocmd("BufReadPost", nil, function()
    local pos = vim.fn.line("'\"")
    local eol = vim.fn.line("$")
    if pos >= 1 and pos <= eol
        and not vim.bo.filetype:match("commit")
        and not vim.bo.filetype:match("gitrebase")
    then
      vim.cmd.normal { "g`\"", bang = true }
    end
  end)

  -- Replace tabs with spaces on write
  autocmd("BufWritePre", nil, function()
    vim.cmd.retab()
  end)

  -- Automatically close quickfix window after selection
  autocmd("FileType", "qf", function()
    vim.keymap.set("n", "<CR>", "<CR>:cclose<CR>", {
      buffer = true,
      desc = "Select quickfix item"
    })
  end)

  -- When a terminal job is starting, configure the terminal buffer
  autocmd("TermOpen", nil, function()
    -- Disable line numbers in terminal buffers
    vim.wo.number         = false
    vim.wo.relativenumber = false
    -- Enter Terminal-mode automatically
    vim.cmd.startinsert()
  end)

  -- Highlight text on yank
  autocmd("TextYankPost", nil, function()
    vim.highlight.on_yank()
  end)
end)
