local function enable_lsp_server(server_name)
  local server_config = require("lsp.configs." .. server_name)
  vim.lsp.config(server_name, server_config)
  vim.lsp.enable(server_name)
end

local function append(to, from)
  for _, v in ipairs(from) do
    table.insert(to, v)
  end
end

vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local severity = vim.diagnostic.severity[diagnostic.severity]
      local source = diagnostic.source
      if source and source:sub(-1) == "." then
        source = source:sub(1, -2)
      end
      return string.format("%s: %s -- %s (%s).", severity, diagnostic.message,
        source or "-", diagnostic.code or "-")
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

vim.g.inlay_hints_visible = true
vim.lsp.inlay_hint.enable()


local servers = { "clangd", "lua-language-server", "bash-language-server",
  "yaml-language-server", "cmake-language-server", "pyright",
  "ruff", "marksman", "dockerfile-language-server" }

for idx = 1, #servers do
  enable_lsp_server(servers[idx])
end

local linters = { "markdownlint", "yamllint", "shellcheck", "hadolint" }
local formatters = { "prettier", "shfmt", "clang-format" }
local integrated = { "cmakelang" }

vim.api.nvim_create_user_command("MeMasonInstallAll", function(opts)
  if not table.unpack then
    ---@diagnostic disable-next-line: deprecated
    table.unpack = unpack
  end
  local args = {}
  append(args, servers)
  append(args, linters)
  append(args, formatters)
  append(args, integrated)

  vim.api.nvim_cmd({
    cmd = "MasonInstall",
    args = args,
  }, { output = true })
end, {})

local keymap = vim.keymap
local keymap_opts = {}
keymap.set("n", "<leader>xw",
  ":lua vim.diagnostic.open_float({ border = 'single' })<CR>", keymap_opts)
keymap.set({ "n", "v" }, "<leader>F", vim.lsp.buf.format, keymap_opts)
keymap.set("n", "<leader>xd", vim.lsp.buf.definition, keymap_opts)
keymap.set("n", "<leader>xD", vim.lsp.buf.declaration, keymap_opts)
