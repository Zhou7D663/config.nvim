return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup()
    vim.keymap.set("n", "<leader>Tf", "<CMD>ToggleTerm direction=float<CR>")
    vim.keymap.set("n", "<leader>Th", "<CMD>ToggleTerm direction=horizontal<CR>")
    vim.keymap.set("n", "<leader>Tv", "<CMD>ToggleTerm direction=vertical<CR>")
    vim.keymap.set("n", "<leader>Tt", "<CMD>ToggleTerm direction=tab<CR>")
  end
}
