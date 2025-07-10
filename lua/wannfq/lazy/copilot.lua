return {
    "github/copilot.vim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        -- Block the normal Copilot suggestions
        vim.api.nvim_create_augroup("github_copilot", { clear = true })
        vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
            group = "github_copilot",
            callback = function(args)
                vim.fn["copilot#On" .. args.event]()
            end,
        })
        vim.fn["copilot#OnFileType"]()
    end,
}
