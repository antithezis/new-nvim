return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },

    config = function()
      require("neo-tree").setup({
        event_handlers = {
          {
            event = "file_opened",
            handler = function()
              require("neo-tree.command").execute({ action = "close" })
            end,
          },
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
        },
      })
      vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})
      vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    end,
  },

  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require('nvim-tmux-navigation').setup({})
      vim.keymap.set("n", "<C-h>", ":NvimTmuxNavigateLeft<CR>", { silent = true })
      vim.keymap.set("n", "<C-j>", ":NvimTmuxNavigateDown<CR>", { silent = true })
      vim.keymap.set("n", "<C-k>", ":NvimTmuxNavigateUp<CR>", { silent = true })
      vim.keymap.set("n", "<C-l>", ":NvimTmuxNavigateRight<CR>", { silent = true })
    end,
  },
  {
    "stevearc/oil.nvim",
    config = function()
      local oil = require("oil")
      oil.setup()
      vim.keymap.set("n", "-", oil.toggle_float, {})
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  }
}
