vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local severity = vim.diagnostic.severity[diagnostic.severity]
      local source = diagnostic.source
      if source:sub(-1) == "." then
        source = source:sub(1, -2)
      end
      return string.format("%s: %s -- %s (%s).", severity, diagnostic.message,
        source, diagnostic.code)
    end
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅙",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "󰋼",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
  update_in_insert = true,
  severity_sort = true,
})

local function enable_lsp_server(server_name)
  local server_config = require("lsp.configs." .. server_name)
  vim.lsp.config(server_name, server_config)
  vim.lsp.enable(server_name)
end

local servers = { "clangd", "lua_ls", "bashls", "yamlls", "neocmake", "ruff" }

for idx = 1, #servers do
  enable_lsp_server(servers[idx])
end

local linters = { "markdownlint", "yamllint", "shellcheck" }
local formatters = { "prettier", "shfmt", "clang-format" }
local integrated = { "cmakelang" }

vim.api.nvim_create_user_command("MeMasonInstallAll", function(opts)
  if not table.unpack then
    table.unpack = unpack
  end
  local args = { table.unpack(servers), table.unpack(linters), table.unpack(
    formatters), table.unpack(integrated) }
  vim.api.nvim_cmd({
    cmd = "MasonInstall",
    args = args,
  }, { output = true })
end, {})

local keymap = vim.keymap
local keymap_ops = {}
keymap.set("n", "<leader>xw",
  ":lua vim.diagnostic.open_float({ border = 'single' })<CR>", keymap_ops)
keymap.set({ "n", "v" }, "<leader>F", vim.lsp.buf.format, keymap_ops)
