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
        enable = true,
      },
      add_trailing = true,
    },
    filters = {
      git_ignored = false,
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

    keymap.set("n", "<leader>eo", api.tree.toggle,
      { desc = "nvim-tree: Toogle tree" })
    keymap.set("n", "<leader>ef", function()
      api.tree.find_file({ update_root = true, open = true, focus = true, })
    end, { desc = "nvim-tree: Fouc on the" })
  end
}
