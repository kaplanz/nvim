-- File:        resession.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     27 Aug 2025
-- SPDX-License-Identifier: MIT

return {
  "stevearc/resession.nvim",
  init = function()
    vimrc.fn.autocmd("VimLeavePre", nil, function()
      -- Always save a special session named "last"
      require("resession").save("last")
    end)
  end,
  opts = {},
  keys = {
    {
      "<Leader>ss", function()
        require("resession").save()
      end,
      desc = "Save session",
    },
    {
      "<Leader>sl", function()
        require("resession").load()
      end,
      desc = "Load session",
    },
    {
      "<Leader>sd", function()
        require("resession").delete()
      end,
      desc = "Delete session",
    },
  },
}
