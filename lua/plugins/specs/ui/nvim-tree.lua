return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    renderer = {
      indent_markers = {
        enable = true
      }
    }
  },
  config = function(_, opts)
    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup(opts)

    -- Set keymap for universal usage
    local keymap = vim.keymap
    local api = require("nvim-tree.api")

    keymap.set("n", "<leader>e", api.tree.toggle, { desc = "nvim-tree: Toogle tree" })
  end
}
