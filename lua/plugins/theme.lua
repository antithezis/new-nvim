return {
  "rmehri01/onenord.nvim",

  config = function()
    local colors = {
      bg = "#2e3440",
      fg = "#ECEFF4",
      red = "#bf616a",
      orange = "#d08770",
      yellow = "#ebcb8b",
      blue = "#5e81ac",
      green = "#a3be8c",
      cyan = "#88c0d0",
      magenta = "#b48ead",
      pink = "#FFA19F",
      grey1 = "#f8fafc",
      grey2 = "#f0f1f4",
      grey3 = "#eaecf0",
      grey4 = "#d9dce3",
      grey5 = "#c4c9d4",
      grey6 = "#b5bcc9",
      grey7 = "#929cb0",
      grey8 = "#8e99ae",
      grey9 = "#74819a",
      grey10 = "#616d85",
      grey11 = "#464f62",
      grey12 = "#3a4150",
      grey13 = "#333a47",
      grey14 = "#242932",
      grey15 = "#1e222a",
      grey16 = "#1c1f26",
      grey17 = "#0f1115",
      grey18 = "#0d0e11",
      grey19 = "#020203",
      transparent = "transparent",
    }
    require("onenord").setup({
      theme = nil,  -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
      borders = false, -- Split window borders
      fade_nc = false, -- Fade non-current windows, making them more distinguishable
      -- Style that is applied to various groups: see `highlight-args` for options
      styles = {
        comments = "italic",
        strings = "NONE",
        keywords = "NONE",
        functions = "italic",
        variables = "NONE",
        diagnostics = "underline",
      },
      disable = {
        background = false,   -- Disable setting the background color
        float_background = false, -- Disable setting the background color for floating windows
        cursorline = false,   -- Disable the cursorline
        eob_lines = true,     -- Hide the end-of-buffer lines
      },
      -- Inverse highlight for different groups
      inverse = {
        match_paren = false,
      },
      custom_highlights = {
        VertSplit = { fg = colors.grey14 },
        BufferLineIndicatorSelected = { fg = colors.cyan, bg = colors.bg },
        BufferLineFill = { fg = colors.fg, bg = colors.grey14 },
        NvimTreeNormal = { fg = colors.grey14, bg = colors.grey14 },
        WhichKeyFloat = { bg = colors.grey14 },
        GitSignsAdd = { fg = colors.green },
        GitSignsChange = { fg = colors.orange },
        GitSignsDelete = { fg = colors.red },
        NvimTreeFolderIcon = { fg = colors.grey9 },
        NvimTreeIndentMarker = { fg = colors.grey12 },

        NormalFloat = { bg = colors.grey14 },
        FloatBorder = { bg = colors.grey14, fg = colors.grey10 },

        TelescopePromptPrefix = { bg = colors.grey14 }, -- Icon >
        TelescopePromptNormal = { bg = colors.grey14 },
        TelescopeResultsNormal = { bg = colors.grey15 }, -- List
        TelescopePreviewNormal = { bg = colors.grey16 },

        TelescopePromptBorder = { bg = colors.grey14, fg = colors.grey14 },
        TelescopeResultsBorder = { bg = colors.grey15, fg = colors.grey15 },
        TelescopePreviewBorder = { bg = colors.grey16, fg = colors.grey16 },

        TelescopePromptTitle = { fg = colors.grey14 },
        TelescopeResultsTitle = { fg = colors.grey15 },
        TelescopePreviewTitle = { fg = colors.grey16 },

        PmenuSel = { bg = colors.grey12 },
        Pmenu = { bg = colors.grey14 },
        PMenuThumb = { bg = colors.grey16 },

        LspFloatWinNormal = { fg = colors.fg, bg = colors.grey14 },
        LspFloatWinBorder = { fg = colors.grey14 },
      },               -- Overwrite default highlight groups
      custom_colors = {}, -- Overwrite default colors
    })
  end,
}
