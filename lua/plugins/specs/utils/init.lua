local level = "plugins.specs.utils"

return {
  require(level .. ".plenary"),
  require(level .. ".telescope"),
  require(level .. ".gitsigns"),
  require(level .. ".toggleterm"),
  require(level .. ".csvview"),
}
