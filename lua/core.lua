vim.g.mapleader = ","


-- Keymaps
vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], { desc = "Me: Back to `Normal` mode when in `Terminal` mode." })


-- Options
-- Line
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- No wrap for long text
vim.opt.wrap = false

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
