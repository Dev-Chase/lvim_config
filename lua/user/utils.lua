local M = {}

-- Normal Mode Mappings
function M.nmap(key, val, desc)
    if desc ~= nil then
        lvim.builtin.which_key.mappings[key] = { val, desc }
    end
    vim.keymap.set("n", key, val, {})
end

function M.disable_nmap(key)
    lvim.keys.normal_mode[key] = false
    lvim.builtin.which_key.mappings[key] = {}
end

-- Lsp Normal Mode Mappings
function M.lsp_nmap(key, val)
    lvim.lsp.buffer_mappings.normal_mode[key] = val
end

return M
