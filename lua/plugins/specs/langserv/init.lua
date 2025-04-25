local level = "plugins.specs.langserv"

return {
  require(level .. ".lsp"),
  require(level .. ".cmp"),
  require(level .. ".trouble"),
  require(level .. ".lspsaga"),
  require(level .. ".none-ls"),
  require(level .. ".auto-pairs"),
  require(level .. ".comment"),
}
