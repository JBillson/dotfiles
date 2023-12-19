vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { noremap = true, silent = true })

