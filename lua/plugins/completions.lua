return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-emoji",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "j-hui/fidget.nvim",
    "github/copilot.vim",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("fidget").setup()
    require("mason").setup()
    local luasnip = require("luasnip")

    require("mason-lspconfig").setup({
      ensure_installed = {
        "angularls",
        "tsserver",
        "cssls",
        "lua_ls",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {}
        end
      },
    })

    local cmp = require('cmp')
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      completion = {
        completeopt = "menu,menuone,noinsert", -- ***
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["C-y"] = cmp.mapping.confirm({ select = true })
      }),

      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(_, vim_item)
          vim_item.kind = require("config.utils").icons[vim_item.kind]
          return vim_item
        end
      },

      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vim-dadbod-completion' },
        { name = 'luasnip' },
        { name = 'emoji' },
      }, {
        { name = 'buffer' },
      })
    })

    local diagnostic_signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }
    for _, sign in ipairs(diagnostic_signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    end

    local lsp = {
      float = {
        border = "rounded",
        focusable = true,
        style = "minimal",
      },
      diagnostic = {
        virtual_text = { prefix = "", spacing = 4, },
        underline = true,
        update_in_insert = true,
        severity_sort = true,
        float = {
          border = "rounded",
          focusable = false,
          source = "always",
          style = "minimal",
        }
      }
    }

    vim.diagnostic.config(lsp.diagnostic)
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp.float)
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp.float)
  end,
}
