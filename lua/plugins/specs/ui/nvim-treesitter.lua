return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "cpp", "python", "lua", "markdown", "markdown_inline", "yaml", "editorconfig", "bash", "cmake" },
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_hightlighting = false,
      },
      indent = {
        enable = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<TAB>"
        }
      }
    })

    -- Configure folding
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
    vim.wo.foldlevel = 99 -- No folding at default

    local keymap = vim.keymap
    local keymap_opts = {}
    keymap.set("n", "<leader>fc", "zc", keymap_opts)
    keymap.set("n", "<leader>fo", "zo", keymap_opts)
  end,
}
