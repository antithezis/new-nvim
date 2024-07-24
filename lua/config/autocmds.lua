local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd

autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
    vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
		vim.api.nvim_set_hl(0, "TabLineSelect", { bg = "none" })
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
    "PlenaryTestPopup",
    "help",
    "oil",
    "lspinfo",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "dbout",
    "gitsigns.blame",
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

-- local hl_ns = vim.api.nvim_create_namespace('search')
-- local hlsearch_group = vim.api.nvim_create_augroup('hlsearch_group', { clear = true })
--
-- local function manage_hlsearch(char)
--   local key = vim.fn.keytrans(char)
--   local keys = { '<CR>', 'n', 'N', '*', '#', '?', '/', 'z' }
--
--   if vim.fn.mode() == 'n' then
--     if not vim.tbl_contains(keys, key) then
--       vim.cmd([[ :set nohlsearch ]])
--     elseif vim.tbl_contains(keys, key) then
--       vim.cmd([[ :set hlsearch ]])
--     end
--   end
--
--   vim.on_key(nil, hl_ns)
-- end
--
-- vim.api.nvim_create_autocmd('CursorMoved', {
--   group = hlsearch_group,
--   callback = function()
--     vim.on_key(manage_hlsearch, hl_ns)
--   end,
-- })

vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/", "z", "v" }, vim.fn.keytrans(char))
    if vim.opt.hlsearch:get() ~= new_hlsearch then vim.opt.hlsearch = new_hlsearch end
  end
end, vim.api.nvim_create_namespace "auto_hlsearch")
