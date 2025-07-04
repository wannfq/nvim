return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    event = "VeryLazy",
    config = function()
        local configs = require("nvim-treesitter.configs")
        -- https://github.com/nvim-treesitter/nvim-treesitter
        configs.setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "powershell",
                "elixir",
                "javascript",
                "html",
                "python",
                "typescript",
                "markdown",
                "diff",
                "go",
                "terraform",
                "yaml",
                "json",
                "regex",
                "hcl",
                "bash",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
