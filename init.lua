local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

--vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#3B4252", fg = "#5E81AC" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3B4252" })
--vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#3B4252" })
--vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#3B4252" })
