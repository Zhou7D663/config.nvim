vim.g.mapleader = ","

-- Options
-- Line
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.cinoptions = "g0"

-- No wrap for long text
vim.opt.wrap = true

-- Cursor
vim.opt.cursorline = true
vim.opt.guicursor = "i-t:hor20"

-- Enable mouse
vim.opt.mouse = "a"
vim.opt.mousemoveevent = true

-- True colors
vim.opt.termguicolors = true

-- New windows
vim.opt.splitright = true -- Put the window on the right of the current one
vim.opt.splitbelow = true -- Put the the window below the current one

-- Clipboard
vim.opt.clipboard:append("unnamedplus")
vim.g.clipboard = "osc52"

-- Filetypes
vim.filetype.add({
  extension = {
    ContainerFile = "dockerfile"
  },
  filename = {
    ["CMakeLists.txt"] = "cmake"
  }
})

-- User command
vim.api.nvim_create_user_command("LspInfo", function(opts)
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  local message = ""
  for _, client in ipairs(clients) do
    local server_info = client.server_info
    local version = ""
    if server_info ~= nil then
      version = server_info.version or ""
    end
    message = message .. client.name .. version .. " "
  end
  vim.print(message)
end, {})

-- Autocommand
-- vim.api.nvim_create_augroup("_formatting", { clear = true })
-- vim.api.nvim_create_autocmd(
--   "BufWritePre",
--   {
--     pattern = "*",
--     group = "_formatting",
--     command = "set fixeol",
--   }
-- )

-- User command
vim.api.nvim_create_user_command("Bd", function(opts)
  if not vim.bo.buflisted then
    return
  end

  local cur_buf = vim.api.nvim_get_current_buf()
  local buf_list = vim.api.nvim_list_bufs()
  local next_buf = nil
  for _, buf in ipairs(buf_list) do
    if buf == cur_buf then
      goto continue
    end

    if vim.bo[buf].filetype == "NvimTree" then
      goto continue
    end

    if vim.bo[buf].buflisted then
      next_buf = buf
    end

    ::continue::
  end

  if next_buf ~= nil then
    vim.api.nvim_set_current_buf(next_buf)
  else
    vim.cmd("NvimTreeFocus")
  end

  vim.api.nvim_buf_delete(cur_buf, { force = opts.bang })
end, { bang = true })

-- Keymaps
vim.keymap.set("t", "qq", [[<C-\><C-n>]],
  { desc = "Me: Back to `Normal` mode when in `Terminal` mode." })
vim.keymap.set("v", "<C-k>", function()
    local count = vim.v.count
    -- Move the selected lines up at least one line.
    if count < 2 then
      count = 2
    end
    return ":m '<-" .. count .. "<CR>gv=gv"
  end,
  {
    expr = true,
    desc =
    "Move the selected area up below the specific line, up at least one line which is also the deafult."
  })
vim.keymap.set("v", "<C-j>", function()
    local count = vim.v.count
    -- Move the selected lines down at least on line.
    if count < 1 then
      count = 1
    end
    return ":m '>+" .. count .. "<CR>gv=gv"
  end,
  {
    expr = true,
    desc =
    "Move the selected area down below the specific line, down at least one line which is also the default."
  })
vim.keymap.set("n", "<C-w>>", function()
  local count = vim.v.count
  if count == 0 then
    count = 5
  end
  return ":vertical resize +" .. count .. " <CR>"
end, {
  expr = true,
  desc = "Inscrease the window width by vim.v.count (default 5) lines.",
})
vim.keymap.set("n", "<C-w><", function()
  local count = vim.v.count
  if count == 0 then
    count = 5
  end
  return ":vertical resize -" .. count .. " <CR>"
end, {
  expr = true,
  desc = "Decrease the window width by vim.v.count (default 5) lines.",
})
vim.keymap.set("n", "<C-j>", function()
  local count = vim.v.count
  if count == 0 then
    count = 1
  end
  local buf_listed = {}
  local buf_list = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buf_list) do
    if vim.bo[buf].buflisted then
      table.insert(buf_listed, buf)
    end
  end

  if #buf_listed == 0 then
    return
  end

  if count > #buf_listed then
    count = #buf_listed
  end

  vim.api.nvim_set_current_buf(buf_listed[count])
end)
