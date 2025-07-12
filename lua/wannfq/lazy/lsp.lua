return {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        require("fidget").setup {}
        require("mason").setup {}
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
                "gopls",
            },
        }

        local signs = {
            ERROR = "", --  
            WARN = " ", --  
            HINT = " ", -- 󰌵  󰮍 
            INFO = " ", --  
        }

        vim.diagnostic.config {
            update_in_insert = true, -- Might impact performance
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = signs.ERROR,
                    [vim.diagnostic.severity.WARN] = signs.WARN,
                    [vim.diagnostic.severity.HINT] = signs.HINT,
                    [vim.diagnostic.severity.INFO] = signs.INFO,
                },
            },
            virtual_text = {
                current_line = true,
                prefix = "",
                -- prefix = function(diagnostic)
                --     local severity = diagnostic.severity
                --     local severityName = vim.diagnostic.severity[severity]
                --     return signs[severityName] or ""
                -- end,
            },
            -- float = {
            --     focusable = false,
            --     style = "minimal",
            --     border = "rounded",
            --     source = "always",
            --     header = "",
            --     prefix = "",
            --     scope = "line",
            -- },
        }
    end,
}
