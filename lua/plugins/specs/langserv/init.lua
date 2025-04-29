local level = "plugins.specs.langserv"

return {
  require(level .. ".mason"),
  require(level .. ".lspkind"),
  require(level .. ".blink-cmp"),
  require(level .. ".trouble"),
  require(level .. ".lspsaga"),
  require(level .. ".none-ls"),
  require(level .. ".auto-pairs"),
  require(level .. ".comment"),
}
