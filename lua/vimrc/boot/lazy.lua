-- File:        lazy.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     20 Dec 2022
-- SPDX-License-Identifier: MIT

-- Bootstrap `lazy.nvim`
local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(path) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    repo,
    path
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.runtimepath:prepend(path)

-- Setup `lazy.nvim`
require("lazy").setup {
  spec = {
    -- import your plugins
    { import = "vimrc.plug" },
  },
  ui = {
    -- the border to use for the UI window
    border = "rounded",
  },
}
