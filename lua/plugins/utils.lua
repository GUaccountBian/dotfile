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
        config = function()
            -- Spellcheck displayed words in buffer
            vim.g.spelunker_check_type = 2
        end,
    },
    {
        "ellisonleao/glow.nvim",    -- A markdown preview directly in nvim
        config = true,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup()
            vim.keymap.set({"n", "v"},"<leader>e",[[<cmd>Neotree toggle<CR>]])
        end
    },
    {
        "folke/which-key.nvim",
        config = true,
    },
    {
        'echasnovski/mini.ai',
        config = true,
    },
    {
        "echasnovski/mini.comment",
        config = true,
    },
}
