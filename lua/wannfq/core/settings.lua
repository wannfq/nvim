-- vim.o.guicursor = "" -- block cursor
vim.o.clipboard = "unnamedplus" -- use system clipborad for yank

vim.o.nu = true -- set line numbers
vim.o.relativenumber = true -- use relative line numbers

vim.g.have_nerd_font = true

-- don't show the mode, since it's already in the status line
-- vim.o.showmode = false

-- case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- set tab size to 4 spaces
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.o.undofile = true

vim.o.hlsearch = false -- disable highlight on search
vim.o.incsearch = true -- incremental search

vim.o.termguicolors = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.isfname:append "@-@"

vim.o.updatetime = 200 -- faster completion
vim.o.timeoutlen = 300

-- vim.o.colorcolumn = "80" -- set color column at 80 characters
vim.o.cursorline = true -- highlight the current line

-- vim.o.list = true
-- vim.o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
