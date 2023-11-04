-- Misc Options
vim.opt.number = true
vim.opt.relativenumber = true

-- Indent Settings
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.wrap = true

-- Change Cursor to Block During Insert Mode
vim.opt.guicursor = "i:block"

-- Disable Inlay Hints by Default 
vim.g.hints_enabled = false

-- Add Recursive Search to Path
vim.cmd("set path+=**")
