-- vim.opt.guicursor = "" -- block cursor
vim.opt.clipboard = 'unnamedplus'  -- use system keyboard for yank

vim.opt.nu = true -- set line numbers
vim.opt.relativenumber = true -- use relative line numbers

-- set tab size to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

-- vim.opt.hlsearch = false -- disable highlight on search
vim.opt.incsearch = true -- incremental search

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 500 -- faster completion

vim.opt.colorcolumn = "80" -- set color column at 80 characters
vim.opt.cursorline = true -- highlight the current line

-- set picker_engine to "snacks"
vim.g.lazyvim_picker = "snacks"
