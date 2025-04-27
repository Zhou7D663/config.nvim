return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    completions = {
      lsp = {
        enabled = true,
      }
    }
  },
  config = function(_, opts)
    local module = require("render-markdown")
    module.setup(opts)

    local keymap = vim.keymap
    local keymap_opts = {}
    keymap.set("n", "<leader>rt", module.toggle, keymap_opts)
  end
}
