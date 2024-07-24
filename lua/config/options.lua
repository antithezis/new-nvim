vim.g.mapleader = " "
vim.g.background = "light"

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.swapfile = false
vim.opt.foldmethod = "manual"
vim.opt.fillchars = { eob = " " }

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append {"@-@"}

vim.updatetime = 50
