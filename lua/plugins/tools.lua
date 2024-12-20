return {
  { "tpope/vim-surround" },
  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-completion" },
  { "kristijanhusak/vim-dadbod-ui" },
  { "michaeljsmith/vim-indent-object" },
  { "mbbill/undotree" },
  { "metakirby5/codi.vim" },
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      local presets = require("markview.presets").headings;
      require("markview").setup({
        headings = presets.glow_center,
        hybrid_modes = { "n" }
      })
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- {
  --   "vim-test/vim-test",
  --   dependencies = {
  --     "preservim/vimux"
  --   },
  --   config = function()
  --     -- vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", {})
  --     -- vim.keymap.set("n", "<leader>T", ":TestFile<CR>", {})
  --     -- vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", {})
  --     -- vim.keymap.set("n", "<leader>l", ":TestLast<CR>", {})
  --     -- vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", {})
  --     -- vim.cmd("let test#strategy = 'vimux'")
  --   end,
  -- }
}
