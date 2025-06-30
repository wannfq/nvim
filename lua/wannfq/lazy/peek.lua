return {
    {
        "toppair/peek.nvim",
        build = "deno task --quiet build:fast",
        enabled = false,
        event = { "VeryLazy" },
        config = function()
            require("peek").setup({
                filetype = { 'markdown', 'conf' }
            })
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },
}
