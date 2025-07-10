local theme = "tokyonight"

function ColorMyNvim(color)
    color = color or theme
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.o.background = "dark"
end

return {
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        enabled = theme == "tokyonight",
        priority = 1000,
        config = function()
            require("tokyonight").setup {
                style = "storm", -- Available styles: `storm`, `moon`, a darker variant `night` and `day`
                transparent = true,
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    comments = { italic = true },
                    keywords = { italic = true },
                    -- Background styles. Can be 'dark', 'transparent' or 'normal'
                    sidebars = "dark", -- style for sidebar
                    floats = "dark", -- style for floating windows
                },
                plugins = {
                    lazy = true,
                    blink = true,
                    bufferline = true,
                    gitsigns = true,
                    yanky = true,
                },
            }

            ColorMyNvim()
        end,
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        enabled = theme == "rose-pine",
        priority = 1000,
        config = function()
            require("rose-pine").setup {
                variant = "main",
                disable_background = true,
                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                },
            }

            ColorMyNvim()
        end,
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        enabled = theme == "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup {
                flavour = "macchiato", -- latte, frappe, macchiato, mocha
                no_italics = false,
                styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                },
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    -- nvimtree = true,
                    treesitter = true,
                    notify = true,
                },
            }

            ColorMyNvim()
        end,
    },

    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        enabled = theme == "kanagawa",
        priority = 1000,
        config = function()
            require("kanagawa").setup {
                theme = "wave", -- Load 'wave', 'dragon' or 'lotus' theme
                compile = false, -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = true, -- do not set background color
                dimInactive = false, -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                colors = { -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
            }

            ColorMyNvim()

            local highlights = require "rose-pine.plugins.bufferline"
            require("bufferline").setup { highlights = highlights }
        end,
    },

    {
        "loctvl842/monokai-pro.nvim",
        name = "monokai-pro",
        enabled = theme == "monokai-pro",
        priority = 1000,
        config = function()
            require("monokai-pro").setup {
                filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
                transparent_background = true,
                terminal_colors = true,
                devicons = true, -- highlight the icons of `nvim-web-devicons`
                styles = {
                    comment = { italic = true },
                    keyword = { italic = true }, -- any other keyword
                    type = { italic = true }, -- (preferred) int, long, char, etc
                    storageclass = { italic = true }, -- static, register, volatile, etc
                    structure = { italic = true }, -- struct, union, enum, etc
                    parameter = { italic = true }, -- parameter pass in function
                    annotation = { italic = true },
                    tag_attribute = { italic = true }, -- attribute of tag in reactjs
                },
                inc_search = "background", -- underline | background
                background_clear = {
                    -- 'float_win', 'toggleterm', 'telescope', 'which-key', 'renamer', 'neo-tree', 'nvim-tree', 'bufferline'
                    -- 'bufferline',
                    "float_win",
                    "telescope",
                    "which-key",
                },
                plugins = {
                    bufferline = {
                        underline_selected = false,
                        underline_visible = false,
                    },
                },
            }

            ColorMyNvim()
        end,
    },
}
