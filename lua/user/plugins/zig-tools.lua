local nmap = reload("user.utils").nmap

return {
    "NTBBloodbath/zig-tools.nvim",
    -- Load zig-tools.nvim only in Zig buffers
    ft = "zig",
    config = function()
        -- Initialize with default config
        require("zig-tools").setup()
        nmap("<leader>r", function ()
            vim.notify("Running...")
            vim.cmd("Zig run")
        end, "Zig Build - Run")
    end,
    dependencies = {
        "akinsho/toggleterm.nvim",
        {
            "nvim-lua/plenary.nvim",
            module_pattern = "plenary.*"
        }
    },
}
