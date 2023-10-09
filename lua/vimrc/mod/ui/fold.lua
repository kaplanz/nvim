-- File:        fold.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     09 Oct 2023
-- SPDX-License-Identifier: MIT

----------------
--  Options   --
----------------

vim.opt.foldmethod = "expr"
vim.opt.foldexpr   = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext   = "v:lua.vim.treesitter.foldtext()"
