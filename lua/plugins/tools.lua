return {
  { "ThePrimeagen/vim-be-good" },
  { "tpope/vim-surround" },
  { "michaeljsmith/vim-indent-object" },
  { "mbbill/undotree" },
  { "metakirby5/codi.vim" },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux"
    },
    config = function()
      -- vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", {})
      -- vim.keymap.set("n", "<leader>T", ":TestFile<CR>", {})
      -- vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", {})
      -- vim.keymap.set("n", "<leader>l", ":TestLast<CR>", {})
      -- vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", {})
      -- vim.cmd("let test#strategy = 'vimux'")
    end,
  }
}
