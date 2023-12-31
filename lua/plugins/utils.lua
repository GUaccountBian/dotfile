return {
    {
        "rhysd/accelerated-jk",         -- accelerate the moving speed of jk cursor
        config = function()
            vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
            vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
        end,
    },
    {
        "folke/persistence.nvim",       -- automated session management
        config = function()
            require("persistence").setup()
            -- restore the session for the current directory
            vim.keymap.set("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]])
            -- restore the last session
            vim.keymap.set("n", "<leader>ql", [[<cmd>lua require("persistence").load({last = true})<cr>]])
            -- stop Persistence => session won't be saved on exit
            vim.keymap.set("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]])
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        opts = {
            -- check bracket in same line if true
            -- if **next character** is a close pair and it doesn't have an open pair in same line to match,
            -- then it will not add another close pair
            enable_check_bracket_line = false,
        },
    },
    {
        "ethanholz/nvim-lastplace",     -- reopen files at your last edit position
        config = function()
            require('nvim-lastplace').setup {}
        end,
    },
    {
        "folke/flash.nvim",
        config = function()
            require('flash').setup()
            vim.keymap.set( {"n", "x", "o"}, "s",
                function()
                    require('flash').jump({
                        search = {
                            mode = function(str)
                                return "\\<" .. str
                            end,
                        },
                    })
                end
                -- Flash
            )
            vim.keymap.set( {"n", "x", "o"}, "S",
                function()
                    require('flash').treesitter()
                end
                -- Flash Treesitter
            )
            vim.keymap.set("o", "r",
                function()
                    require('flash').remote()
                end
                -- Remote Flash
            )
            vim.keymap.set( {"o", "x"}, "R",
                function()
                    require('flash').treesitter_search()
                end
                -- Treesitter Search
            )
        end,
    },
    {
        "kamykn/spelunker.vim",     -- improves Vim's spell checking function, provide a smarter way to correct
        event = "VeryLazy",
        config = function()
            -- Spellcheck displayed words in buffer
            vim.g.spelunker_check_type = 2
        end,
    },
    {
        "ellisonleao/glow.nvim",    -- A markdown preview directly in nvim
        event = "VeryLazy",
        config = true,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",      -- browse tree like structures (file system ...)
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup()
            -- open the current folder tree
            vim.keymap.set({"n", "v"},"<leader>e",[[<cmd>Neotree toggle<CR>]])
        end
    },
    {
        "folke/which-key.nvim",             -- displays a popup with possible key bindings of the command you started typing
        event = "VeryLazy",
        config = true,
    },
    {
        'echasnovski/mini.ai',
        event = "VeryLazy",
        config = true,
    },
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        config = true,
    },
    {
        "s1n7ax/nvim-window-picker",
        config = function()
            require("window-picker").setup({
                filter_rules = {
                    include_current_win = true,
                    bo = {
                        filetype = { "fidget", "neo-tree" }
                    }
                }
            })
            vim.keymap.set("n",
                "<c-w>p",
                function()
                    local window_number = require('window-picker').pick_window()
                    if window_number then vim.api.nvim_set_current_win(window_number) end
                end
            )
        end
    },
}
