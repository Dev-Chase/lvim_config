local lsp_nmap = require("user.utils").lsp_nmap

local function set_hints_accordingly()
  if vim.g.hints_enabled then
    require("clangd_extensions.inlay_hints").set_inlay_hints()
  else
    require("clangd_extensions.inlay_hints").disable_inlay_hints()
  end
end

return {
  "p00f/clangd_extensions.nvim",
  opts = {},
  config = function()
    lvim.lsp.on_attach_callback = function(client, _)
      if client.name == "clangd" then
        require("clangd_extensions.inlay_hints").setup_autocmd()
        set_hints_accordingly()

        lsp_nmap("<leader>lh", { function()
          vim.g.hints_enabled = not vim.g.hints_enabled
          set_hints_accordingly()
        end, "Toggle Inlay Hints" })
        lsp_nmap("<leader>lH", { "<cmd>ClangdSwitchSourceHeader<cr>", "Switch Between Header and Source" })
        lsp_nmap("<leader>lI", { "<cmd>ClangdSymbolInfo<cr>", "Clangd Symbol Info" })
      end
    end
  end
}
