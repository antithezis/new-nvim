return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-/>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 1,
        start_in_insert = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "single",
          width = 200,
          height = 50,
          winblend = 3,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
      vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", {})
    end,
  },
  {
    -- install lazygit and add a keymap to open it with <leader>gg in normal mode with toggleterm
    "kdheepak/lazygit.nvim",
    config = function()
      vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", {})
    end,

  }
}
