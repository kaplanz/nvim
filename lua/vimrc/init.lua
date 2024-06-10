-- File:        init.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     05 Jul 2022
-- SPDX-License-Identifier: MIT

local util = require("vimrc.util")

local M    = {}
_G.vimrc   = M -- make vimrc global

-- Create an augroup
M.augroup  = util.auto.augroup
-- Create an autocmd
M.autocmd  = util.auto.autocmd
-- Create a keymap
M.map      = util.keys.map
-- Global variables
M.vars     = util.vars

-- Set up vimrc
function M.setup()
  -- Builtin
  require("vimrc.vim")
  -- Bootstrap
  require("vimrc.boot")
  -- Modules
  require("vimrc.mod")
end

return M
