return {
	"rmehri01/onenord.nvim",
	config = function()
		local _M = {}

		_M.colors = {
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

				VertSplit = { fg = _M.colors.grey14 },
				BufferLineIndicatorSelected = { fg = _M.colors.cyan, bg = _M.colors.bg },
				BufferLineFill = { fg = _M.colors.fg, bg = _M.colors.grey14 },
				NvimTreeNormal = { fg = _M.colors.grey14, bg = _M.colors.grey14 },
				WhichKeyFloat = { bg = _M.colors.grey14 },
				GitSignsAdd = { fg = _M.colors.green },
				GitSignsChange = { fg = _M.colors.orange },
				GitSignsDelete = { fg = _M.colors.red },
				NvimTreeFolderIcon = { fg = _M.colors.grey9 },
				NvimTreeIndentMarker = { fg = _M.colors.grey12 },

				NormalFloat = { bg = _M.colors.grey15 },
				FloatBorder = { bg = _M.colors.grey14, fg = _M.colors.grey19 },

				TelescopePromptPrefix = { bg = _M.colors.grey14 }, -- Icon >
				TelescopePromptNormal = { bg = _M.colors.grey14 },
				TelescopeResultsNormal = { bg = _M.colors.grey15 }, -- List
				TelescopePreviewNormal = { bg = _M.colors.grey16 },
				TelescopePromptBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
				TelescopeResultsBorder = { bg = _M.colors.grey15, fg = _M.colors.grey15 },
				TelescopePreviewBorder = { bg = _M.colors.grey16, fg = _M.colors.grey16 },
				TelescopePromptTitle = { fg = _M.colors.grey14 },
				TelescopeResultsTitle = { fg = _M.colors.grey15 },
				TelescopePreviewTitle = { fg = _M.colors.grey16 },

				LazyGitFloat = { bg = _M.colors.grey14 },
				LazyGitBorder = { bg = _M.colors.grey15, fg = _M.colors.grey19 },

				PmenuSel = { bg = _M.colors.grey12 },
				Pmenu = { bg = _M.colors.grey14 },
				PMenuThumb = { bg = _M.colors.grey16 },
				LspFloatWinNormal = { fg = _M.colors.fg, bg = _M.colors.grey14 },
				LspFloatWinBorder = { fg = _M.colors.grey14 },
			}, -- Overwrite default highlight groups
			custom_colors = {}, -- Overwrite default colors
		})
	end,
}
