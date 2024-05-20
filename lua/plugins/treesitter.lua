return {
  {
    "nvim-treesitter/nvim-treesitter",
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
