return {
    "akinsho/bufferline.nvim",
    version = "*",
    lazy = true,
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local bufferline = require("bufferline");
        require("bufferline").setup({
            options = {
                style_preset = {
                    bufferline.style_preset.no_italic,
                    bufferline.style_preset.minimal,
                },
                separator_style = { "", "" },
                max_name_length = 24,
                indicator = {
                    -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    style = "underline",
                },
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        });
    end
}
