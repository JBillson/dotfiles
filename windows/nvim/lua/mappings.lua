-- SETTINGS
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set autoindent")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set incsearch")
vim.cmd("set scrolloff=10")
vim.cmd("set visualbell")
vim.cmd("set noerrorbells")

-- CUSTOM MAPPINGS
vim.g.mapleader = " "

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<c-q>', 'close<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>so', ':source ~/.config/nvim/lua/mappings.lua<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>H', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>V', ':vsplit<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>y', '"*y', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', '"*p', { noremap = true, silent = true })
