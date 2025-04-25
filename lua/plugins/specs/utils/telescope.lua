return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      dynamic_preview_title = true,
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)

    local keymap = vim.keymap
    keymap.set("n", "<leader>tf", ":Telescope find_files<CR>")
    keymap.set("n", "<leader>tg", ":Telescope live_grep<CR>")
    keymap.set("n", "<leader>tb", ":Telescope buffers<CR>")
    keymap.set("n", "<leader>th", ":Telescope help_tags<CR>")
  end
}
