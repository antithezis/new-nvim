return {
	"rmehri01/onenord.nvim",
	config = function()
    local colors = require("utils.utils").colors
		require("onenord").setup({
			theme = nil,
			borders = false,
			fade_nc = false,
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
				background = false,
				float_background = false,
				cursorline = false,
				eob_lines = true,
			},
			-- Inverse highlight for different groups
			inverse = {
				match_paren = false,
			},
			custom_highlights = {

				VertSplit = { fg = colors.grey14 },
				BufferLineIndicatorSelected = { fg = colors.cyan, bg = colors.bg },
				BufferLineFill = { fg = colors.fg, bg = colors.grey14 },
				WhichKeyFloat = { bg = colors.grey14 },
				GitSignsAdd = { fg = colors.green },
				GitSignsChange = { fg = colors.orange },
				GitSignsDelete = { fg = colors.red },

				NeoTreeNormal = { fg = colors.grey5,bg = colors.grey14 },
				-- NeoTreeFolderIcon = { fg = colors.grey9 },
				-- NeoTreeIndentMarker = { fg = colors.grey12 },

				NormalFloat = { bg = colors.grey15 },
				FloatBorder = { bg = colors.bg, fg = colors.yellow },

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

				LazyGitFloat = { bg = colors.grey14 },
				LazyGitBorder = { bg = colors.grey15, fg = colors.grey15 },

				PmenuSel = { bg = colors.grey12 },
				Pmenu = { bg = colors.grey14 },
				PMenuThumb = { bg = colors.grey16 },
				LspFloatWinNormal = { fg = colors.fg, bg = colors.grey14 },
				LspFloatWinBorder = { fg = colors.grey14 },
			}, -- Overwrite default highlight groups
			custom_colors = {}, -- Overwrite default colors
		})
	end,
}
