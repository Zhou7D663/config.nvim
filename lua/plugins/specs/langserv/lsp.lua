vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      return string.format("%s -- %s", diagnostic.message, diagnostic.source)
    end
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅙",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "󰌵",
      [vim.diagnostic.severity.HINT] = "󰋼",
    },
  },
  update_in_insert = true,
  severity_sort = true,
})

return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        },
        border = "single",
      },
      log_level = vim.log.levels.DEBUG,
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- LSP
      ensure_installed = { "lua_ls", "clangd", "marksman", "yamlls", "bashls" },
      auto_install = false,
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")

      require("mason-lspconfig").setup(opts)
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup {
          }
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup {
            settings = {
              Lua = {
                hint = {
                  enable = true,
                  setType = true,
                },
                completion = {
                  displayContext = 1,
                },
                diagnostics = {
                  neededFileStatus = {
                    ["codestyle-check"] = "Any",
                  },
                  globals = {
                    "vim"
                  }
                },
                format = {
                  enable = true,
                },
              },
            },
          }
        end,
        ["yamlls"] = function()
          lspconfig.yamlls.setup {
            settings = {
              yaml = {
                format = {
                  enable = true,
                  singleQuote = false,
                  printWidth = 80,
                  proseWrap = "Always",
                },
                hover = {
                  enable = true,
                },
                completion = {
                  enable = true,
                },
              },
              editor = {
                tabSize = 2
              },
            }
          }
        end,
        ["bashls"] = function()
          lspconfig.bashls.setup {
            filetypes = { "bash", "sh", "zsh" }
          }
        end,
      })
      local keymap = vim.keymap
      local keymap_ops = {}
      keymap.set("n", "<leader>xw", ":lua vim.diagnostic.open_float({ border = 'single' })<CR>", keymap_ops)
      keymap.set({ "n", "v" }, "<leader>F", vim.lsp.buf.format, keymap_ops)
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
  }
}
