return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", ".git" },
  settings = {
    python = {
      analysis = {
        diagnosticMode = { "openFilesOnly" },
        useLibraryCodeForTypes = true,
      },
      disableOrganizeImports = true,
    }
  }
}
