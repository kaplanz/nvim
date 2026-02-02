-- File:        init.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     05 Jul 2022
-- SPDX-License-Identifier: MIT

-- Check if vimrc has already been loaded.
if _G.vimrc then
  goto done
end

-- Declare the global vimrc.
_G.vimrc = {}

-- Import required modules.
_G.vimrc = vim.tbl_extend("error", _G.vimrc, require("vimrc.util"))

-- Load executed configuration.
require("vimrc.exec")
require("vimrc.boot")
require("vimrc.conf")

-- Set the colorscheme
vim.cmd.colorscheme "deku"

-- Return the loaded vimrc.
::done::
return _G.vimrc
