return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    code_action = {
      show_server_name = true,
      extend_gitsigns = true,
    },
    lightbulb = {
      sign = false,
    },
    outline = {
      keys = {
        toggle_or_jump = "<TAB>",
        jump = "<CR>",
      }
    },
    rename = {
      keys = {
        quit = "<C-q>",
        select = "<TAB>",
      }
    }
  },
  config = function(_, opts)
    require("lspsaga").setup(opts)
    local keymap = vim.keymap
    local keymap_opts = {}

    keymap.set("n", "<leader>xh", "<CMD>Lspsaga hover_doc<CR>", keymap_opts)
    keymap.set("n", "<leader>xc", "<CMD>Lspsaga code_action<CR>", keymap_opts)
    keymap.set("n", "<leader>xO", "<CMD>Lspsaga outline<CR>", keymap_opts)
    keymap.set("n", "<leader>xn", "<CMD>Lspsaga rename<CR>", keymap_opts)
  end
}
