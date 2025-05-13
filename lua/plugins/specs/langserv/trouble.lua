return {
  "folke/trouble.nvim",
  opts = {},
  cmd = "Trouble",
  keys = {
    {
      "<leader>xX",
      "<CMD>Trouble diagnostics toggle<CR>",
      desc = "Trouble: Toggle for all diagnostics of the projects.",
    },
    {
      "<leader>xx",
      "<CMD>Trouble diagnostics toggle filter.buf=0<CR>",
      desc = "Trouble: Toggle for diagnositcs of the current buffer.",
    },
    {
      "<leader>xA",
      "<CMD>Trouble lsp toggle<CR>",
      desc =
      "Trouble: Toggle lsp definetions, references, implementations, type definetions, and declarations of the symbol under the cursor.",
    },
    {
      "<leader>xIC",
      "<CMD>Trouble lsp_incoming_calls toggle<CR>",
      desc = "Trouble: Toggle about which functions call the current function."
    },
    {
      "<leader>xOC",
      "<CMD>Trouble lsp_outgoing_calls toggle<CR>",
      desc =
      "Trouble: Toggle about which functions are called by the current function."
    }
  }
}
