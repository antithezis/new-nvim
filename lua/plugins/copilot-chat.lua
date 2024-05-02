return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = false, -- Enable debugging
      -- See Configuration section for rest
    },
    event = "VeryLazy",
    keys = {
      {
        "<leader>cch",
        function()
          require("CopilotChat.code_actions").show_help_actions()
        end,
      },
    }

    -- See Commands section for default commands if you want to lazy load on them
  },
}
