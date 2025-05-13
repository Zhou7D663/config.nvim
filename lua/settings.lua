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
