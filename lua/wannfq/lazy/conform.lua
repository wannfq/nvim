return {
    "stevearc/conform.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("conform").setup {
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 1000,
            },
            formatters_by_ft = {
                javascript = { "prettierd" },
                typescript = { "prettierd" },
                go = { "gofumpt" },
                lua = { "stylua" },
                python = { "black" },
                html = { "prettierd" },
            },
        }
    end,
}
