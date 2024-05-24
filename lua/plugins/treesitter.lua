return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/playground",
    },
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = {
          "typescript",
          "javascript",
          "markdown",
          "angular",
          "lua",
          "http",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
