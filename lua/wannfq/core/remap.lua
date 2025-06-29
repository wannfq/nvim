vim.keymap.set("n", "N", "Nzzzv") -- previous search
vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- shift current line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- up

 -- append line below to current line
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor centered on jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- scroll down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- scroll up
vim.keymap.set("n", "n", "nzzzv") -- next search result
vim.keymap.set("n", "N", "Nzzzv") -- previous search

-- black hole register
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste (in visual mode)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete 
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- yank (on contents)

-- yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- disable capital Q on normal mode
vim.keymap.set("n", "Q", "<nop>")

-- tmux sessionizer
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>")
-- vim.keymap.set("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
--
-- vim.keymap.set("n", "<leader>f", function()
--     require("conform").format({ bufnr = 0 })
-- end)

-- navigation Quickfix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search text and replace all
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file executable
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })
