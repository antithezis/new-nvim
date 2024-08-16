vim.g.mapleader = " "
vim.g.background = "light"

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.swapfile = false
vim.opt.foldmethod = "manual"
vim.opt.fillchars = { eob = " " }

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 12
-- vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append {"@-@"}

vim.updatetime = 50

local italic_group = {
  -- "Comment",
  "Keyword",
}

for _, group in ipairs(italic_group) do
  vim.api.nvim_command("highlight " .. group .. " cterm=italic gui=italic")
end

vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_force_echo_notifications = 1
vim.g.db_ui_win_position = 'right'
vim.g.db_ui_winwidth = 80

vim.g.db_ui_table_helpers = {
    mysql = {
        Count = "select count(1) from {optional_schema}{table}",
        Explain = "EXPLAIN {last_query}"
    },
    sqlite = {
        Describe = "PRAGMA table_info({table})"
    }
}

vim.g.db_ui_icons = {
    expanded = {
        db = '▾ ',
        buffers = '▾ ',
        saved_queries = '▾ ',
        schemas = '▾ ',
        schema = '▾ פּ',
        tables = '▾ 藺',
        table = '▾ ',
    },
    collapsed = {
        db = '▸ ',
        buffers = '▸ ',
        saved_queries = '▸ ',
        schemas = '▸ ',
        schema = '▸ פּ',
        tables = '▸ 藺',
        table = '▸ ',
    },
    saved_query = '',
    new_query = '璘',
    tables = '離',
    buffers = '﬘',
    add_connection = '',
    connection_ok = '✓',
    connection_error = '✕',
}
