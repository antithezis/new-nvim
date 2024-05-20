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
      vim.keymap.set("n", "<C-h>", ":NvimTmuxNavigateLeft<CR>", {})
      vim.keymap.set("n", "<C-j>", ":NvimTmuxNavigateDown<CR>", {})
      vim.keymap.set("n", "<C-k>", ":NvimTmuxNavigateUp<CR>", {})
      vim.keymap.set("n", "<C-l>", ":NvimTmuxNavigateRight<CR>", {})
    end,
  },
  {
    "stevearc/oil.nvim",
    config = function()
      local oil = require("oil")
      oil.setup()
      vim.keymap.set("n", "-", oil.toggle_float, {})
    end,
  }

}
