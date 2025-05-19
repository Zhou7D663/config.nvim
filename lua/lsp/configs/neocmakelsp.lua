return {
  cmd = { "neocmakelsp", "--stdio" },
  filetypes = { "cmake" },
  root_markers = { ".git", "build", "cmake" },
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
