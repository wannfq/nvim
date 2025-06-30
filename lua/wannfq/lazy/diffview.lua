return {
    "sindrets/diffview.nvim",

    cmd = { "DiffviewOpen", "DiffviewClose" },

    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
    },

    config = function()
        require("diffview").setup({
             keymaps = {
                view = {
                    { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
                },
                file_panel = {
                    { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
                },
                file_history_panel = {
                    { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
                },
            },
        })
    end,
}
