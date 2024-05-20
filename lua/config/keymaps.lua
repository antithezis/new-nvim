vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Navigate to the next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Navigate to the previous buffer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<Esc>', ':noh<CR>')

vim.keymap.set( "n", "<leader>bo", ':%bd|e#|bd#<CR>', { desc = "Delete other buffers but the current one" })
