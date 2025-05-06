return {
  cmd = { "neocmakelsp", "--stdio" },
  filetypes = { "cmake", "CMakeLists.txt" },
  root_markers = { ".git", "build", "cmake" },
  -- Prohibit diagnostics.
  on_attach = function(client, bufnr)
    client.handlers["textDocument/publishDiagnostics"] = function() end
  end,
  -- Use cmakelang for format and linter
  init_options = {
    format = {
      enable = false,
    },
    lint = {
      enable = false,
    },
    scan_cmake_in_package = true
  }
}
