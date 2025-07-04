local theme = "tokyonight"
 
function ColorMyNvim(color)
	color = color or theme
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        enabled = theme == "tokyonight",
        config = function()
            require("tokyonight").setup({
                style = "storm", -- Available styles: `storm`, `moon`, a darker variant `night` and `day`
                transparent = true,
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    comments = { italic = false },
                    keywords = { italic = true },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
            })

            ColorMyNvim();
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        enabled = theme == "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                },
            })

            ColorMyNvim();
        end
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        enabled = theme == "catppuccin",
        config = function()
            require('catppuccin').setup({
                no_italics = true,
                styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                },
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = true,
                }
            })

            ColorMyNvim();
        end
    },
}
