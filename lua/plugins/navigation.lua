return {
  {
    "folke/flash.nvim",
    event = "VeryLazy"
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup({})
    end
  },
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require('nvim-tmux-navigation').setup({})
    end,
  },
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        view_options = {
          show_hidden = true,
        }
      })
    end,
  },

  -- { "nvim-telescope/telescope-ui-select.nvim" },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   tag = "0.1.5",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("telescope").setup({
  --       extensions = {
  --         ["ui-select"] = {
  --           require("telescope.themes").get_dropdown({}),
  --         },
  --       },
  --     })
  --     local builtin = require("telescope.builtin")
  --     vim.keymap.set("n", "<C-p>", builtin.find_files, {})
  --     vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
  --     vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
  --     vim.keymap.set('n', '<leader>ps', function()
  --       builtin.grep_string({ search = vim.fn.input("Grep > ") })
  --     end)
  --     vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  --     require("telescope").load_extension("ui-select")
  --   end,
  -- },
}
