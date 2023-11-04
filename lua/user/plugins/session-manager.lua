-- Session Management
return {
    "Shatur/neovim-session-manager",
    event = "VeryLazy",
    cmd = "SessionManager",
    enabled = vim.g.resession_enabled ~= true,
    -- keys = { "<leader>s" },
    config = function()
        -- lvim.builtin.which_key.mappings["s"] = {
        --     -- New Desc
        --     desc = "Sessions",

        --     -- New Mappings
        --     l = { "<cmd>SessionManager! load_last_session<cr>", "Load last session" },
        --     s = { "<cmd>SessionManager! save_current_session<cr>", "Save this session" },
        --     d = { "<cmd>SessionManager! delete_session<cr>", "Delete session" },
        --     f = { "<cmd>SessionManager! load_session<cr>", "Search sessions" },

        --     -- Disable Old Mappings
        --     b = {},
        --     c = {},
        --     h = {},
        --     H = {},
        --     M = {},
        --     r = {},
        --     R = {},
        --     t = {},
        --     k = {},
        --     C = {},
        --     p = {},
        -- }
        -- lvim.builtin.which_key.mappings["<leader>s."] = { "<cmd>SessionManager! load_current_dir_session<cr>", "Load current directory session" }
    end
}
