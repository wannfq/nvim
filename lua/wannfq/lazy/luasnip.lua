return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    lazy = true,
    build = "make install_jsregexp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        require("luasnip.loaders.from_vscode").load({})
    end
}
