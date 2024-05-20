return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Notes",
          path = "~/Documents/Obsidian Vault/",
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
        new_notes_location = "current_dir",
        prepend_note_id = true,
        prepend_note_path = false,
      },
    },

    {
      "vhyrro/luarocks.nvim",
      priority = 1000,
      config = true,
      opts = {
        rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
      },
    },
    {
      "rest-nvim/rest.nvim",
      ft = "http",
      dependencies = { "luarocks.nvim" },
      config = function()
        require("rest-nvim").setup()
      end,
      keys = {
        {
          "<leader>rr",
          "<cmd>Rest run<cr>",
          desc = "Run request under the cursor",
        },
        {
          "<leader>rl",
          "<cmd>Rest run last<cr>",
          desc = "Re-run latest request",
        },
      },
    },
  },
}
