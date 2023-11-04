local utils = reload("user.utils")
local nmap = utils.nmap
local disable_nmap = utils.disable_nmap
local lsp_nmap = utils.lsp_nmap

--- [[ Regular Normal Mode Mappings ]]
-- Config Bindings
lvim.builtin.which_key.mappings["L"].c = {
    function()
        vim.cmd("cd $HOME/.config/lvim")
        vim.cmd("find ./config.lua")
    end,
    "Edit Config"
}
lvim.builtin.which_key.mappings["L"].m = {
    function()
        vim.cmd("cd $HOME/.config/lvim")
        vim.cmd("find ./lua/user/mappings.lua")
    end,
    "Edit Mappings",
}
lvim.builtin.which_key.mappings["L"].h = {"<cmd>nohlsearch<cr>", "No Highlight"}
lvim.builtin.which_key.mappings["L"].q = {"<cmd>qa<cr>", "Quit All"}


-- Session Managing Mappings
lvim.builtin.which_key.mappings["s"] = {
    desc = "Sessions",

    l = { "<cmd>SessionManager! load_last_session<cr>", "Load last session" },
    s = { "<cmd>SessionManager! save_current_session<cr>", "Save this session" },
    d = { "<cmd>SessionManager! delete_session<cr>", "Delete session" },
    f = { "<cmd>SessionManager! load_session<cr>", "Search sessions" },
}
lvim.builtin.which_key.mappings["<leader>s."] = { "<cmd>SessionManager! load_current_dir_session<cr>",
    "Load current directory session" }


-- Nvim-tree Mappings
nmap("o", "<cmd>NvimTreeFocus<cr>", "Focus NvimTree")

-- Change Buffer Mappings
lvim.builtin.which_key.mappings["b"] = {
    desc = "Buffers",
    B = { "<cmd>BufferLinePickClose<cr>", "Pick to Close" },
    b = { "<cmd>BufferLinePick<cr>", "Pick" },
    r = { "<cmd>BufferLineCloseRight<cr>", "Close to Right" },
    l = { "<cmd>BufferLineCloseLeft<cr>", "Close to Left" },
    p = { "<cmd>BufferLineTogglePin<cr>", "Close to Left" },
    d = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by Dir" },
    e = { "<cmd>BufferLineSortByExtension<cr>", "Sort by Extension" },
    D = { "<cmd>BufferLineSortByRelativeDirectory<cr>", "Sort by Relative Dir" },
    t = { "<cmd>BufferLineSortByTabs<cr>", "Sort by Tabs" },
}
nmap("[b", "<cmd>BufferLineCyclePrev<cr>")
nmap("]b", "<cmd>BufferLineCycleNext<cr>")

-- Change ToggleTerm to <C-'> and <M-'>
disable_nmap("<C-\\>")
lvim.keys.term_mode["<C-\\>"] = false

nmap("<C-'>", "<cmd>ToggleTerm<cr>")
nmap("<M-'>", "<cmd>ToggleTerm<cr>")
lvim.keys.term_mode["<C-'>"] = "<cmd>ToggleTerm<cr>"
lvim.keys.term_mode["<M-'>"] = "<cmd>ToggleTerm<cr>"

-- Use <leader>h for Home instead
nmap("<leader>h", ":Alpha<CR>", "Home")

-- Shortcuts for Splitting Screen
nmap("\\", "<cmd>sp<cr>")
nmap("|", "<cmd>vsp<cr>")

nmap("<C-|>", "<cmd>sp<cr>")

nmap("<C-s>", "<cmd>sp<cr>")
nmap("<CS-s>", "<cmd>vsp<cr>")

-- Window Resizing
nmap("<C-=>", "<cmd>resize +3<cr>")
nmap("<C-_>", "<cmd>resize -3<cr>")
nmap("<M-=>", "<cmd>vertical resize +3<cr>")
nmap("<M-->", "<cmd>vertical resize -3<cr>")

-- Line Moving Mappings
nmap("<M-j>", "ddp")
nmap("<M-k>", "dd2kp")
nmap("<MS-j>", "yyp")
nmap("<MS-k>", "yyp")

-- Disable Old Telescope Files
disable_nmap("<leader>f")

-- Enable New Search/Telescope Mappings under <leader>f
lvim.builtin.which_key.mappings["f"] = {
    desc = "Find",
    f = { function() require("telescope.builtin").find_files() end, "Files" },
    b = { function() require("telescope.builtin").buffers() end, "Buffers" },
    B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { function() require("telescope.builtin").grep_string() end, "Word under cursor" },
    C = { function() require("telescope.builtin").commands() end, "commands" },
    F = { function() require("telescope.builtin").find_files({ hidden = true, no_ignore = true }) end, "all files" },
    h = { function() require("telescope.builtin").help_tags() end, "Help" },
    k = { function() require("telescope.builtin").keymaps() end, "Keymaps" },
    m = { function() require("telescope.builtin").man_pages() end, "Man" },
    o = { function() require("telescope.builtin").oldfiles() end, "History" },
    R = { function() require("telescope.builtin").registers() end, "Registers" },
    t = { function() require("telescope.builtin").colorscheme { enable_preview = true } end, "Colorscheme" },
    w = { function() require("telescope.builtin").live_grep() end, "Words" },
    W = {
        function()
            require("telescope.builtin").live_grep {
                additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
            }
        end,
        "Words in all files",
    },
    l = { function() require("telescope.builtin").resume() end, "Resume previous search" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    H = { "<cmd>Telescope highlights<cr>", "Highlight groups" },
}
lvim.builtin.which_key.mappings["f/"] = {
    function() require("telescope.builtin").current_buffer_fuzzy_find() end, "Find words in current buffer" }

-- Lsp Normal Mode Mappings
lsp_nmap("<leader>ld", { vim.diagnostic.open_float, "Hover Diagnostic" })
lsp_nmap("<leader>lD", { require("treesitter.builtin").diagnostics, "Show Diagnostics" })
lsp_nmap("<leaderlI", nil)
lvim.builtin.which_key.mappings["<leader>lI"] = {}
