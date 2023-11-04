reload("user.plugins.reconfigs.nvim-tree")

return {
    -- No Config Plugins:
    "loctvl842/monokai-pro.nvim",   -- Colorscheme (current)
    "ellisonleao/gruvbox.nvim",     -- Colorscheme
    "sainnhe/sonokai",              -- Colorscheme
    "nvim-tree/nvim-web-devicons",  -- Better Icons
    "max397574/better-escape.nvim", -- Better Escape
    "stevearc/dressing.nvim",       -- Better Input

    -- Lsp Signature while Typing
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        config = function()
            require("lsp_signature").setup({})
        end,
        keys = {
            {
                "<leader>lt",
                function()
                    require("lsp_signature").toggle_float_win()
                end,
                desc = "Toggle Signature Float Window"
            }
        },
    },

    -- Faster Motion
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
        keys = {
            { "s" }, { "S" }
        },
        config = function()
            require("leap").add_default_mappings()
        end
    },

    -- TODO Comment Support
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>ft",
                "<cmd>TodoTelescope<cr>",
                desc = "Quick Fix Todo Comments",
            },
        },
    },

    -- Surrounding Mappings
    {
        "kylechui/nvim-surround",
        -- Use for stability; omit to use `main` branch for the latest features
        version = "*",
        event = "VeryLazy",
        opts = {},
    }, -- Code Block Split and Join
    {
        'Wansmer/treesj',
        keys = {
            { "<leader>m", desc="Toggle Block"},
            { "<leader>j", desc="Join Block" },
            { "<leader>M", desc="Split Block" },
        },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = {},
    },

    -- Always See Block Context
    {
        "nvim-treesitter/nvim-treesitter-context",
        keys = {
            { "[c", function() require("treesitter-context").go_to_context() end, { silent = true } }
        },
        opts = {},
        event = "BufEnter",
    },
    reload("user.plugins.session-manager"),
    reload("user.plugins.zig-tools"),
    reload("user.plugins.clang-extensions"),
}
