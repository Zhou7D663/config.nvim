return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = "nvim-treesitter/nvim-treesitter",
  opts = {
    textobjects = {
      select = {
        enable = true,
        lookahead = false,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["al"] = "@loop.outer",
          ["ai"] = "@loop.inner",
        },
        include_surrounding_whitespace = true
      },
      swap = {
        enable = false,
      },
      move = {
        enable = true,
        set_jumps = false,
        goto_next = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
        },
        goto_previous = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
        }
      }
    }
  },
  config = function(_, opts)
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)

    local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
  end
}
