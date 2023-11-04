local lsp_nmap = require("user.utils").lsp_nmap

return {
    "p00f/clangd_extensions.nvim",
    opts = {},
    config = function()
        lvim.lsp.on_attach_callback = function(client, _)
            if client.name == "clangd" then
                require("clangd_extensions.inlay_hints").setup_autocmd()
                require("clangd_extensions.inlay_hints").set_inlay_hints()
                lsp_nmap("<leader>lh", { function()
                    require("clangd_extensions.inlay_hints").toggle_inlay_hints()
                end, "Toggle Inlay Hints" })
                lsp_nmap("<leader>lH", { "<cmd>ClangdSwitchSourceHeader<cr>", "Switch Between Header and Source" })
                lsp_nmap("<leader>lI", {"<cmd>ClangdSymbolInfo<cr>", "Clangd Symbol Info"})
            end
        end
    end
}
