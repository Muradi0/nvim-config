-- ================================
-- Basic Neovim Configuration
-- ================================

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Show line numbers
vim.opt.number = true

-- Enable relative line numbers (optional)
vim.opt.relativenumber = true

-- Highlight current line
vim.opt.cursorline = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true

-- Enable auto-indent
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Enable clipboard integration
vim.opt.clipboard = "unnamedplus"

-- Enable search highlighting and incremental search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- ================================
-- Line moving shortcuts (like VS Code)
-- ================================
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>gK', function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })
