return {
    {
        "toppair/peek.nvim",
        build = "deno task --quiet build:fast",
        lazy = true,
        event = "VeryLazy",
        config = function()
            local peek = require("peek")
            peek.setup({
                filetype = { 'markdown', 'conf' }
            })
            vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
            vim.api.nvim_create_user_command("PeekClose", peek.close, {})

            vim.keymap.set(
                { "n", "v" },
                "<leader>md",
                function()
                    if peek.is_open() then
                        peek.close()
                    end
                    peek.open()
                end,
                { 
                    desc = "Markdown preview toggle"
                }
            )
        end,
    },
}
