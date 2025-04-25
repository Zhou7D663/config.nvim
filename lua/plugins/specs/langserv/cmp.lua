return {
  {
    "rafamadriz/friendly-snippets"
  },

  {
    "saghen/blink.cmp",
    dependicies = { "rafamadriz/friendly-snippets" },
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
