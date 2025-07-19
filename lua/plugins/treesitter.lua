return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/playground",
    },
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        lookahead = true,
        ensure_installed = {
          "lua",
          "sql",
          "angular",
          "markdown",
          "javascript",
          "typescript",
        },
        indent = { enable = true },
        highlight = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end
  }
}
