-- File:        init.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     06 Aug 2021
-- SPDX-License-Identifier: MIT

-- Enable LSP to automatically start
vim.lsp.enable {
  "clangd",
  "html",
  "luals",
  "pyright",
  "ruff",
  "rust_analyzer",
  "sourcekit",
  "ts_ls",
  "ty",
}

-- Override the default configuration
vim.lsp.config("*",
  ---@type vim.lsp.Config
  {
    root_markers = {
      ".git",
    },
    on_attach = function(client, bufnr)
      -- Highlight symbol under cursor.
      if client:supports_method("textDocument/documentHighlight") then
        vim.cmd [[
          hi! link LspReferenceRead  Nayru
          hi! link LspReferenceText  Nayru
          hi! link LspReferenceWrite Nayru
        ]]
        vimrc.fn.augroup("LspDocumentHighlight", function(autocmd)
          autocmd({ "CursorHold", "CursorHoldI" }, nil,
            vim.lsp.buf.document_highlight,
            { buffer = bufnr }
          )
          autocmd("CursorMoved", nil,
            vim.lsp.buf.clear_references,
            { buffer = bufnr }
          )
        end)
      end

      -- Override maps for LSP functions.
      --
      -- These mappings override default vim functionality in the event that a
      -- LSP client is attached, and should not exhibit unexpected behaviour
      -- than if they were used when an LSP client is not attached.
      do
        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, { desc = "Jump to symbol definition" })

        vim.keymap.set("n", "gD", function()
          vim.lsp.buf.type_definition()
        end, { desc = "Jump to type definition" })
      end
    end,
  }
)

-- Customize how diagnostics are displayed
vim.diagnostic.config {
  virtual_text = {
    current_line = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
      [vim.diagnostic.severity.HINT]  = " ",
    },
  },
  float = {
    source = "if_many",
  },
  severity_sort = true,
}

-- Default maps for LSP functions.
--
-- These are mapped unconditionally to avoid different behaviour depending
-- on whether an LSP client is attached. If no client is attached, or if a
-- server does not support a capability, an error message is displayed
-- rather than exhibiting different behaviour.
do
  vim.keymap.set("n", "gre", function()
    vim.diagnostic.open_float()
  end, { desc = "Show diagnostics" })

  vim.keymap.set("n", "grf", function()
    vim.lsp.buf.format { async = true }
  end, { desc = "Format buffer" })

  vim.keymap.set("n", "grh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, { desc = "Toggles inlay hints" })
end
