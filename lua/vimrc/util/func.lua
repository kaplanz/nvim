-- File:        func.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     12 Sep 2020
-- SPDX-License-Identifier: MIT
-- Vim:         set fdl=0 fdm=marker:

local M

M = {
  -- Create autocmds namespaced within an augroup.
  augroup = function(name, setup)
    local group = vim.api.nvim_create_augroup(name, {})
    setup(function(event, pattern, callback, opts)
      M.autocmd(event, pattern, callback, {
        group = group,
        unpack(opts or {})
      })
    end)
  end,

  -- Create an autocmd in any augroup.
  autocmd = function(event, pattern, callback, opts)
    vim.api.nvim_create_autocmd(event, {
      pattern  = pattern,
      callback = callback,
      unpack(opts or {})
    })
  end,

  -- Register a keymap within the vimrc.
  keymap = function(mode, lhs, rhs, opts, hint)
    opts = opts or { noremap = true, silent = true, desc = hint }
    vim.keymap.set(mode, lhs, rhs, opts)
  end
}

return M
