local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.component.html" },
  callback = function()
    vim.treesitter.start(nil, "angular")
  end,
})

autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#d2a8ff" })
    vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })

    -- vim.api.nvim_set_hl(0, "LspFloatWinNormal", { bg = "red", fg = "red" })
    -- vim.api.nvim_set_hl(0, "LspFloatWinBorder", { bg = "red", fg = "red" })

    -- TelescopePromptPrefix
    -- TelescopePromptNormal
    -- TelescopeResultsNormal
    -- TelescopePreviewNormal
    -- TelescopePromptBorder
    -- TelescopeResultsBorder
    -- TelescopePreviewBorder
    -- TelescopePromptTitle
    -- TelescopeResultsTitle
    -- TelescopePreviewTitle
  end,
})

autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- close some filetypes with <q>
autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "qf",
    "oil",
    "help",
    "dbout",
    "notify",
    "lspinfo",
    "startuptime",
    "checkhealth",
    "tsplayground",
    "spectre_panel",
    "neotest-output",
    "gitsigns.blame",
    "neotest-summary",
    "PlenaryTestPopup",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", {
      buffer = event.buf,
      silent = true,
      desc = "Quit buffer",
    })
  end,
})

vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/", "z" }, vim.fn.keytrans(char))
    if vim.opt.hlsearch:get() ~= new_hlsearch then vim.opt.hlsearch = new_hlsearch end
  end
end, vim.api.nvim_create_namespace "auto_hlsearch")
