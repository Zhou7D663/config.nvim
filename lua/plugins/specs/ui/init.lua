local level = "plugins.specs.ui"

return {
  require(level .. ".colorschemes"),
  require(level .. ".nvim-web-devicons"),
  require(level .. ".nvim-tree"),
  require(level .. ".lualine"),
  require(level .. ".nvim-treesitter"),
  require(level .. ".bufferline"),
  require(level .. ".rainbow-delimiters"),
  require(level .. ".indent_blankline"),
  require(level .. ".render-markdown"),
}
