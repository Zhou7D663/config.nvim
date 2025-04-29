return {
  {
    "rafamadriz/friendly-snippets"
  },

  {
    "saghen/blink.cmp",
    dependicies = {
      "rafamadriz/friendly",
      "onsails/lspkind.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    version = "*",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback"
        },
        ["<S-Tab>"] = {
          "snippet_backward"
        },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      sources = {
        default = { "lsp", "buffer", "path", "snippets" },
      },

      completion = {
        keyword = {
          range = "prefix",
        },
        menu = {
          auto_show = true,
          draw = {
            treesitter = { "lsp" },
            components = {
              _source_name = {
                width = { max = 30 },
                text = function(ctx)
                  return "[ " .. ctx.kind .. " -- " .. ctx.source_name .. " ]"
                end,
                highlight = "BlinkCmpSource",
              },
              kind_icon = {
                text = function(ctx)
                  local lspkind = require("lspkind")

                  local icon = lspkind.symbolic(ctx.kind, { mode = "symbol" })
                  if string.len(icon) == 0 then
                    return ctx.kind_icon .. ctx.icon_gap
                  end
                  return icon .. ctx.icon_gap
                end,
              },
            },
            columns = {
              { "kind_icon" },
              { "label",       "label_description", gap = 1 },
              { "_source_name" },
            },
          },
          border = "single",
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          },
        },
        trigger = {
          show_on_keyword = true,
          show_on_trigger_character = true,
          show_on_blocked_trigger_characters = { " ", "\n", "\t" },
        },
        documentation = {
          auto_show = true,
          window = {
            border = "single",
          }
        },
      },
    },
    signature = {
      enabled = true,
      window = {
        show_documentation = true,
        border = "single",
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
  opts_extend = { "sources.default" },
}
