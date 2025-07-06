return {
    'folke/trouble.nvim',
    lazy = true,
    event = { 'BufNewFile', 'BufReadPost' },
    cmd = 'Trouble',
    opts = {
        auto_preview = true,
        modes = {
            test = {
                mode = "diagnostics",
                preview = {
                    type = "split",
                    relative = "win",
                    position = "right",
                    size = 0.3,
                },
            },
        },
    },
    keys = {
        {
            '<leader>xx',
            '<cmd>Trouble diagnostics toggle<cr>',
            desc = 'Diagnostics (Trouble)',
        },
        {
            '<leader>xX',
            '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
            desc = 'Buffer Diagnostics (Trouble)',
        },
        {
            '<leader>cs',
            '<cmd>Trouble symbols toggle focus=false<cr>',
            desc = 'Symbols (Trouble)',
        },
        {
            '<leader>cS',
            '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
            desc = 'LSP Definitions / references / ... (Trouble)',
        },
        {
            '<leader>xl',
            '<cmd>Trouble loclist toggle<cr>',
            desc = 'Location List (Trouble)',
        },
        {
            '<leader>xq',
            '<cmd>Trouble qflist toggle<cr>',
            desc = 'Quickfix List (Trouble)',
        },
        {
            '<leader>xt',
            '<cmd>Trouble todo toggle<cr>',
            desc = 'Todos (Trouble)',
        },
        {
            '<leader>xs',
            function()
                if vim.g.picker_engine == 'fzf' then
                    vim.cmd('Trouble fzf toggle')
                elseif vim.g.picker_engine == 'snacks' then
                    vim.cmd('Trouble snacks toggle')
                else
                    vim.cmd('Trouble telescope toggle')
                end
            end,
            desc = 'Snacks (Trouble)',
        },
        -- Borrowed from LazyVim
        {
            '[q',
            function()
                if require('trouble').is_open() then
                    ---@diagnostic disable-next-line: missing-parameter, missing-fields
                    require('trouble').prev({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cprev)
                    if not ok then vim.notify(err, vim.log.levels.ERROR) end
                end
            end,
            desc = 'Previous Trouble/Quickfix Item',
        },
        {
            ']q',
            function()
                if require('trouble').is_open() then
                    ---@diagnostic disable-next-line: missing-parameter, missing-fields
                    require('trouble').next({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cnext)
                    if not ok then vim.notify(err, vim.log.levels.ERROR) end
                end
            end,
            desc = 'Next Trouble/Quickfix Item',
        },
        {
            '<leader>xQ',
            '<cmd>Trouble close<cr>',
            desc = 'Close Trouble',
        },
    },

    config = function(_, opts)
        local trouble = require('trouble')
        trouble.setup(opts)
        local trouble_config = require('trouble.config')

        -- Add object to list of acceptable objects
        table.insert(trouble_config.get('').modes.symbols.filter.any.kind, 'Object')
    end,
}
