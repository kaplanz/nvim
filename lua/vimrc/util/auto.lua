-- File:        auto.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     12 Sep 2020
-- SPDX-License-Identifier: MIT
-- Vim:         set fdl=0 fdm=marker:

-- Create an autocmd
local function autocmd(event, pattern, callback, opts)
  vim.api.nvim_create_autocmd(event, {
    pattern  = pattern,
    callback = callback,
    unpack(opts or {})
  })
end

-- Create an augroup
local function augroup(name, setup)
  local group = vim.api.nvim_create_augroup(name, {})
  setup(function(event, pattern, callback, opts)
    autocmd(event, pattern, callback, {
      group = group,
      unpack(opts or {})
    })
  end)
end

return {
  -- Create autocmds namespaced within an augroup
  augroup = augroup,
  -- Create an autocmd in any augroup
  autocmd = autocmd,
}
