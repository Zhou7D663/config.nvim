return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      },
      border = "single",
    },
    log_level = vim.log.levels.DEBUG,
  }
}
