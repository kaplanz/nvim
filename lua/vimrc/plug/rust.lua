-- File:        rust.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     11 Sep 2023
-- SPDX-License-Identifier: MIT

-- Rust programming language
return {
  "rust-lang/rust.vim",
  ft = "rust",
  init = function()
    vim.g.rust_recommended_style = 0
  end,
}
