return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        lazy = true,
        event = "BufReadPost",
    },

    {
        "toppair/peek.nvim",
        build = "deno task --quiet build:fast",
        lazy = true,
        event = "BufReadPost",
        config = function()
            local peek = require("peek")
            peek.setup({
                filetype = { 'markdown', 'conf' }
            })

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
                    desc = "Markdown preview window toggle"
                }
            )
        end,
    },
}
