return {
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			local function button(sc, txt, keybind, keybind_opts)
				local b = dashboard.button(sc, txt, keybind, keybind_opts)
				b.opts.hl = "DashboardShortCut"
				b.opts.hl_shortcut = "DashboardHeader"
				return b
			end

			dashboard.section.header.val = {
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                     ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
			}

			dashboard.section.buttons.val = {
				button("הּ f f", "  Find File", "<cmd>Telescope find_files<cr>"),
				button("הּ f o", "  Recents", "<cmd>Telescope oldfiles<cr>"),
				button("הּ f g", "  Find Word", "<cmd>Telescope live_grep<cr>"),
				button("הּ f m", "  Bookmarks", "<cmd>Telescope marks<cr>"),
			}
			dashboard.section.footer.val = "github.com/antithezis"
			dashboard.section.footer.opts.hl = "DashboardFooter"

			alpha.setup(dashboard.opts)
		end,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local lualine = require("lualine")
			local colors = require("configs.utils").colors
			local mode_color = {
				n = colors.cyan,
				i = colors.green,
				v = colors.magenta,
				c = colors.red,
				no = colors.magenta,
				s = colors.orange,
				[""] = colors.orange,
				ic = colors.yellow,
				R = colors.magenta,
				Rv = colors.magenta,
				cv = colors.red,
				ce = colors.red,
				r = colors.cyan,
				rm = colors.cyan,
				["r?"] = colors.cyan,
				["!"] = colors.red,
				t = colors.red,
			}

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
			}

			local config = {
				options = {
					globalstatus = true,
					component_separators = "",
					section_separators = "",
					theme = {
						normal = { c = { fg = colors.grey9, bg = colors.grey13 } },
						inactive = { c = { fg = colors.grey9, bg = colors.bg } },
					},
				},
				sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_v = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
			}

			local function ins_left(component)
				table.insert(config.sections.lualine_c, component)
			end

			local function ins_right(component)
				table.insert(config.sections.lualine_x, component)
			end

			local function ins_left_inactive(component)
				table.insert(config.inactive_sections.lualine_c, component)
			end

			local function ins_right_inactive(component)
				table.insert(config.inactive_sections.lualine_x, component)
			end

			ins_left({
				function()
					vim.api.nvim_command("hi LualineViModeStart guibg=" .. mode_color[vim.fn.mode()])
					return " "
				end,
				color = "LualineViModeStart",
				padding = { right = 0 },
			})

			ins_left({
				function()
					vim.api.nvim_command(
						"hi LualineViMode guifg="
							.. mode_color[vim.fn.mode()]
							.. " guibg="
							.. colors.grey14
							.. " gui=bold cterm=bold"
					)
					return require("lualine.utils.mode").get_mode()
				end,
				icons_enabled = true,
				color = "LualineViMode",
				padding = { right = 1, left = 1 },
			})

			ins_left({
				function()
					return powerline.right
				end,
				color = { fg = colors.grey14, bg = colors.grey13 },
				padding = 0,
			})

			ins_left({
				"filetype",
				fmt = string.upper,
				icons_enabled = true,
				color = { fg = colors.grey9, bg = colors.grey13 },
			})

			ins_left({
				"filename",
				cond = conditions.buffer_not_empty,
				color = { fg = colors.grey9, gui = "italic" },
			})

			ins_left({
				"filesize",
				icon = "",
				cond = conditions.buffer_not_empty,
				color = { fg = colors.grey9 },
			})

			-- ins_left { "location", icon = "", color = { fg = colors.grey9 } }

			-- ins_left { "progress", color = { fg = colors.grey9, gui = "bold" } }

			ins_left({
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				diagnostics_color = {
					color_error = { fg = colors.red },
					color_warn = { fg = colors.yellow },
					color_info = { fg = colors.cyan },
				},
			})

			ins_left({
				function()
					return "%="
				end,
			})

			ins_right({
				function()
					local msg = "No Active Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end

					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes

						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				icon = "",
				cond = conditions.buffer_not_empty,
				color = { fg = colors.grey9 },
			})

			-- Add components to right sections
			ins_right({
				"o:encoding",
				fmt = string.upper,
				cond = conditions.buffer_not_empty,
				color = { fg = colors.grey9 },
			})

			ins_right({
				"fileformat",
				fmt = string.upper,
				cond = conditions.buffer_not_empty,
				icons_enabled = true,
				color = { fg = colors.grey9 },
			})

			ins_right({
				function()
					return vim.opt.tabstop:get()
				end,
				icon = "הּ",
				cond = conditions.buffer_not_empty,
				color = { fg = colors.grey9 },
			})

			ins_right({
				function()
					return powerline.left
				end,
				color = { fg = colors.grey14, bg = colors.grey13 },
				cond = conditions.check_git_workspace,
				padding = 0,
			})

			ins_right({
				"branch",
				icon = "",
				cond = conditions.check_git_workspace,
				color = { fg = colors.magenta, bg = colors.grey14, gui = "bold" },
			})

			ins_right({
				"diff",
				symbols = { added = " ", modified = " ", removed = " " },
				diff_color = {
					added = { fg = colors.green, bg = colors.grey14 },
					modified = { fg = colors.orange, bg = colors.grey14 },
					removed = { fg = colors.red, bg = colors.grey14 },
				},
			})

			ins_right({
				function()
					vim.api.nvim_command("hi LualineViModeEnd guibg=" .. mode_color[vim.fn.mode()])
					return " "
				end,
				color = "LualineViModeEnd",
				padding = { right = 0 },
			})

			-- Inactive
			ins_left_inactive({
				function()
					return " "
				end,
				color = { bg = colors.grey9 },
				padding = { right = 0 },
			})

			ins_left_inactive({
				"filename",
				cond = conditions.buffer_not_empty,
				color = { fg = colors.grey9, bg = colors.grey14, gui = "bold" },
			})

			ins_left_inactive({
				function()
					return powerline.right
				end,
				color = { fg = colors.grey14, bg = colors.bg },
				padding = 0,
			})

			lualine.setup(config)
		end,
	},
	{
		"rmehri01/onenord.nvim",
		config = function()
			local colors = require("configs.utils").colors
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

					NeoTreeNormal = { fg = colors.grey5, bg = colors.grey14 },
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
	},
}
