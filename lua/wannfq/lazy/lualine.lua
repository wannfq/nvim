return {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "meuter/lualine-so-fancy.nvim",
    },
    opts = {
        options = {
            theme = "auto",
            component_separators = { left = "│", right = "│" },
            section_separators = { left = "", right = "" },
            globalstatus = true,
            refresh = {
                statusline = 100,
            },
        },
        sections = {
            lualine_a = {
                { 
                    "fancy_mode",
                    width = 8,
                }
            },
            lualine_b = {
                { "fancy_branch" },
                { "fancy_diff" },
            },
            lualine_c = {
                {
                    "fancy_cwd",
                    substitute_home = true,
                },
                -- {
                --     "buffers",
                --     symbols = {
                --         alternate_file = "",
                --     },
                -- },
            },
            lualine_x = {
                { "fancy_macro" },
                { "fancy_diagnostics" },
                { "fancy_searchcount" },
                { "fancy_location" },
            },
            lualine_y = {
                { "fancy_filetype", ts_icon = "" }
            },
            lualine_z = {
                { "fancy_lsp_servers" }
            },
        }
    },
}
