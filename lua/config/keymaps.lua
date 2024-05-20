vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<Esc>', ':noh<CR>', { silent = true })
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set( "n", "<leader>bo", ':%bd|e#|bd#<CR>', { silent = true })
