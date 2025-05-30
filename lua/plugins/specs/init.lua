local level = "plugins.specs"

return {
  require(level .. ".ui"),
  require(level .. ".langserv"),
  require(level .. ".utils")
}
