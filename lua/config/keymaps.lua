vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>bo", ':%bd|e#|bd#<CR>', { silent = true })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<C-M-j>", vim.lsp.buf.format, {})

vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", {})

vim.keymap.set("n", "s", function() require("flash").jump() end, {})
vim.keymap.set("n", "S", function() require("flash").treesitter() end, {})
vim.keymap.set("n", "<M-s>", function() require("flash").treesitter_search() end, {})

vim.keymap.set("n", "<M-a>", function() require("harpoon"):list():add() end)
vim.keymap.set("n", "<M-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end)

vim.keymap.set("n", "<M-j>", function() require("harpoon"):list():select(2) end)
vim.keymap.set("n", "<M-h>", function() require("harpoon"):list():select(1) end)
vim.keymap.set("n", "<M-k>", function() require("harpoon"):list():select(3) end)
vim.keymap.set("n", "<M-l>", function() require("harpoon"):list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() require("harpoon"):list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() require("harpoon"):list():next() end)

vim.keymap.set("n", "<C-h>", ":NvimTmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":NvimTmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":NvimTmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":NvimTmuxNavigateRight<CR>", { silent = true })

vim.keymap.set("n", "<C-b>", function() require("oil").toggle_float() end, {})
