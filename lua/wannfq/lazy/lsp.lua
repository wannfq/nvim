return {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        -- "hrsh7th/cmp-nvim-lsp",
        "saghen/blink.cmp",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities,
            require("blink.cmp").get_lsp_capabilities({}, false))
        capabilities = vim.tbl_deep_extend("force", capabilities, {
            textDocument = {
                foldingRange = {
                    dynamicRegistration = false,
                    lineFoldingOnly = true
                },
            },
        })
        require("fidget").setup({})
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
                "gopls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    lspconfig[server_name].setup({
                        capabilities = capabilities
                    })
                end,
                -- example overriding default hanler
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                    }
                end,
            }
        })

        vim.diagnostic.config({
            signs = true,
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
