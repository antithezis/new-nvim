return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"angularls",
				"cssls",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
      local lspconfig = require 'lspconfig'
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = require("configs.lsp.servers").to_setup
			for _, server in pairs(servers) do
        local server_opts = {
          capabilities = capabilities,
        }
				local has_custom_opts, server_custom_opts = pcall(require, "config.lsp.settings." .. server)
				if has_custom_opts then
					sever_opts = vim.tbl_extend("force", server_opts, server_custom_opts)
				end
        lspconfig[server].setup(server_opts)
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
}
