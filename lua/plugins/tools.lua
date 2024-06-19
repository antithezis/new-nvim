return {
  { "ThePrimeagen/vim-be-good" },
  { "tpope/vim-surround" },
  { "michaeljsmith/vim-indent-object" },
  { "mbbill/undotree" },
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
  }
}
