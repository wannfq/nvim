return {
    'saghen/blink.cmp',
    version = '1.*',
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { 'rafamadriz/friendly-snippets' },
    opts = {
        keymap = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            -- See :h blink-cmp-config-keymap for defining your own keymap
            preset = 'default',
            ['<c-j>'] = { 'snippet_forward', 'fallback' },
            ['<c-k>'] = { 'snippet_backward', 'fallback' },
        },
        appearance = {
            -- Adjusts spacing to ensure icons are aligned. 'mono' or 'normal'
            nerd_font_variant = 'mono'
        },
        completion = { documentation = { auto_show = true } },
        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
