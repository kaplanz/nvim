-- File:        cmp.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Sep 2023
-- SPDX-License-Identifier: MIT

return {
  -- Auto completion
  { "hrsh7th/nvim-cmp", dependencies = {
    -- Vim-builtin
    "f3fora/cmp-spell",
    "hrsh7th/cmp-calc",
    -- Neovim-builtin
    "hrsh7th/cmp-nvim-lua",
    -- Snippets
    "dcampos/cmp-snippy",
    -- Language Server Protocol
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    -- Filesystem
    "hrsh7th/cmp-path",
  } },

  -- Snippet engine
  { "dcampos/nvim-snippy", dependencies = {
      "honza/vim-snippets",
  } },
}
