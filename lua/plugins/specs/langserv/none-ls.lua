-- Use Mason to install Formatters.
-- Required:
--  stylua

return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    local opts = {
      update_in_insert = true,
      sources = {
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.formatting.prettier.with(
          {
            filetypes = { "markdown" },
          }
        )
      },
    }

    null_ls.setup(opts)

    local keymap = vim.keymap
    local keymap_opts = {}
    keymap.set("n", "<leader>I", "<CMD>NullLsInfo<CR>", keymap_opts)
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
}
