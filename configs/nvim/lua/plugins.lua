return {
    {
        'IogaMaster/neocord',
        event = "VeryLazy",
        opts = {
            global_timer = true,
            logo = "auto",
            logo_tooltip = "Neovim",
            main_image = "language",
        }
    },
    {
    'powerman/ruscmd.nvim',
    opts = {},
    },
    {
    'Xuyuanp/scrollbar.nvim',
    init = function()
        local group_id = vim.api.nvim_create_augroup('scrollbar_init', { clear = true })

        vim.api.nvim_create_autocmd({ 'BufEnter', 'WinScrolled', 'WinResized' }, {
            group = group_id,
            desc = 'Show or refresh scrollbar',
            pattern = { '*' },
            callback = function()
                require('scrollbar').show()
               end,
            })
    	end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
    },
    {
        "XXiaoA/atone.nvim",
        cmd = "Atone",
        keys = {
            { "<leader>u", "<cmd>Atone<cr>", desc = "Open undo tree" },
        },
        opts = {},
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        opts = {},
    },
    {
        "nvim-pack/nvim-spectre",
        cmd = "Spectre",
        keys = {
            { "<leader>sr", "<cmd>Spectre<cr>", desc = "Search and replace" },
        },
        opts = {},
    },
    {
        "LeonHeidelbach/trailblazer.nvim",
        event = "VeryLazy",
        opts = {
            symbols = {
                enabled = true,
                characters = { "⛰", "🏞️", "🌲" },
            },
        },
        keys = {
            { "gb", function() require("trailblazer").leave_trail_mark() end, desc = "Leave trail mark" },
            { "gt", function() require("trailblazer").track_back() end, desc = "Track back to last mark" },
            { "gT", function() require("trailblazer").track_multiple() end, desc = "Track back multiple marks" },
            { "<leader>tm", function() require("trailblazer").toggle_trail_list_view() end, desc = "Toggle trail list" },
        },
        config = function(_, opts)
            require("trailblazer").setup(opts)
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = { theme = "auto" },
                sections = {
                    lualine_c = { { "filename", path = 1 } },
                    lualine_x = { "encoding", "filetype" },
                },
            })
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        keys = {
            { "<C-\\>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
            { "<C-t>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
        },
        config = function()
            require("toggleterm").setup({
                size = 10,
                open_mapping = [[<C-\>]],
                direction = "horizontal",
            })
        end,
    },
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup()
        end,
    },
}
