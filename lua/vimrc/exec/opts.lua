-- File:        opts.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     05 Jun 2019
-- SPDX-License-Identifier: MIT
-- Vim:         set fdl=0 fdm=marker:

-- Buffers {{{
vim.opt.confirm       = true
vim.opt.undofile      = true
vim.opt.updatetime    = 100
-- }}}

-- Colours {{{
vim.opt.termguicolors = true
-- }}}

-- Completion {{{
vim.opt.completeopt   = { "menuone", "noselect" }
vim.opt.wildoptions:prepend("fuzzy")
-- }}}

-- Cursor {{{
vim.opt.cursorline  = true
vim.opt.whichwrap   = "b,s,<,>,[,]"
-- }}}

-- Editing {{{
vim.opt.textwidth   = 80
-- }}}

-- Folding {{{
vim.opt.foldmethod = "expr"
vim.opt.foldexpr   = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext   = ""
-- }}}

-- Indentation {{{
vim.opt.expandtab   = true
vim.opt.shiftround  = true
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = -1
-- }}}

-- Locations {{{
if vim.fn.executable("rg") then
  -- Use ripgrep as the grep program
  vim.opt.grepprg = "rg --vimgrep --no-heading --hidden --smart-case"
  vim.opt.grepformat:prepend("%f:%l:%c:%m")
end
-- }}}

-- Path {{{
vim.opt.path:append("**")
-- }}}

-- Search {{{
vim.opt.ignorecase = true
vim.opt.smartcase  = true
-- }}}

-- User Interface {{{
vim.opt.fillchars:append {
  diff      = "╱",
  fold      = " ",
  foldclose = "",
  foldsep   = "",
  foldopen  = "",
}
vim.opt.foldcolumn     = "auto:1"
vim.opt.foldlevelstart = 99
vim.opt.list           = true
vim.opt.listchars:append {
  trail    = "·",
  tab      = "--|",
  extends  = "›",
  precedes = "‹",
}
vim.opt.number        = true
vim.opt.pumblend      = 10
vim.opt.scrolloff     = 5
vim.opt.signcolumn    = "yes:1"
vim.opt.showbreak     = "↪ "
vim.opt.showmode      = false
vim.opt.sidescrolloff = 5
vim.opt.title         = true
vim.opt.titlestring   = "%f%( [%M]%)"
vim.opt.winblend      = 10
vim.opt.wrap          = false
-- }}}

-- Window {{{
vim.opt.splitbelow    = true
vim.opt.splitright    = true
-- }}}
