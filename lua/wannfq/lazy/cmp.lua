return {
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "roobert/tailwindcss-colorizer-cmp.nvim",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
        },

        config = function()
            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For luasnip
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    -- ["<C-Space>"] = cmp.mapping.complete()
                    -- ["<CR>"] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then
                    --         if luasnip.expandable() then
                    --             luasnip.expand()
                    --         else
                    --             cmp.confirm({
                    --                 select = true,
                    --             })
                    --         end
                    --     else
                    --         fallback()
                    --     end
                    -- end),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        -- This little snippet will confirm with tab,
                        -- and if no entry is selected, will confirm the first item
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                cmp.select_next_item(cmp_select)
                            end
                            cmp.confirm()
                        else
                            fallback()
                        end
                    end, { "i", "s", "c", }),

                    -- ["<Tab>"] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then
                    --         cmp.select_next_item(cmp_select)
                    --     elseif luasnip.locally_jumpable(1) then
                    --         luasnip.jump(1)
                    --     else
                    --         fallback()
                    --     end
                    -- end, { "i", "s" }),
                    --
                    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then
                    --         cmp.select_prev_item(cmp_select)
                    --     elseif luasnip.locally_jumpable(-1) then
                    --         luasnip.jump(-1)
                    --     else
                    --         fallback()
                    --     end
                    -- end, { "i", "s" }),
                }),

                sources = cmp.config.sources({
                        { name = 'nvim_lsp' },
                    },
                    {
                        { name = 'buffer' },
                    }
                ),
            })
        end,
    },
}
