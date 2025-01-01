-- File:        cmp.lua
-- Author:      Zakhary Kaplan <https://zakhary.dev>
-- Created:     08 Aug 2021
-- SPDX-License-Identifier: MIT

return {
  -- Auto completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
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
    },
    config = function()
      local cmp  = require("cmp")
      local snip = require("snippy")
      local kind = require("lspkind")

      -- Auto completion
      cmp.setup {
        -- Don't pre-select any item
        preselect = cmp.PreselectMode.None,

        -- Mappings for completions
        mapping = {
          -- Scroll docs
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          -- Popup behaviour
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          -- Select behaviour
          ["<C-n>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Select
          },
          ["<C-p>"] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Select
          },
          ["<Down>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Insert
          },
          ["<Up>"] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Insert
          },
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif snip.can_expand_or_advance() then
              snip.expand_or_advance()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif snip.can_jump(-1) then
              snip.previous()
            else
              fallback()
            end
          end,
          -- Confirm behaviour
          ["<C-y>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          },
          ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
        },

        -- Snippet expansion function
        snippet = {
          expand = function(args)
            snip.expand_snippet(args.body)
          end,
        },

        -- Customize completion menu appearance
        formatting = {
          -- An array of completion fields to specify their order.
          fields = { "kind", "abbr", "menu" },
          -- The function used to customize the appearance of the completion menu.
          format = function(entry, item)
            local symbol = kind.symbol_map[item.kind]
            local kind   = item.kind
            local source = ({
              -- Vim-builtin
              spell                   = "󰓆 ",
              calc                    = "󰃬 ",
              -- Neovim-builtin
              nvim_lua                = " ",
              -- Snippets
              snippy                  = "󰅩 ",
              -- Language Server Protocol
              nvim_lsp                = "󰚔 ",
              nvim_lsp_signature_help = "󰚔 ",
              -- Filesystem
              path                    = " ",
            })[entry.source.name] or "󰇘 "

            item.kind    = symbol
            item.menu    = string.format(" %s (%s)", source, kind)

            return item
          end,
        },

        -- Array of the source configuration to use
        -- (The order will be used to the completion menu's sort order)
        sources = cmp.config.sources(
          { -- Language Server Protocol
            { name = "nvim_lsp" },
            { name = "nvim_lsp_signature_help" },
          },
          { -- Neovim-builtin
            { name = "nvim_lua" },
          },
          { -- Snippets
            { name = "snippy" },
          },
          { -- Vim-builtin
            { name = "spell" },
            { name = "calc" },
          },
          { -- Filesystem
            { name = "path" },
          },
          { -- Extra
          }
        ),

        -- The view class used to customize nvim-cmp's appearance
        view = {
          entries = {
            name = "custom",
            selection_order = "near_cursor",
          }
        },

        -- Window appearance customization
        window = {
          completion    = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          }),
          documentation = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          }),
        },

        -- Enable experimental features
        experimental = {
          ghost_text = true,
        }
      }
    end,
  },
  -- Snippet engine
  {
    "dcampos/nvim-snippy",
    dependencies = {
      "honza/vim-snippets",
    },
    opts = {
      mappings = {
        is = {
          ["<Tab>"] = "expand_or_advance",
          ["<S-Tab>"] = "previous",
        },
        nx = {
          ["<Leader>x"] = "cut_text",
        },
      },
    }
  },
}
